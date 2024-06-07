
import 'package:flutter/material.dart';
import 'package:komas_latihan/Guest/guest_fitur/guest_chat.dart';
import 'package:komas_latihan/Guest/guest_fitur/guest_info.dart';
import 'package:komas_latihan/Guest/guest_fitur/guest_lantai.dart';
import 'package:carousel_slider/carousel_slider.dart';


class GuestDashboardPage extends StatefulWidget {

  @override
  State<GuestDashboardPage> createState() => _GuestDashboardPageState();
}

class _GuestDashboardPageState extends State<GuestDashboardPage> {
  bool isHovering = false;

  Color warna1 = Colors.brown.shade200;
  Color warna2 = Colors.brown;

  bool pilih1 = true;
  bool pilih2 = true;
  double tinggi1 = 40;
  double tinggi2 = 40;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: ListView(
      
      children: [
        Stack(
            children: [
              Container(
              height: MediaQuery.of(context).size.height*0.81,
                decoration: BoxDecoration(
                  color: warna2,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
                ),
              ),
              Container(
              height: MediaQuery.of(context).size.height*0.43,
                decoration: BoxDecoration(
                  color: warna1,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
                ),
              ),
              
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.topLeft,
                  child : Text(
                    "Hi. Pengunjung",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow( // bottomLeft
                          offset: const Offset(-0.5, -0.5),
                          color: warna2
                        ),
                        Shadow( // bottomRight
                          offset: const Offset(0.5, -0.5),
                          color: warna2
                        ),
                        Shadow( // topRight
                          offset: const Offset(0.5, 0.5),
                          color: warna2
                        ),
                        Shadow( // topLeft
                          offset: const Offset(-0.5, 0.5),
                          color: warna2
                        ),
                      ]
                   )
                  ),
                  ),
                  
                  const SizedBox(
                    height: 25,
                  ),

                  Container(
                    height: 20,
                    width: 90,
                    child: Image.asset(
                      'lib/src/images/kost.png',
                    fit: BoxFit.fitWidth,),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: false,
                        autoPlayAnimationDuration: Duration(seconds: 2),
                        aspectRatio: 2.0,
                        enlargeCenterPage: true

                        ,
                      ),
                      items: 
                      [
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  height: MediaQuery.of(context).size.height*0.23,
                                  width: MediaQuery.of(context).size.width*0.83,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18)
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  height: MediaQuery.of(context).size.height*0.23,
                                  width: MediaQuery.of(context).size.width*0.83,
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width*0.52,
                                    child: const Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.right,
                                            'Strategis',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 17,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            textAlign: TextAlign.right,
                                            '"Lokasi Strategis: Dekat dengan Kampus 4 UNG, cocok untuk kamu yang berprofesi sebagai mahasiswa."',
                                            style: TextStyle(
                                              fontSize: 9.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                  ),
                                ),
                                
                                const SizedBox(
                                  height: 30,
                                ),
                                
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  height: MediaQuery.of(context).size.height*0.23,
                                  width: MediaQuery.of(context).size.width*0.34,
                                  child:Image.asset('lib/src/images/wanita3.png',fit: BoxFit.cover,),
                                ),
                              ],
                            ),

                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  height: MediaQuery.of(context).size.height*0.23,
                                  width: MediaQuery.of(context).size.width*0.83,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18)
                                  ),
                                ),
                                
                                Container(
                                  alignment: Alignment.bottomRight,
                                  height: MediaQuery.of(context).size.height*0.23,
                                  width: MediaQuery.of(context).size.width*0.34,
                                  child:Image.asset('lib/src/images/wanita2.png',fit: BoxFit.cover,),
                                ),

                                const SizedBox(
                                  height: 30,
                                ),

                                Container(
                                  alignment: Alignment.topLeft,
                                  height: MediaQuery.of(context).size.height*0.23,
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width*0.92,
                                    child: const Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            textAlign: TextAlign.left,
                                            'Cari yang bagaimana ??',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            textAlign: TextAlign.left,
                                            '"Kos Bersih dan Aman,\nFasilitas Lengkap,\nLingkungan Tenang.\nSewa Sekarang!"',
                                            style: TextStyle(
                                              fontSize: 9.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                  ),
                                ),
                              ],
                            ),

                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  height: MediaQuery.of(context).size.height*0.23,
                                  width: MediaQuery.of(context).size.width*0.83,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18)
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topRight,
                                  height: MediaQuery.of(context).size.height*0.23,
                                  width: MediaQuery.of(context).size.width*0.83,
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width*0.52,
                                    child: const Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.right,
                                            'Ayo pesan !!',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 17,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            textAlign: TextAlign.right,
                                            '"Jangan Lewatkan Kesempatan Ini! Hubungi Kami Sekarang untuk Melihat Kamar dan Memesan Tempatmu."',
                                            style: TextStyle(
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                  ),
                                ),
                                
                                const SizedBox(
                                  height: 30,
                                ),
                                
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  height: MediaQuery.of(context).size.height*0.23,
                                  width: MediaQuery.of(context).size.width*0.34,
                                  child:Image.asset('lib/src/images/wanita1.png',fit: BoxFit.cover,),
                                ),
                              ],
                            ),

                      ],
                    ),
                
                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                      const SizedBox(
                        width:  5,
                      ),
                      Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(
                    height: 35,
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width*0.75,
                    child: Row (
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            guestChat(),
                            guestlantai(guestmilih: true, namalantai: 'Lantai 1',),
                            guestlantai(guestmilih: false, namalantai: 'Lantai 2'),
                            guestInfo()
                          ]
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    height: MediaQuery.of(context).size.height*0.18,
                    width: MediaQuery.of(context).size.width*0.83,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          'Pemberitahuan',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Saat ini anda berada dalam mode pengunjung, pesanlah kamar kos untuk menjadi bagian dari kami',
                          style: TextStyle(
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}