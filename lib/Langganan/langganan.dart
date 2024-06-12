import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:komas_latihan/pages/transaksi.dart';
import 'package:komas_latihan/utils/client_request.dart';
import 'package:komas_latihan/utils/settings.dart';
import 'package:komas_latihan/utils/shared_pref.dart';

class Langganan {
  final String date;
  final String username;
  final String roomDetails;
  final String pricePer30Days;

  Langganan({
    required this.date,
    required this.username,
    required this.roomDetails,
    required this.pricePer30Days,
  });
}

class Subscribe {
  String? userName, roomNumber, floorNumber, roomPrice, startDate, endDate, due;
  bool? isPaid, isVerified;

  Subscribe.fromJson(Map<String, dynamic> json) {
    userName = json["username"];
    roomNumber = json["room_number"];
    floorNumber = json["floor_number"];
    roomPrice = json["room_price"];
    startDate = json["start_date"];
    endDate = json["end_date"];
    due = json["due"];
    isPaid = json["paid"] > 0 ? true : false;
    isVerified = json["verified"] > 0 ? true : false;
  }
}

class LanggananApp extends StatefulWidget {
  const LanggananApp({super.key});

  @override
  State<LanggananApp> createState() => _LanggananAppState();
}

class _LanggananAppState extends State<LanggananApp> {
  Color warna1 = Colors.brown.shade200;
  Color warna2 = Colors.brown;

  // Data contoh
  final List<Langganan> subscriptions = [
    Langganan(
      date: "2024-05-17",
      username: "andy",
      roomDetails: "kamar 05, Lt. 1",
      pricePer30Days: "Rp. 800.000 - 30 Hari",
    ),
    Langganan(
      date: "2024-06-01",
      username: "vibex",
      roomDetails: "kamar 01, Lt. 1",
      pricePer30Days: "Rp. 800.000 - 30 Hari",
    ),
  ];

  int calculateRemainingDays(String startDate) {
    final start = DateTime.parse(startDate);
    final now = DateTime.now();
    final difference = now.difference(start).inDays;
    final remainingDays = 30 - difference;

    if (remainingDays > 0) {
      return remainingDays;
    } else if (remainingDays >= -10) {
      return remainingDays;
    } else {
      return -11;
    }
  }

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Peringatan'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void cancelRentSubs(url) {
    final response = ClientRequest.deleteData(url).then((value) {
      if (value["status"] == "OK") {
        Navigator.of(context).pop();
        setState(() {});
      }
    });
  }

  void _showDetailDialog(Subscribe sub, String remainingDays) {
    int due = int.parse(remainingDays);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detail Pembayaran - ${sub.userName}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Tanggal Pemesanan: ${DateFormat('dd-MM-yyyy').format(DateTime.parse(sub.startDate!))}'),
              Text(
                  'Nomor Kamar dan Lantai: Kamar No.${sub.roomNumber} Lt. ${sub.floorNumber}'),
              const SizedBox(height: 10),
              // Text('Pembayaran Bulan Selanjutnya:'),
              // Text('Tanggal Mulai: ${DateFormat('yyyy-MM-dd').format(nextPaymentDate)}'),
              // Text('Tanggal Berakhir: ${DateFormat('yyyy-MM-dd').format(nextPaymentEndDate)}'),
              // Text('Harga: Rp. ${sub.roomPrice}'),
              Text('Sisa Waktu: $remainingDays Hari'),
            ],
          ),
          actions: <Widget>[
            (due > 5 )
                ? TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Tutup"))
                : TextButton(
                    child: const Text('Lanjut Langganan'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Transaksi(
                                    kamar: sub.roomNumber!,
                                    lantai: sub.floorNumber!,
                                    harga: int.parse(sub.roomPrice!),
                                  )));
                    },
                  ),
            // TextButton(
            //   child: const Text('Batalkan Langganan'),
            //   onPressed: () {
            //     cancelRentSubs(MySettings.getUrl() +
            //         ("/rent/delete/${sub.userName}/${sub.roomNumber}"));
            //   },
            // ),
          ],
        );
      },
    );
  }

  Future<List<Subscribe>>? futureSubs;
  Future<List<Subscribe>> getFutureSubs(String url) async {
    List<Subscribe> subs = [];
    MySharedPreferences.fetchFromShared("_userLogged").then((value) {
      ClientRequest.getAll(url + value![0]).then((response) {
        response.forEach((value) {
          setState(() {
            subs.add(Subscribe.fromJson(value));
          });
        });
      });
    });

    return subs;
  }

  @override
  void initState() {
    super.initState();
    print("hello");
    futureSubs = getFutureSubs(MySettings.getUrl() + ("rent/all/user/"));
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   for (var subscription in subscriptions) {
    //     int remainingDays = calculateRemainingDays(subscription.date);
    //     if (remainingDays <= 5 && remainingDays > 0) {
    //       _showAlertDialog(
    //           'Peringatan: Segera lakukan pembayaran untuk ${subscription.username}!');
    //     } else if (remainingDays <= 0 && remainingDays > -10) {
    //       _showAlertDialog(
    //           'Peringatan: Sudah melewati batas pembayaran untuk ${subscription.username}!');
    //     }
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        appBar: AppBar(
          toolbarHeight: 90,
          backgroundColor: warna2,
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text(
              "Langganan",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
        body: FutureBuilder(
            future: futureSubs,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return futureListView(context, snapshot.data!);
              } else {
                return emptySubs();
              }
            }));
  }
