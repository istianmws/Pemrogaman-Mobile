import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:praktpm1/komponen/my_button.dart';
import 'package:praktpm1/komponen/my_textfield.dart';
import '../komponen/square_tile.dart';
import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({Key? key, this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text edit controller
  final unameController = TextEditingController();
  final cpassController = TextEditingController();
  final upassController = TextEditingController();

  //error
  void showErrorMessage(String message) {
    print(message);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              message,
            ),
          ),
        );
      },
    );
  }

  //signup user
  void signUserUp() async{

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
      if (upassController.text == cpassController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: unameController.text,
            password: upassController.text
        );
      }else{
        showErrorMessage("konfirmasi password salah!");
      }
    }on FirebaseAuthException catch (e){
      Navigator.pop(context);
      //Email/Password salah
      showErrorMessage(e.code);


    }

    //loading hide
    // Navigator.pop(context);
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
                  'Selamat Datang, Silahkan Buat Akun Dulu',
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
                // confirm pass
                MyTextField(
                  controller: cpassController,
                  hintText: 'Confirm Password',
                  obsecureText: true,
                ),

                const SizedBox(height:25),
                //sign in
                MyButton(
                  text: "Sign Up",
                  onTap: signUserUp,
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
                  children: [
                    // google button
                    SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: 'lib/images/google.png',
                    ),

                    SizedBox(width: 25),

                    // apple button
                    SquareTile(
                      onTap: (){},
                      imagePath: 'lib/images/apple.png',
                    )
                  ],
                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an Account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Just Login',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height:50),
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


