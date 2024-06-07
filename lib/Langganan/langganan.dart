import 'package:flutter/material.dart';

class langganan extends StatefulWidget {
  const langganan({super.key});

  @override
  State<langganan> createState() => _langgananState();
}

class _langgananState extends State<langganan> {
 int selectedIndex = 0;

  String ending = '...';

  Color warna1 = Colors.brown.shade200;
  Color warna2 = Colors.brown;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        appBar: AppBar(
          toolbarHeight: 90,
          backgroundColor: warna2,
          automaticallyImplyLeading: false,
          title: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Mutasi",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
              ),
            ],
          ),
        ),
        body: Card(
            child: Container(
              margin: const EdgeInsets.only(
                  left: 15, top: 10, right: 15, bottom: 10),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "dater",
                        // (DateTime.fromMillisecondsSinceEpoch(
                        //         int.parse(history[index].startDate!))
                        //     .toIso8601String()),
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "username",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Rp. - Hari',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Kamar No. Lt. ",
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ), const Text(
                              'Lunas',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
