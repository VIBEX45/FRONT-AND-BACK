import 'package:flutter/material.dart';
import 'package:komas_latihan/pages/intro_page.dart';

void main (){
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(login: true),
    );
  }
}