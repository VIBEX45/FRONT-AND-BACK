import 'package:flutter/material.dart';
import 'package:komas_latihan/data/pref/btm_nav.dart';


class Room {
  final String nama;
  final String harga;
  final String deskripsi;

  Room({required this.nama, required this.harga, required this.deskripsi});
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kost Room Contract',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Btmnav(),
    );
  }
}