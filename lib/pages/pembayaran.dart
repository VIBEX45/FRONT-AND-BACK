import 'package:flutter/material.dart';

class PembayaranPage extends StatefulWidget {
  const PembayaranPage({super.key});

  @override
  State<PembayaranPage> createState() => _PembayaranPageState();
}

class _PembayaranPageState extends State<PembayaranPage> {

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
              setState(() {

              });
          
            }, 
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: isHovering ? const Color.fromARGB(255, 215, 237, 255) : Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.brown,
                      spreadRadius: 2,
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: const Icon(Icons.payment, size: 25,),
                ),

              const SizedBox(
                height: 2,
              ),

              const Text(
                "Pembayaran",
                style: TextStyle(color: Colors.white, 
                fontSize: 8, height: 1.5),
              ),
            ],
          ),
          ),
    );
  }
}