import 'package:flutter/material.dart';
import 'package:praktpm1/pages/biodata_page.dart';
import 'package:praktpm1/pages/favorit_page.dart';
import 'package:praktpm1/pages/situs_page.dart';
import 'package:praktpm1/pages/stopwatch_page.dart';
import 'pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/anggota': (context) => BiodataPage(),
        '/stopwatch': (context) => StopwatchPage(),
        '/situs': (context) => SitusPage(),
        '/favorite': (context) => FavoriteSitesPage(favoriteSites: [],),
      },
      debugShowCheckedModeBanner: false,
      home: AuthPage(),

    );
  }
}