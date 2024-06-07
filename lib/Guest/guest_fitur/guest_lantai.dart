import 'package:flutter/material.dart';
import 'package:komas_latihan/Guest/guestlt_page.dart';
import 'package:komas_latihan/pages/pemesanan/pemesananlt_page.dart';
import 'package:komas_latihan/pages/pemesanan_page.dart';

// ignore: must_be_immutable
class guestlantai extends StatefulWidget {
    guestlantai({required this.guestmilih,required this.namalantai});

  bool guestmilih;
  String namalantai;

  @override
  State<guestlantai> createState() => _guestlantaiState();
}

class _guestlantaiState extends State<guestlantai> {

  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
          onEnter: (f) {
            setState(() {
              isHovering = true;
            });
          },
          onExit: (f) {
            setState(() {
              isHovering = false;
            });
          },
          child: InkWell(
            onTap: () {
              if (widget.guestmilih == true) {
                setState(() {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                      builder: (context) => 
                      ltPage(admin: true, lantaikamar: true,),
                    ),
                  );
                });
              } else {
                setState(() {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                      builder: (context) => 
                      ltPage(admin: true, lantaikamar: false,),
                    ),
                  );
                });
              }
              
            }, 
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: isHovering ? const Color.fromARGB(255, 215, 237, 255) : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.brown,
                      spreadRadius: 2,
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: const Icon(Icons.house, size: 25,),
                ),
              const SizedBox(
                height: 2,
              ),
              Text(
                widget.namalantai,
                style: TextStyle(color: Colors.white, 
                fontSize: 8, height: 1.5),
              ),
            ],
          ),
          ),
    );
  }
}