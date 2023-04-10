import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:praktpm1/pages/biodata_page.dart';
import 'package:praktpm1/pages/help_page.dart';
import 'package:praktpm1/pages/menu_page.dart';
import 'package:praktpm1/pages/stopwatch_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  // sign user out
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }
  int _selectedPageIndex = 1;

  List<Widget> _pages = [
    MenuPage(),
    HelpPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar:
      AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Hi ${user.email!}",
                  style: TextStyle(fontSize: 10,),),
              ),
            ),
          ),
          actions: [IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout)
        )
      ]),

      body: SafeArea(child: _pages[_selectedPageIndex]),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedPageIndex,
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        color: Colors.blue,
        items: <Widget>[
          Icon(Icons.home_rounded, size: 30,color: Colors.white,),
          Icon(Icons.help_center_rounded, size: 30,color: Colors.white),
          Icon(Icons.logout_rounded, size: 30,color: Colors.white),
        ],
        onTap: (int index) {
          if (index == 2) {
            signUserOut();
          }else{
            setState(() {
              _selectedPageIndex = index;
            });
          }
        },
          //Handle button tap

      ),
    );
  }
}
