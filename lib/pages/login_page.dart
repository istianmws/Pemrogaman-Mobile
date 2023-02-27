import 'package:flutter/material.dart';
import 'package:praktpm1/komponen/my_button.dart';
import 'package:praktpm1/komponen/my_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  //text edit controller
  final unameController = TextEditingController();
  final upassController = TextEditingController();

  //sign user in
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
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

            const SizedBox(height:25),
            //sosiallogin
          ],
        ),
      ),
    );
  }
}
