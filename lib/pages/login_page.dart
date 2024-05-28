import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter/widgets.dart";

import "package:google_fonts/google_fonts.dart";

import 'package:komas_latihan/Admin/home_page.dart';
import "package:komas_latihan/User/home_page.dart";
import "package:komas_latihan/pages/register_page.dart";
import "package:komas_latihan/utils/client_request.dart";
import "package:komas_latihan/utils/settings.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:komas_latihan/utils/shared_pref.dart";

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  LoginPage({super.key, required this.admin});
  bool admin;


  @override
  State<LoginPage> createState() => _LoginPageState();
}


// ignore: must_be_immutable
class _LoginPageState extends State<LoginPage> {

  //email and pw tet controller 
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  String kondisi = TextEditingController().text.trim();

  bool pakai = true;

  Future<SharedPreferences>? sp;
  Future<MySharedPreferences>? msp;

  void login(String username, String password) async{
    String url = MySettings.getUrl()+"login";
    Map<String, dynamic> postBody = {
      "userName": username,
      "password": password
    };

    Future<List<String>?> fromPref;
    Map<String, dynamic> resp = await ClientRequest.postData(url, postBody).then((value){
      if(value["status"] == "OK"){

        debugPrint(value.toString());
        MySharedPreferences.saveToSharedList("_userLogged", [value["user_name"], value["role"].toString(), value["token"]]);
        fromPref = MySharedPreferences.fetchFromShared("_userLogged").then((value){
          debugPrint(value.toString());
        });

        switch(value["role"]){
          case 1:{
            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHomePage(),));
          }break;
          // case 2: {}break;
          case 3: {
            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
          }break;
        }
      }
      else{
        debugPrint("Wrong username or password");
        print("Wrong username or password");
      }
      return value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade200,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(
              height: 20,
            ),

            //logo
            Image.asset('lib/src/images/login.png', width: 350,fit: BoxFit.cover,),


            //welcome back message
            Text(
              "Silahkan Login dulu ",
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16, 
                fontWeight: FontWeight.bold
              ),
            ),
            
            const SizedBox(
              height: 30,
            ),


            //email textfield

            SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              child: Column(
                children: [
                  TextField(
                    controller: _usernameController,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9@.]'))],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(bottom: 5, left: 15),
                        hintFadeDuration: Duration(milliseconds: 300),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Masukkan Username',
                          hintStyle: TextStyle(
                            decorationStyle: TextDecorationStyle.dotted,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 221, 210, 210),
                          ),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 5,
                ),
                  TextField(
                    controller: _pwController,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-z A-Z 0-9]'))],
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 5,left: 15),
                        border: OutlineInputBorder(),
                        hintFadeDuration: Duration(milliseconds: 300),
                        alignLabelWithHint: true,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Masukkan Password',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 221, 210, 210),
                          ),
                    ),
                  ),
                ],
              ),
            ),
              const SizedBox(
                height: 30,
              ),

            //login button
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child:  Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(const Size(90, 40)),
                    alignment: Alignment.center,
                    backgroundColor: WidgetStateColor.resolveWith((states) {
                        return Colors.brown;
                    })
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                
                        ),
                      ),
                    ],
                  ),
                  
                  onPressed: () {
                    String username = _usernameController.text.trim();
                    String password = _pwController.text.trim();

                    if (username.isNotEmpty && password.isNotEmpty) {
                      login(username, password);
                    }
                  },
                  ),
              )
            ),

            const SizedBox(
                height: 20,
              ),


            //register now
            
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text(
                "Belum punya akun? ",
                ),

              GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(),));
                });
              },
                child: Text("Daftar sekarang",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ],
            ),

            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
