import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class guestChat extends StatefulWidget {
  const guestChat({super.key});

  @override
  State<guestChat> createState() => _guestChatState();
}

class _guestChatState extends State<guestChat> {

  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final Uri whatsapp = Uri.parse('https://wa.me/6282153492615');
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
            onTap: () async {
                await launchUrl(whatsapp);
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
                child: const Icon(Icons.chat, size: 25,),
                ),
              const SizedBox(
                height: 2,
              ),
              const Text(
                "Chat",
                style: TextStyle(color: Colors.white, 
                fontSize: 8, height: 1.5),
              ),
            ],
          ),
          ),
    );
  }
}