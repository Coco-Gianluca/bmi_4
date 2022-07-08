import 'package:bmi_4/Login/auth_page.dart';
import 'package:bmi_4/Login/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


//Controls if im logged or not
class CheckPage extends StatelessWidget{
  const CheckPage({Key? key}) :super(key: key);

//If snapshot has data go to homepage else back to login
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            return HomePage();
          }else{
            return AuthPage();
          }
        }
      ),
    );
  }

}


