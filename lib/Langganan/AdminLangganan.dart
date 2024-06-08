import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class adminLangganan {
  String date;
  final String username;
  final String roomDetails;
  final String pricePer30Days;

  adminLangganan({
    required this.date,
    required this.username,
    required this.roomDetails,
    required this.pricePer30Days,
  });
}

class adminLanggananApp extends StatefulWidget {
  const adminLanggananApp({super.key});

  @override
  State<adminLanggananApp> createState() => _adminLanggananAppState();
}

class _adminLanggananAppState extends State<adminLanggananApp> {
  Color warna1 = Colors.brown.shade200;
  Color warna2 = Colors.brown;

  // Data contoh
  final List<adminLangganan> subscriptions = [
    adminLangganan(
      date: "2024-06-07",
      username: "andy",
      roomDetails: "kamar 05, Lt. 1",
      pricePer30Days: "Rp. 800.000 - 30 Hari",
    ),
    adminLangganan(
      date: "2024-06-01",
      username: "vibex",
      roomDetails: "kamar 01, Lt. 1",
      pricePer30Days: "Rp. 800.000 - 30 Hari",
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var subscription in subscriptions) {
        int remainingDays = calculateRemainingDays(subscription.date);
        if (remainingDays <= 5 && remainingDays > 0) {
          _showAlertDialog('Peringatan: Segera lakukan pembayaran untuk ${subscription.username}!');
        } else if (remainingDays <= 0 && remainingDays > -10) {
          _showAlertDialog('Peringatan: Sudah melewati batas pembayaran untuk ${subscription.username}!');
        }
      }
    });
  }

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

  void _showDetailDialog(adminLangganan subscription, int remainingDays) {
    final TextEditingController daysController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detail Pembayaran - ${subscription.username}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tanggal Pemesanan: ${DateFormat('yyyy-MM-dd').format(DateTime.parse(subscription.date))}'),
              Text('Nomor Kamar dan Lantai: ${subscription.roomDetails}'),
              Text('Harga per 30 Hari: ${subscription.pricePer30Days}'),
              Text('Sisa Waktu: $remainingDays Hari'),
              TextField(
                controller: daysController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Masukkan jumlah hari untuk memperbarui countdown',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Perbarui Countdown'),
              onPressed: () {
                final int? newRemainingDays = int.tryParse(daysController.text);
                if (newRemainingDays != null && newRemainingDays >= 0) {
                  setState(() {
                    subscription.date = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 30 - newRemainingDays)));
                  });
                }
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Batalkan Langganan'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  subscriptions.remove(subscription);
                });
              },
            ),
          ],
        );
      },
    );
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
      body: ListView.builder(
        itemCount: subscriptions.length,
        itemBuilder: (context, index) {
          final subscription = subscriptions[index];
          int remainingDays = calculateRemainingDays(subscription.date);

          if (remainingDays == -11) {
            return ListTile(
              title: Text(
                "Data untuk ${subscription.username} telah dihapus",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            );
          }

          return GestureDetector(
            onTap: () => _showDetailDialog(subscription, remainingDays),
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
                          DateFormat('yyyy-MM-dd').format(DateTime.parse(subscription.date)),
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
                              subscription.username,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              subscription.pricePer30Days,
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
                          subscription.roomDetails,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          remainingDays > 0
                              ? '$remainingDays Hari'
                              : '${remainingDays.abs()} Hari (-)',
                          style: TextStyle(
                            fontSize: 13,
                            color: remainingDays > 0
                                ? Colors.black
                                : Colors.red,
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
      ),
    );
  }
}

