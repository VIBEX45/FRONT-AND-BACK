import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:komas_latihan/Admin/admin_home_page.dart';
import 'package:komas_latihan/pages/loginorguest.dart';

// ignore: must_be_immutable
class IntroPage extends StatelessWidget {
  IntroPage({super.key, required this.login});

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
            const SizedBox(height: 40),

            //nameApk
            Center(
              child: Text(
                "Alfiza Kos",
                style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),

            const SizedBox(
              height: 40,
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
            login?
            Text(
              "Kenyamanan, Keamanan, dan Kekeluargaan",
              style: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                // flex:CrossAxisAlignment.center
              ),
            ):
            Text(
              "Selamat Datang Ibu/Tuan Kost",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                // flex:CrossAxisAlignment.center
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            //subtitle
            login?
            Text(
              "Semua dimulai di sini",
              style: GoogleFonts.inter(fontSize: 18, color: Colors.white),
            ):
            Text(
              "Anda Telah Menggunakan Admin Mode",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(fontSize: 18, color: Colors.white),
            ),

            const SizedBox(
              height: 60,
            ),
            
            //getStart
            // Padding(padding: 
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child:  Container(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(const Size(90, 30)),
                    alignment: Alignment.center,
                    backgroundColor: WidgetStateColor.resolveWith((states) {
                        return Colors.brown;
                    })
                  ),
                  onPressed: () {
                    if (login == true) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginOrGuest(login: login),));
                    }else{
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHomePage(),));
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Next',
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
