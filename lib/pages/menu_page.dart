import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.person),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/anggota');
                    },
                    child: Text('Daftar Anggota'),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(150,30),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16,),
            Container(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.timer_rounded),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/stopwatch');
                    },
                    child: Text('Stopwatch'),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(150,30),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16,),
            Container(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.link_rounded),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/situs');
                    },
                    child: Text('Situs Rekomend'),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(150,30),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16,),
            Container(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.favorite_rounded),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/favorite');
                    },
                    child: Text('Favorite'),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(150,30),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
