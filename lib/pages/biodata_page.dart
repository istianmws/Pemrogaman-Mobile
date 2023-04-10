import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
class BiodataPage extends StatefulWidget {
  BiodataPage({Key? key}) : super(key: key);

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Anggota'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 25,),
              //Nama Foto sebagai Profile
              Padding(padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Halo, Selamat Datang!',
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Istian Muhammad",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('ava.png'),
                              fit: BoxFit.contain
                          ),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          )
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              //detail user
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue[100],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('istian.png'),
                                fit: BoxFit.fitWidth
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            )
                        ),
                      ),
                      SizedBox(width: 20),

                      //detail nim dll
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ) ,
                            'Istian Muhammad WS',
                          ),

                          SizedBox(height: 10),
                          Text('123190107 | TPM B'),

                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue[700],
                            ),
                            child: Center(
                              child: Container(
                                  child: Text(
                                    'Kenal lebih dekat!',
                                    style: TextStyle(color: Colors.white),
                                  )
                              ),
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),

              SizedBox(height: 25),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue[100],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage("raka.jpg"),
                                fit: BoxFit.fitWidth
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            )
                        ),
                      ),
                      SizedBox(width: 20),

                      //detail nim dll
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ) ,
                            'Rakha Mohammad A',
                          ),

                          SizedBox(height: 10),
                          Text('123190109 | TPM B'),

                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue[700],
                            ),
                            child: Center(
                              child: Container(
                                  child: Text(
                                    'Kenal lebih dekat!',
                                    style: TextStyle(color: Colors.white),
                                  )
                              ),
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),

              SizedBox(height: 25),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue[100],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('tusir.jpg'),
                                fit: BoxFit.fitWidth
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            )
                        ),
                      ),
                      SizedBox(width: 20),

                      //detail nim dll
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ) ,
                            'M Patty Amal M',
                          ),

                          SizedBox(height: 10),
                          Text('123190121 | TPM B'),

                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue[700],
                            ),
                            child: Center(
                              child: Container(
                                  child: Text(
                                    'Kenal lebih dekat!',
                                    style: TextStyle(color: Colors.white),
                                  )
                              ),
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),

              SizedBox(height: 25),
            ],
          ),
        ) ,

      ),
    );
  }
}