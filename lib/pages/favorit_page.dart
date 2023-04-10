import 'package:flutter/material.dart';

import 'situs_page.dart';
class FavoriteSitesPage extends StatelessWidget {
  final List<Site> favoriteSites;

  const FavoriteSitesPage({Key? key, required this.favoriteSites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Sites'),
      ),
      body: ListView.builder(
        itemCount: favoriteSites.length,
        itemBuilder: (context, index) {
          final Site site = favoriteSites[index];
          return ListTile(
            title: Text(site.name),
            subtitle: Text(site.url),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }
}
