// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

 class _LoginPageState extends State<LoginPage>{

    //text controllers
   final _emailController = TextEditingController();
   final _passwordController = TextEditingController();

   //Firebase Auth.
   Future signIn() async{
     await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: _emailController.text.trim(),
         password: _passwordController.text.trim(),
     );
   }

   //help Memory Management
   @override
   void dispose(){
     _emailController.dispose();
     _passwordController.dispose();
     super.dispose();
   }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [

                   //logo
                  Icon(
                    Icons.sports_gymnastics,
                    size: 100,
                  ),
                  SizedBox(height: 20,),

                  //hello again
                  Text(
                  'Hello Again',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 52,
                    ),
                  ),
                  SizedBox(height: 10),

                  Text(
                'Welcome back, you\'ve been missed!',
                 style: TextStyle(
                 fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 50),


              //email textfield
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Email',
                    fillColor: Colors.grey[200],
                    filled: true,
                    ),
                ),
              ),
              SizedBox(height: 10),


              //password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Password',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),


              //sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: signIn,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                          borderRadius: BorderRadius.circular(12)
                    ),
                    child: Center(
                      child: Text(
                        'Sign In',
                         style: TextStyle(
                           color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                         ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 25),

              //not e member? register now
              Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a member?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      ' Register Now!',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                  ),
                ],
              ),

            ]),
          ),
        ),
      ),
    );

  }

}
