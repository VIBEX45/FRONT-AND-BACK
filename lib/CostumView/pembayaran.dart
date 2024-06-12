import 'package:flutter/material.dart';
import 'package:komas_latihan/Admin/admin_home_page.dart';
import 'package:komas_latihan/Langganan/AdminLangganan.dart';
import 'package:komas_latihan/Langganan/langganan.dart';
import 'package:komas_latihan/User/home_page.dart';

class Pembayaran extends StatefulWidget {
  int? role;
  Pembayaran({super.key, this.role});

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
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
          setState(() {});
        },
        child: Column(
          children: [
            AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: isHovering
                      ? const Color.fromARGB(255, 215, 237, 255)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.brown,
                      spreadRadius: 2,
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.payment,
                    size: 25,
                  ),
                  onPressed: () {
                    switch (widget.role) {
                      case 1:
                        {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AdminLanggananApp()));
                          });
                        }
                        break;
                      case 2:
                        {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LanggananApp()));
                          });
                        }
                        break;
                    }
                  },
                )),
            const SizedBox(
              height: 2,
            ),
            const Text(
              "Pembayaran",
              style: TextStyle(color: Colors.white, fontSize: 8, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
