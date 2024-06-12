import 'dart:io';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:komas_latihan/CostumView/chat.dart';
import 'package:komas_latihan/CostumView/pembayaran.dart';
import 'package:komas_latihan/CostumView/info.dart';
import 'package:komas_latihan/pages/intro_page.dart';
import 'package:komas_latihan/pages/login_page.dart';
import 'package:komas_latihan/pages/pemesanan/pemesananlt_page.dart';
import 'package:komas_latihan/utils/client_request.dart';
import 'package:komas_latihan/utils/settings.dart';
import 'package:komas_latihan/utils/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  bool isHovering = false;

  Color warna1 = Colors.brown.shade200;
  Color warna2 = Colors.brown;

  bool pilih1 = true;
  bool pilih2 = true;
  double tinggi1 = 40;
  double tinggi2 = 40;

  Future<bool> clearLoggedCache(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.remove(key);
  }

  void logout(BuildContext context) {
    String key = "";
    clearLoggedCache(key).then((value) {
      if (value == true) {
        setState(() {
          Navigator.of(context).pop();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginPage(admin: false)));
        });
      } else {
        debugPrint("Cannot Logout!");
      }
    });
  }

  Future<List<String>?>? userCache;
  Future<List<String>?> cacheFetch(String key) async {
    List<String>? list = await MySharedPreferences.fetchFromShared(key);
    return list;
  }

  @override
  initState() {
    super.initState();
    userCache = cacheFetch("_userLogged");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Stack(
            children: [
              Container(
                height: 275.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/src/images/dashboardkos.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 10, left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text("Hi, Admin",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                        // bottomLeft
                                        offset: const Offset(-0.5, -0.5),
                                        color: warna2),
                                    Shadow(
                                        // bottomRight
                                        offset: const Offset(0.5, -0.5),
                                        color: warna2),
                                    Shadow(
                                        // topRight
                                        offset: const Offset(0.5, 0.5),
                                        color: warna2),
                                    Shadow(
                                        // topLeft
                                        offset: const Offset(-0.5, 0.5),
                                        color: warna2),
                                  ])),
                        ),
                        PopupMenuButton(
                            itemBuilder: (context) => [
                                  // PopupMenuItem(
                                  //   height: 40,
                                  //   child: const Text(
                                  //     "Admin Mode",
                                  //     style: TextStyle(
                                  //       fontSize: 12,
                                  //       color: Colors.white
                                  //     ),
                                  //   ),
                                  //   onTap: () {
                                  //     setState(() {
                                  //       CoolAlert.show(
                                  //         context: context,
                                  //         type: CoolAlertType.info,
                                  //         title: 'Telah Aktif',
                                  //         text: "\nAnda Sudah Berada\nDimode Admin\n",

                                  //         );
                                  //     });
                                  //   },
                                  // ),
                                  PopupMenuItem(
                                    height: 40,
                                    child: const Text(
                                      'Ganti Akun',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        Navigator.of(context).pop();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => IntroPage(
                                                      login: true,
                                                    )));
                                      });
                                    },
                                  ),
                                  PopupMenuItem(
                                    height: 40,
                                    child: const Text(
                                      'Keluar',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                    onTap: () {
                                      logout(context);
                                    },
                                  )
                                ],
                            color: warna2,
                            position: PopupMenuPosition.under,
                            child: FutureBuilder(
                                future: userCache,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Container(
                                      alignment: Alignment.topRight,
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(45),
                                          border: Border.all(
                                              color: Colors.white,
                                              style: BorderStyle.solid,
                                              width: 2)),
                                      child: ClientRequest.getImageFromNetwork(
                                          MySettings.getUrl(),
                                          "user/profile/${snapshot.data![0]}",
                                          <String, dynamic>{
                                            "fit": BoxFit.fill,
                                            "width": 90.0,
                                            "height": 90.0,
                                            "scale": 7.0,
                                            "radius": 48.0
                                          }),
                                    );
                                  } else {
                                    return Container(
                                      alignment: Alignment.topRight,
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'lib/src/images/3.jpeg'),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(45),
                                          border: Border.all(
                                              color: Colors.white,
                                              style: BorderStyle.solid,
                                              width: 2)),
                                    );
                                  }
                                })),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                  Container(
                    height: 90,
                    width: 270,
                    decoration: BoxDecoration(
                      color: warna2,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: warna1,
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(top: 16, right: 18, left: 16),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Pembayaran(role: 1),
                              const Chat(),
                              const Info(),
                            ])),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    // padding: const EdgeInsets.only(bottom: 35),
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            if (pilih1 == false) {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PemesananltPage(
                                      admin: false,
                                      lantaikamar: true,
                                    ),
                                  ),
                                );
                              });
                            }
                            if (pilih1 == true) {
                              setState(() {
                                tinggi1 = 140;
                                tinggi2 = 40;
                                pilih1 = false;
                                pilih2 = true;
                              });
                            } else {
                              tinggi1 = 40;
                              tinggi2 = 40;
                              pilih2 = true;
                              pilih1 = true;
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0)),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            alignment: Alignment.bottomLeft,
                            padding: const EdgeInsets.only(left: 20, bottom: 5),
                            height: tinggi1,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('lib/src/images/2.jpeg'),
                                  fit: BoxFit.cover),
                              border: Border.all(color: Colors.white, width: 3),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: warna2,
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                ),
                              ],
                            ),
                            child: Text(
                              'Lt.1',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                        // bottomLeft
                                        offset: const Offset(-1.5, -1.5),
                                        color: warna2),
                                    Shadow(
                                        // bottomRight
                                        offset: const Offset(1.5, -1.5),
                                        color: warna2),
                                    Shadow(
                                        // topRight
                                        offset: const Offset(1.5, 1.5),
                                        color: warna2),
                                    Shadow(
                                        // topLeft
                                        offset: const Offset(-1.5, 1.5),
                                        color: warna2),
                                  ]),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        MaterialButton(
                          onPressed: () {
                            if (pilih2 == false) {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PemesananltPage(
                                      admin: false,
                                      lantaikamar: false,
                                    ),
                                  ),
                                );
                              });
                            }
                            if (pilih2 == true) {
                              setState(() {
                                tinggi2 = 140;
                                tinggi1 = 40;
                                pilih2 = false;
                                pilih1 = true;
                              });
                            } else {
                              tinggi1 = 40;
                              tinggi2 = 40;
                              pilih2 = true;
                              pilih1 = true;
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0)),
                          child: AnimatedContainer(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(left: 20, bottom: 5),
                            duration: const Duration(milliseconds: 200),
                            height: tinggi2,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('lib/src/images/1.jpeg'),
                                  fit: BoxFit.cover),
                              border: Border.all(color: Colors.white, width: 3),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: warna2,
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                ),
                              ],
                            ),
                            child: Text(
                              'Lt.2',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                        // bottomLeft
                                        offset: const Offset(-1.5, -1.5),
                                        color: warna2),
                                    Shadow(
                                        // bottomRight
                                        offset: const Offset(1.5, -1.5),
                                        color: warna2),
                                    Shadow(
                                        // topRight
                                        offset: const Offset(1.5, 1.5),
                                        color: warna2),
                                    Shadow(
                                        // topLeft
                                        offset: const Offset(-1.5, 1.5),
                                        color: warna2),
                                  ]),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
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
