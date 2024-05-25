import 'package:flutter/material.dart';

class Lantai1 extends StatefulWidget {
    const Lantai1({super.key});

  @override
  State<Lantai1> createState() => _Lantai1State();
}

class _Lantai1State extends State<Lantai1> {

  Color warna1 = Colors.brown.shade200;
  Color warna2 = Colors.brown;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 300.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/src/images/2.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 20, top: 10),
              child: Text(
                "Lt.1",
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}