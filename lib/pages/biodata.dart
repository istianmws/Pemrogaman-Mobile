import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataPage extends StatelessWidget {
  const DataPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Kelompok"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Nama dan NIM Kelompok',
            style: TextStyle(
                fontSize: 35,
                color: Colors.teal,
                fontWeight: FontWeight.bold
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Text(
                    '1. Rakha Mohammad Aryaputra - 123190109',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                SizedBox(height: 30,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Text(
                    '2. Istian Muhammad Wahyu Setiawan - 123190107',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                SizedBox(height: 30,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Text(
                    '3. Muhammad Patty Amal Madani - 123190121',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                SizedBox(height: 30,),

              ],
            ),
          )
        ],
      ),
    );

  }
}