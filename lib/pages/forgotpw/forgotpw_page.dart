import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:komas_latihan/CostumView/button.dart";
import "package:komas_latihan/CostumView/my_textfield.dart";

class ForgotPwPage extends StatelessWidget {
  const ForgotPwPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 120,
              ),
        
              Text(
                "Lupa Kata Sandi",
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(
                height: 40,
              ),

            //text field phone number
             const MyTextField(
              hintText: "Phone Number", 
              obsecureText: false,
              ),

              const SizedBox(
                height: 20,
              ),


            //text field pw
            const MyTextField(
              hintText: "Password", 
              obsecureText: false,
              ),

              const SizedBox(
                height: 20,
              ),

            //text field confirmPw
            const MyTextField(
              hintText: "Confirm Password", 
              obsecureText: false, 
              ),
              
              //Button Update Password
              Padding(
              padding: const EdgeInsets.symmetric(vertical:10, horizontal: 100 ),
              child: MyButton(text: "  UPDATE PASSWORD", 
              onTap: (){
                Navigator.pushNamed(context, '/verifypage');
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