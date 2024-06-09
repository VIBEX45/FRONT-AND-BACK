import 'package:flutter/material.dart';
import 'package:komas_latihan/Admin/admin_home_page.dart';
import 'package:komas_latihan/User/dashboard_page.dart';
import 'package:komas_latihan/User/home_page.dart';
import 'package:komas_latihan/pages/login_page.dart';
import 'package:komas_latihan/utils/shared_pref.dart';
import 'pages/intro_page.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main (){

  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
    'resource://drawable/res_app_icon',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: Colors.brown,
        ledColor: Colors.white,
      )
    ],
  );
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


  // dynamic IntroOrLogin(){
  //   checkingSharedPref(prefKey).then((value){
  //     if(value![0].isNotEmpty){
  //       return IntroPage(login: false);
  //     }
  //     else{
  //       return IntroPage(login: true);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      
    );
  }
}