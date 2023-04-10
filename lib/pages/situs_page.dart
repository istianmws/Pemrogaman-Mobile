import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


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
      trailing: IconButton(
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
    );
  }
}

