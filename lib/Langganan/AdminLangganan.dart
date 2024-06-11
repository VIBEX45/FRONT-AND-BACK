import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:komas_latihan/utils/client_request.dart';
import 'package:komas_latihan/utils/settings.dart';
import 'package:komas_latihan/utils/shared_pref.dart';

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
      date: "2024-05-15",
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
    futureSubs = getFutureSubs(MySettings.getUrl() + ("rent/users"));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var subscription in subscriptions) {
        int remainingDays = calculateRemainingDays(subscription);
        if (remainingDays <= 3 && remainingDays > 0) {
          _showAlertDialog(
              'pembayaran untuk ${subscription.username} di ${subscription.roomDetails} sudah dekat');
        } else if (remainingDays <= 0 && remainingDays > -10) {
          _showAlertDialog(
              'pembayaran untuk ${subscription.username} di ${subscription.roomDetails} telah melewati batas');
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

  int calculateUserRemainingDays(Subscribe sub) {
    final start = DateTime.parse(sub.startDate!);
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
          title: const Text('Pemberitahuan'),
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

  void _showConfirmDaysDialog(
      AdminLangganan subscription, int newRemainingDays) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Tambah Hari'),
          content: Text(
              'Apakah Anda yakin ingin menambah $newRemainingDays hari untuk ${subscription.username}?'),
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

  Future<void> handleRefresh() async {
    setState(() {
      futureSubs = getFutureSubs(MySettings.getUrl() + ("rent/users"));
    });
  }

  Widget futureListView(BuildContext context, List<Subscribe> subs) {
    print("FutureListView");
    return RefreshIndicator(
        onRefresh: handleRefresh,
        child: ListView.builder(
          itemCount: subs.length,
          itemBuilder: (context, index) {
            final subscription = subs[index];
            int remainingDays = calculateUserRemainingDays(subs[index]);

            if (remainingDays == -11) {
              return ListTile(
                title: Text(
                  "Data untuk ${subs[index].userName} telah dihapus",
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
                                "${DateFormat('yyyy-MM-dd').format(DateTime.parse(subs[index].startDate!))} s/d ${DateFormat('yyyy-MM-dd').format(DateTime.parse(subs[index].endDate!))}",
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
                                subs[index].userName!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Rp. ${subs[index].roomPrice!}",
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
                                "Kamar No. ${subs[index].roomNumber} Lt. ${subs[index].floorNumber}",
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                int.parse(subs[index].due!) > 0
                                    ? '${subs[index].due} Hari'
                                    : '${int.parse(subs[index].due!).abs()} Hari (-)',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: int.parse(subs[index].due!) > 0
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
                          showAddDialog(subs[index]);
                          // _showAddDaysDialog(subscription);
                        } else if (value == 'Hapus Langganan') {
                          showConfirmDeleteRent(subs[index]);
                          // setState(() {
                          //   // subscriptions.remove(subscription);
                          //   deleteRent(MySettings.getUrl() +
                          //       ("rent/delete/${subs[index].roomNumber}/${subs[index].floorNumber}/${subs[index].userName}"));
                          // });
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return {'Tambah Hari', 'Hapus Langganan'}
                            .map((String choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice,
                                style: const TextStyle(color: Colors.white)),
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
        ));
  }

  //Update Due
  void updateDueDays(String url, Subscribe sub, String due) {
    Map<String, dynamic> updateBody = {
      "userName": sub.userName,
      "roomNumber": sub.roomNumber,
      "floorNumber": sub.floorNumber,
      "addDue": due
    };
    ClientRequest.updateData(url, updateBody).then((res) {
      print(res);
      if (res["status"] == "OK") {
        setState(() {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            title: 'Berhasil',
            text: "\nBerhasil menambah hari\n",
          );
        });
      } else {
        setState(() {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: 'Gagal',
            text: "\nGagal menambah hari\n",
          );
        });
      }
    });
  }

  void deleteRent(String url) {
    ClientRequest.deleteData(url).then((value) {
      print(value);
      if (value["status"] == "OK") {
        setState(() {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            title: 'Berhasil',
            text: "\nBerhasil menghapus sewa\n",
          );
        });
      } else {
        setState(() {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            title: 'Gagal',
            text: "\nGagal menghapus sewa\n",
          );
        });
      }
    });
  }

//Confirm User
  void _showConfirmUserDaysDialog(Subscribe sub, String addDays) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Tambah Hari'),
          content: Text(
              'Apakah Anda yakin ingin menambah $addDays hari untuk ${sub.userName}?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Ya'),
              onPressed: () {
                setState(() {
                  updateDueDays(
                      MySettings.getUrl() + ("rent/update/"), sub, addDays);
                  Navigator.of(context).pop();
                });
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

  void showConfirmDeleteRent(Subscribe sub) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hapus Langganan'),
          content: Text('Apakah Anda yakin ingin hapus sewa ${sub.userName}?'),
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
                setState(() {
                  Navigator.of(context).pop();
                  deleteRent(MySettings.getUrl() +
                      ("rent/delete/${sub.roomNumber}/${sub.floorNumber}/${sub.userName}"));
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //Shwo add dialog
  void showAddDialog(Subscribe sub) {
    final TextEditingController daysController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tambah Hari untuk ${sub.userName}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: daysController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Masukkan jumlah hari',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Tambah'),
              onPressed: () {
                Navigator.of(context).pop();
                _showConfirmUserDaysDialog(sub, daysController.text.trim());
                // final int? newRemainingDays = int.tryParse(daysController.text);
                // if (newRemainingDays != null && newRemainingDays >= 0) {
                //   Navigator.of(context).pop();
                //   _showConfirmDaysDialog(subscription, newRemainingDays);
                // }
              },
            ),
          ],
        );
      },
    );
  }

  Future<List<Subscribe>>? futureSubs;
  Future<List<Subscribe>> getFutureSubs(String url) async {
    List<Subscribe> subs = [];
    final response = await ClientRequest.getAll(url);
    response.forEach((value) {
      subs.add(Subscribe.fromJson(value));
    });
    return subs;
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
          },
        ));
  }

  Widget emptySubs() {
    return const Center(
        child: Text(
      "Belum ada langganan",
      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
    ));
  }
}
