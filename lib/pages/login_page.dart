import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter/widgets.dart";

import "package:google_fonts/google_fonts.dart";
import "package:komas_latihan/User/home_page.dart";
import "package:komas_latihan/pages/register_page.dart";


// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  LoginPage({required this.admin});
  bool admin;


  @override
  State<LoginPage> createState() => _LoginPageState();
}


// ignore: must_be_immutable
class _LoginPageState extends State<LoginPage> {


//email and pw tet controller 
final TextEditingController _emailController = TextEditingController();
final TextEditingController _pwController = TextEditingController();

String kondisi = TextEditingController().text.trim();

bool pakai = true;

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

            Container(
              width: MediaQuery.of(context).size.width*0.8,
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9@.]'))],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(bottom: 5, left: 15),
                        hintFadeDuration: Duration(milliseconds: 300),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Masukkan Email',
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
                    fixedSize: MaterialStatePropertyAll(Size(90, 40)),
                    alignment: Alignment.center,
                    backgroundColor: MaterialStateColor.resolveWith((states) {
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
                    String email = _emailController.text.trim();
                    String password = _pwController.text.trim();

                    
                    if (email.isNotEmpty && password.isNotEmpty) {
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
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
