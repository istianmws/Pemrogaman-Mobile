import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'calculator.dart';
import 'biodata.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  // sign user out
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout)
        )
      ]),

      body: Center(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 35),
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const DataPage())
              );
            }, child: Text("Data Kelompok"),
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 35),
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const CalculatorPage())
              );
            }, child: Text("Calculator"),
            ),
          )

        ],
      ))

    );
  }
}
