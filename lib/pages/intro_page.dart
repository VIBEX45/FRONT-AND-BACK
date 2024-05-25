import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

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
            Text(
              "Kenyamanan, Keamanan, dan Kekeluargaan",
              style: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                // flex:CrossAxisAlignment.center
              ),
            ),

            //subtitle
            Text(
              "Semua dimulai di sini",
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
                    fixedSize: MaterialStatePropertyAll(Size(90, 30)),
                    alignment: Alignment.center,
                    backgroundColor: MaterialStateColor.resolveWith((states) {
                        return Colors.brown;
                    })
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/loginorregis');
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
