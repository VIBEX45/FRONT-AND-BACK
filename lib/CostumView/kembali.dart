import 'package:komas_latihan/pages/homePage/lantai1_page.dart';
import 'package:komas_latihan/pages/homePage/lantai2_page.dart';
import 'package:komas_latihan/pages/profil_page.dart';
import 'package:flutter/material.dart';

class Kembali extends StatefulWidget {
  const Kembali({super.key});

  @override
  State<Kembali> createState() => _KembaliState();
}

class _KembaliState extends State<Kembali> {

  final List<Widget> screens = [
    const Lantai1(),
    const Lantai2(),
    const ProfilPage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currenscreen = const ProfilPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: PageStorage(
        bucket: bucket,
        child: currenscreen,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: FloatingActionButton(
          onPressed: (){
          },
          backgroundColor: const Color.fromRGBO(0, 76, 144, 1),
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          mini: true,
          child: const Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}