import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:praktpm1/komponen/my_button.dart';
import 'package:praktpm1/komponen/my_textfield.dart';
import '../komponen/square_tile.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text edit controller
  final unameController = TextEditingController();

  final upassController = TextEditingController();

  //popup salah login
  void wrongEmailMessage(){
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Email anda Salah'),
        );
      },
    );
  }

  void wrongPasswordMessage(){
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Password anda Salah'),
        );
      },
    );
  }

  //sign user in
  void signUserIn() async{

    //loading screen
    showDialog(
      context: context, builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //sign in
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: unameController.text,
          password: upassController.text
      );
    }on FirebaseAuthException catch (e){
      Navigator.pop(context);
      //Email salah
      if(e.code == 'user-not-found'){
        print('No user found for that email.');
        wrongEmailMessage();
      }else if(e.code == 'wrong-password'){
        print('Wrong password provided for that user.');
        wrongPasswordMessage();
      }
      //Password salah

    }

    //loading hide
    Navigator.pop(context);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children:  [
                const SizedBox(height:50),
                //logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),

                const SizedBox(height:50),
                //welcome
                Text(
                  'Selamat Datang, Silahkan Login!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height:25),
                //username
                MyTextField(
                  controller: unameController,
                  hintText: 'Username',
                  obsecureText: false,
                ),

                const SizedBox(height:10),
                //pass
                MyTextField(
                  controller: upassController,
                  hintText: 'Password',
                  obsecureText: true,
                ),

                const SizedBox(height:10),
                //forgot pass
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Lupa Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height:25),
                //sign in
                MyButton(
                  onTap: signUserIn,
                ),

                const SizedBox(height:50),
                //sosiallogin
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Atau masuk dengan',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                          child:Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          )
                      ),
                    ],
                  ),
                ),


                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // google button
                    SquareTile(imagePath: 'lib/images/google.png'),

                    SizedBox(width: 25),

                    // apple button
                    SquareTile(imagePath: 'lib/images/apple.png')
                  ],
                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
