import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'situs_page.dart';
class FavoriteListPage extends StatefulWidget {
  const FavoriteListPage({Key? key}) : super(key: key);

  @override
  _FavoriteListPageState createState() => _FavoriteListPageState();
}

class _FavoriteListPageState extends State<FavoriteListPage> {
  late SharedPreferences _prefs;
  late List<Site> _favoriteSites;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() async {
    _prefs = await SharedPreferences.getInstance();

    setState(() {
      List<String> favoriteSites = _prefs.getStringList('favorites') ?? [];

      _favoriteSites = _sites.where((site) => favoriteSites.contains(site.url)).toList();
    });
  }

  Widget _buildFavoriteItem(BuildContext context, int index) {
    final Site site = _favoriteSites[index];

    return ListTile(
      title: Text(site.name),
      subtitle: Text(site.url),
      onTap: () => launch(site.url),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Sites'),
      ),
      body: ListView.builder(
        itemCount: _favoriteSites.length,
        itemBuilder: _buildFavoriteItem,
      ),
    );
  }
}
