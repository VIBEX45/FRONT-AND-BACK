import 'package:flutter/material.dart';
import 'package:komas_latihan/pages/login_page.dart';
import 'package:komas_latihan/pages/register_page.dart';

class LoginOrRegis extends StatefulWidget {
  const LoginOrRegis({super.key});

  @override
  State<LoginOrRegis> createState() => _LoginOrRegisState();
}

class _LoginOrRegisState extends State<LoginOrRegis> {
 
  //show login page
  bool showLoginPage = true;

  //toogle between login regis
  void tooglePages(){
    setState((){
      showLoginPage = !showLoginPage;
    });
    
  }

 
  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LoginPage(
        onTap: tooglePages,
      );
    } else {
      return RegisterPage(
        onTap: tooglePages,
      );
    }
  }
}