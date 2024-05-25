import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:komas_latihan/CostumView/button.dart';
import 'package:komas_latihan/CostumView/tf_verify.dart';


class VerifyPw extends StatelessWidget {
  const VerifyPw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Container(
          alignment: Alignment.topCenter,
          child:  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const SizedBox(
                height: 120,
              ),
        
              Text(
                "Check Your Whatsapp",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Text(
                "We sent a reset code to WhatsApp. enter 5 digit codes",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  SizedBox(
                    width: 10,
                  ),
                  //1
                  TFVerif(hintText: "1", 
                  obsecureText: false,
                  // controller: ,
                  ),

                   SizedBox(
                    width: 10,
                  ),

                  //2
                  TFVerif(hintText: "2", 
                  obsecureText: false,
                  // controller: ,
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  //3
                  TFVerif(hintText: "3", 
                  obsecureText: false,
                  // controller: ,
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  //4
                  TFVerif(hintText: "4", 
                  obsecureText: false,
                  // controller: ,
                  ),

                  SizedBox(
                    width: 10,
                  ),

                  //5
                  TFVerif(hintText: "5", 
                  obsecureText: false,
                  // controller: ,
                  ),

                  SizedBox(
                    width: 10,
                  ),


                ],
              ),

              Padding(
              padding: const EdgeInsets.symmetric(vertical:10, horizontal: 100 ),
              child: MyButton(text: "  VERIFY CODE", 
              onTap: (){
                Navigator.pushNamed(context, '/loginpage');
              }, 
              // onTap: onTap,
              style: GoogleFonts.inter, 
              fontSize: 25, 
              fontWeight: FontWeight.bold, 
              height: 2),
            ),
              
              ],
            ),
          ),
        ),
    );
  }
}