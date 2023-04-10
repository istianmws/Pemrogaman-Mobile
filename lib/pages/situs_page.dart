import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'favorit_page.dart';


class Site {
  String name;
  String url;
  bool isFavorite;

  Site({required this.name, required this.url, this.isFavorite = false});
}

class SitusPage extends StatefulWidget {
  const SitusPage({Key? key}) : super(key: key);

  @override
  _SitusPageState createState() => _SitusPageState();
}

class _SitusPageState extends State<SitusPage> {
  late List<Site> _sites;
  late SharedPreferences _prefs;
  List<Site> _getFavoriteSites() {
    return _sites.where((site) => site.isFavorite).toList();
  }

  @override
  void initState() {
    super.initState();
    _loadSites();
  }

  void _loadSites() async {
    _prefs = await SharedPreferences.getInstance();

    setState(() {
      _sites = [
        Site(name: 'Google', url: 'https://www.google.com'),
        Site(name: 'Facebook', url: 'https://www.facebook.com'),
        Site(name: 'Twitter', url: 'https://twitter.com'),
        Site(name: 'LinkedIn', url: 'https://www.linkedin.com'),
      ];

      // Check if a site has been marked as favorite and update the list
      for (Site site in _sites) {
        site.isFavorite = _prefs.getBool(site.url) ?? false;
      }
    });
  }

  void _toggleFavorite(Site site) async {
    setState(() {
      site.isFavorite = !site.isFavorite;
    });

    await _prefs.setBool(site.url, site.isFavorite);
  }

  Widget _buildSiteItem(BuildContext context, int index) {
    final Site site = _sites[index];

    return ListTile(
      title: Text(site.name),
      subtitle: Text(site.url),
      trailing:
      //IconButton(
        //icon: site.isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
        //onPressed: () => _toggleFavorite(site),
      //),
      IconButton(
        icon: site.isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
        onPressed: () => _toggleFavorite(site),
      ),
      onTap: () => launch(site.url),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommended Sites'),
      ),
      body: ListView.builder(
        itemCount: _sites.length,
        itemBuilder: _buildSiteItem,

      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final favoriteSites = _getFavoriteSites();
          final route = MaterialPageRoute(
            builder: (context) => FavoriteSitesPage(favoriteSites: favoriteSites),
          );
          Navigator.push(context, route);
        },
        label: const Text('Favorites'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      persistentFooterButtons: [
        FloatingActionButton(
          onPressed: () async {
            final site = await _showAddSiteDialog();
            if (site != null) {
              setState(() {
                _sites.add(site);
              });
              await _prefs.setBool(site.url, site.isFavorite);
            }
          },
          child: Icon(Icons.add),
          tooltip: 'Tambah Situs',
        ),
      ],

    );
  }
  Future<Site?> _showAddSiteDialog() async {
    final nameController = TextEditingController();
    final urlController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return showDialog<Site>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Site'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: urlController,
                  decoration: InputDecoration(labelText: 'URL'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'URL is required';
                    }
                    if (!Uri.parse(value).isAbsolute) {
                      return 'Invalid URL';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final site = Site(
                    name: nameController.text,
                    url: urlController.text,
                  );
                  Navigator.of(context).pop(site);
                }
              },
            ),
          ],
        );
      },
    );
  }

}

