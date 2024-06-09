import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var subscription in subscriptions) {
        int remainingDays = calculateRemainingDays(subscription.date);
        if (remainingDays <= 5 && remainingDays > 0) {
          _showAlertDialog('Peringatan: Segera lakukan pembayaran untuk ${subscription.roomDetails}');
        } else if (remainingDays <= 0 && remainingDays > -10) {
          _showAlertDialog('Peringatan: Sudah melewati batas pembayaran untuk ${subscription.roomDetails}. Segera lakukan pembayaran');
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

  void _showDetailDialog(Langganan subscription, int remainingDays) {
    final nextPaymentDate = DateTime.now().add(Duration(days: remainingDays));
    final nextPaymentEndDate = nextPaymentDate.add(const Duration(days: 30));

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
              const SizedBox(height: 10),
              Text('Pembayaran Bulan Selanjutnya:'),
              Text('Tanggal Mulai: ${DateFormat('yyyy-MM-dd').format(nextPaymentDate)}'),
              Text('Tanggal Berakhir: ${DateFormat('yyyy-MM-dd').format(nextPaymentEndDate)}'),
              Text('Harga: ${subscription.pricePer30Days}'),
              Text('Sisa Waktu: $remainingDays Hari'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Lanjut Langganan'),
              onPressed: () {
                Navigator.of(context).pop();
                _showConfirmationDialog(subscription, nextPaymentDate, nextPaymentEndDate);
              },
            ),
            TextButton(
              child: const Text('Kembali'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            
          ],
        );
      },
    );
  }

  void _showConfirmationDialog(Langganan subscription, DateTime nextPaymentDate, DateTime nextPaymentEndDate) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Pembayaran'),
          content: Text(
              'Apakah Anda ingin melanjutkan langganan untuk ${subscription.username} dari ${DateFormat('yyyy-MM-dd').format(nextPaymentDate)} hingga ${DateFormat('yyyy-MM-dd').format(nextPaymentEndDate)} dengan harga ${subscription.pricePer30Days}?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Ya'),
              onPressed: () {
                Navigator.of(context).pop();
                CoolAlert.show(
                      context: context, 
                      type: CoolAlertType.success,
                      title: 'Pembayaran diproses!',
                      titleTextStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      text : 'Menunggu Verfikasi Langganan yang diperpanjang dari ${DateFormat('yyyy-MM-dd').format(nextPaymentDate)} hingga ${DateFormat('yyyy-MM-dd').format(nextPaymentEndDate)} untuk bulan depan',
                      textTextStyle: TextStyle(fontSize: 12)
                    );
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
                              ? 'Tersisa $remainingDays Hari lagi'
                              : 'Telat Bayar ${remainingDays.abs()} Hari',
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