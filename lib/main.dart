import 'package:flutter/material.dart';
import 'package:komas_latihan/utils/shared_pref.dart';
import 'pages/intro_page.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:komas_latihan/Admin/admin_home_page.dart';
// import 'package:komas_latihan/User/dashboard_page.dart';
// import 'package:komas_latihan/User/home_page.dart';
// import 'package:komas_latihan/pages/login_page.dart';

void main (){
  runApp(MyApp());
}


Future<List<String>?> checkingSharedPref(key) async{
  List<String>? cacheData = await MySharedPreferences.fetchFromShared(key);
  debugPrint("Cache: "+cacheData.toString());
  return cacheData;
}


// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  final String prefKey = "_userLogged";
  bool hasLogged = false;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(login: true,),
      
    );
  }
}