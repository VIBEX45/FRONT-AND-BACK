import 'package:flutter/material.dart';

class Pesanlt2 {
  Color tombol;
  String nokamar;
  int selectedindex;
  bool kondisi = true;

  Pesanlt2({required this.tombol, required this.nokamar, 
  required this.selectedindex});
}

class Lantai2 extends StatefulWidget {
    const Lantai2({super.key});

  @override
  State<Lantai2> createState() => _Lantai2State();
}

class _Lantai2State extends State<Lantai2> {
  
  double tinggi = 38;
  double lebar = 60;

  List<Pesanlt2> pesanlt2 = [
    Pesanlt2(
      tombol: const Color.fromRGBO(217,217,217,1),
      nokamar:'01',
      selectedindex: 0,
      ),
    Pesanlt2(
      tombol: const Color.fromRGBO(217,217,217,1),
      nokamar:'02',
      selectedindex: 1,
    ),
    Pesanlt2(
      tombol: const Color.fromRGBO(217,217,217,1),
      nokamar:'03',
      selectedindex: 2,
    ),
    Pesanlt2(
      tombol: const Color.fromRGBO(217,217,217,1),
      nokamar:'04',
      selectedindex: 3,
    ),
    Pesanlt2(
      tombol: const Color.fromRGBO(217,217,217,1),
      nokamar:'05',
      selectedindex: 4,
    ),
    Pesanlt2(
      tombol: const Color.fromRGBO(217,217,217,1),
      nokamar:'06',
      selectedindex: 5,
    ),
    Pesanlt2(
      tombol: const Color.fromRGBO(217,217,217,1),
      nokamar:'07',
      selectedindex: 6,
    ),
    Pesanlt2(
      tombol: const Color.fromRGBO(217,217,217,1),
      nokamar:'08',
      selectedindex: 7,
    ),
    
  ];
  
  Color warna1 = Colors.brown.shade200;
  Color warna2 = Colors.brown;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            height: 300.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/1.jpeg'),
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
    Widget kamarlt2(int index){
    return InkWell(
      onTap: () {
          pesanlt2[index].kondisi? 
          setState(() {
            pesanlt2[index].tombol = const Color.fromRGBO(0, 255, 0, 1);
            pesanlt2[index].kondisi = false;
          }):
          setState(() {
            pesanlt2[index].tombol = const Color.fromRGBO(217,217,217,1);
            pesanlt2[index].kondisi = true;
          });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 170),
        height: tinggi,
        width: lebar,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: pesanlt2[index].tombol,
          borderRadius: BorderRadius.circular(3),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(198,198,198,1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 2,)
            ),
          ]
        ),
        child: Text(
          textAlign: TextAlign.center,
          pesanlt2[index].nokamar,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }

}