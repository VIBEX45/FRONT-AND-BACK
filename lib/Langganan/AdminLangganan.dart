import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdminLangganan {
  final String date;
  final String username;
  final String roomDetails;
  final String pricePer30Days;
  int addedDays;

  AdminLangganan({
    required this.date,
    required this.username,
    required this.roomDetails,
    required this.pricePer30Days,
    this.addedDays = 0,
  });
}

class AdminLanggananApp extends StatefulWidget {
  const AdminLanggananApp({super.key});

  @override
  State<AdminLanggananApp> createState() => _AdminLanggananAppState();
}

class _AdminLanggananAppState extends State<AdminLanggananApp> {
  Color warna1 = Colors.brown.shade200;
  Color warna2 = Colors.brown;

  // Data contoh
  final List<AdminLangganan> subscriptions = [
    AdminLangganan(
      date: "2024-06-07",
      username: "andy",
      roomDetails: "kamar 05, Lt. 1",
      pricePer30Days: "Rp. 800.000 - 30 Hari",
    ),
    AdminLangganan(
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
        int remainingDays = calculateRemainingDays(subscription);
        if (remainingDays <= 5 && remainingDays > 0) {
          _showAlertDialog('Peringatan: Segera lakukan pembayaran untuk ${subscription.username}!');
        } else if (remainingDays <= 0 && remainingDays > -10) {
          _showAlertDialog('Peringatan: Sudah melewati batas pembayaran untuk ${subscription.username}!');
        }
      }
    });
  }

  int calculateRemainingDays(AdminLangganan subscription) {
    final start = DateTime.parse(subscription.date);
    final now = DateTime.now();
    final difference = now.difference(start).inDays;
    final remainingDays = 30 - difference + subscription.addedDays;

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

  void _showAddDaysDialog(AdminLangganan subscription) {
    final TextEditingController daysController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tambah Hari - ${subscription.username}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  Navigator.of(context).pop();
                  _showConfirmDaysDialog(subscription, newRemainingDays);
                }
              },
            ),
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showConfirmDaysDialog(AdminLangganan subscription, int newRemainingDays) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Tambah Hari'),
          content: Text('Apakah Anda yakin ingin menambah $newRemainingDays hari untuk ${subscription.username}?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Ya'),
              onPressed: () {
                setState(() {
                  subscription.addedDays += newRemainingDays;
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop();
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
          int remainingDays = calculateRemainingDays(subscription);

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

          return Card(
            child: Container(
              margin: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                  PopupMenuButton<String>(
                    color: warna2,
                    onSelected: (value) {
                      if (value == 'Tambah Hari') {
                        _showAddDaysDialog(subscription);
                      } else if (value == 'Hapus Langganan') {
                        setState(() {
                          subscriptions.remove(subscription);
                        });
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return {'Tambah Hari', 'Hapus Langganan'}
                          .map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice, style: TextStyle(color: Colors.white)),
                        );
                      }).toList();
                    },
                    icon: Icon(Icons.more_vert, color: warna2),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}