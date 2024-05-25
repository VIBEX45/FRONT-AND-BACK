import 'package:flutter/material.dart';

class Lantai2 extends StatefulWidget {
    const Lantai2({super.key});

  @override
  State<Lantai2> createState() => _Lantai2State();
}

class _Lantai2State extends State<Lantai2> {
  
  double tinggi = 38;
  double lebar = 60;

  Color warna1 = Colors.brown.shade200;
  Color warna2 = Colors.brown;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
      ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 300.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/src/images/1.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: Text(
                "Lt.2",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 34, 
                color: Colors.white, 
                fontWeight: FontWeight.bold, 
                shadows: [
                  Shadow(
                    color: warna2, 
                    blurRadius: 10,
                    ),
                  Shadow(
                    color: warna2,
                    blurRadius: 10,
                    )
                  ],

                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 18, left: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                'Deskripsi : ',
                style: TextStyle(fontSize: 12)
                ),
                Text(
                "Kata pengantar adalah salah satu bagian awal atau pendahuluan dari sebuah karya tulis yang memuat beberapa bagian penting, sepertipembukaan, isi, dan penutup. Kamu tahu nggak kenapa kata pengantar terletak di awal karya tulis?\n\n\nFasilitas\nKamar mandi dalam\nTempat Tidur\nLemari",
                style: TextStyle(fontSize: 10),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}