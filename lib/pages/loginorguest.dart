import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:komas_latihan/Admin/admin_home_page.dart';
import 'package:komas_latihan/Guest/guest_home_page.dart';
import 'package:komas_latihan/pages/login_page.dart';

// ignore: must_be_immutable
class LoginOrGuest extends StatelessWidget {
  LoginOrGuest({required this.login});

  bool login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade200,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 50),

            //nameApk
            Center(
              child: Text(
                "Alfizah Kos",
                style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            
            const SizedBox(
              height: 25,
            ),

            //icon
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset('lib/src/images/welcome.png'),
            ),

            const SizedBox(
              height: 40,
            ),

            //title
            Text(
              "Sudah Punya Akun?",
              style: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                // flex:CrossAxisAlignment.center
              ),
            ),

            SizedBox(
              height: 30,
            ),

            Text(
              "Jika Sudah memiliki Akun silahkan Tekan next",
              style: GoogleFonts.inter(fontSize: 16, color: Colors.white),
            ),

            const SizedBox(
              height: 40,
            ),

            const SizedBox(
              height: 40,
            ),
            
            //getStart
            // Padding(padding: 

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child:  Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(100, 30)),
                    alignment: Alignment.center,
                    backgroundColor: MaterialStateColor.resolveWith((states) {
                        return Colors.brown;
                    })
                  ),
                  onPressed: () {
                    
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GuestHomePage()));
                    
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Guest',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                
                        ),
                      ),
                      Icon(Icons.arrow_forward, color: Colors.white, size: 12,),
                    ],
                  ),
                  ),
              )
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child:  Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(100, 30)),
                    alignment: Alignment.center,
                    backgroundColor: MaterialStateColor.resolveWith((states) {
                        return Colors.brown.shade300;
                    })
                  ),
                  onPressed: () {
                    if (login == true) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(admin: true,),));
                    }else{
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHomePage(),));
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                
                        ),
                      ),
                      Icon(Icons.arrow_forward, color: Colors.white, size: 12,),
                    ],
                  ),
                  ),
              )
            ),
            
           

          ],
        ),
      ),
    );
  }
}
