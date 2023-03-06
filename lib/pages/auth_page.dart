import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:praktpm1/pages/login_page.dart';

import 'home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          //login succes
          if (snapshot.hasData){
            return HomePage();
          }
          else{
            return LoginPage();
          }

        },
      ),
    );
  }
}