// ListView.builder(
//         itemCount: subscriptions.length,
//         itemBuilder: (context, index) {
//           final subscription = subscriptions[index];
//           int remainingDays = calculateRemainingDays(subscription.date);

//           if (remainingDays == -11) {
//             return ListTile(
//               title: Text(
//                 "Data untuk ${subscription.username} telah dihapus",
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.red,
//                 ),
//               ),
//             );
//           }

//           return GestureDetector(
//             onTap: () => _showDetailDialog(subscription, remainingDays),
//             child: Card(
//               child: Container(
//                 margin: const EdgeInsets.only(
//                     left: 15, top: 10, right: 15, bottom: 10),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           DateFormat('yyyy-MM-dd')
//                               .format(DateTime.parse(subscription.date)),
//                           style: const TextStyle(
//                             fontSize: 10,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 7),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               subscription.username,
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 14,
//                               ),
//                             ),
//                             Text(
//                               subscription.pricePer30Days,
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           subscription.roomDetails,
//                           style: const TextStyle(
//                             fontSize: 12,
//                           ),
//                         ),
//                         Text(
//                           remainingDays > 0
//                               ? '$remainingDays Hari'
//                               : '${remainingDays.abs()} Hari (-)',
//                           style: TextStyle(
//                             fontSize: 13,
//                             color:
//                                 remainingDays > 0 ? Colors.black : Colors.red,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),

  Widget emptySubs() {
    return const Center(
        child: Text(
      "Belum ada langganan",
      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
    ));
  }

  void deleteRentWhenDue(String url, Subscribe sub) {
    ClientRequest.deleteData(
            "${url}rent/delete/${sub.roomNumber}/${sub.floorNumber}/${sub.userName}")
        .then((value) {
      print(value);
      if (value["status"] == "OK") {
        setState(() {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.info,
            title: 'Berhasil',
            text:
                "\nTenggat Waktu telah habis, sewa Anda untuk Kamar ${sub.roomNumber} Lt.${sub.floorNumber} telah dihapus\n",
          );
        });
      }
    });
  }

  Widget futureListView(BuildContext context, List<Subscribe> subs) {
    return ListView.builder(
      itemCount: subs.length,
      itemBuilder: (context, index) {
        // final subscription = subscriptions[index];
        // int remainingDays = calculateRemainingDays(subs[index].startDate!);

        // if (remainingDays == -11) {
        //   return ListTile(
        //     title: Text(
        //       "Data untuk ${subs[index].userName} telah dihapus",
        //       style: const TextStyle(
        //         fontSize: 16,
        //         fontWeight: FontWeight.bold,
        //         color: Colors.red,
        //       ),
        //     ),
        //   );
        // }

        int due = int.parse(subs[index].due!);
        if (due < -11) {
          deleteRentWhenDue(MySettings.getUrl(), subs[index]);
        }
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (due <= 5 && due > 0) {
            _showAlertDialog(
                'Peringatan: Segera lakukan pembayaran untuk ${subs[index].userName}!');
          } else if (due <= 0 && due >= -10) {
            _showAlertDialog(
                'Peringatan: Sudah melewati batas pembayaran untuk ${subs[index].userName}!');
          }
        });

        return GestureDetector(
          onTap: () => _showDetailDialog(subs[index], subs[index].due!),
          child: Card(
            child: Container(
              margin: const EdgeInsets.only(
                  left: 15, top: 10, right: 15, bottom: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${DateFormat('dd-MM-yyyy').format(DateTime.parse(subs[index].startDate!))} s/d ${DateFormat('dd-MM-yyyy').format(DateTime.parse(subs[index].endDate!))}",
                        style: const TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            subs[index].userName!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "Rp. ${subs[index].roomPrice}",
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
                        "Kamar No.${subs[index].roomNumber} Lt.${subs[index].floorNumber}",
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        int.parse(subs[index].due!) > 0
                            ? 'Tersisa ${subs[index].due!} Hari'
                            : 'Telat ${int.parse(subs[index].due!).abs()} Hari (-)',
                        style: TextStyle(
                          fontSize: 13,
                          color: int.parse(subs[index].due!) > 0 ? Colors.black : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
