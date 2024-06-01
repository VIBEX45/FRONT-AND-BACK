import 'package:komas_latihan/pages/infopage.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {

  bool isHovering = false;

  Color warna1 = Colors.brown.shade200;
  Color warna2 = Colors.brown;

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => 
                const InfoPage(),
                ),
              );
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
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.brown,
                      spreadRadius: 2,
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: const Icon(Icons.info, size: 25,),
                ),
              const SizedBox(
                height: 2,
              ),
              const Text(
                "Info",
                style: TextStyle(color: Colors.white, 
                fontSize: 8, height: 1.5),
              ),
            ],
          ),
          ),
    );
  }
}