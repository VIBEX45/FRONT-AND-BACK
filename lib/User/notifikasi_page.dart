import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:komas_latihan/utils/client_request.dart';
import 'package:komas_latihan/utils/date_formate.dart';
import 'package:komas_latihan/utils/settings.dart';
import 'package:komas_latihan/utils/shared_pref.dart';

class Notif {
  bool read = false;
  String notifdesk;
  String notifpengirim;

  String tanggl = DateFormat("dd-MM-yyyy").format(DateTime.now());

  String waktu = DateFormat("HH-mm").format(DateTime.now());

  Notif({required this.notifdesk, required this.notifpengirim});
}

class Notification {
  bool isRead = false, show = true;
  bool? isPaid, isVerified;
  String? id,
      username,
      title,
      content,
      startDate,
      endDate,
      due,
      roomNumber,
      floorNumber;

  Notification.fromJson(Map<String, dynamic> json) {
    id = json["id"].toString();
    username = json["user_name"];
    title = json["title"];
    content = json["content"];
    startDate = json["start_date"];
    endDate = json["end_date"];
    due = json["due"];
    roomNumber = json["room_number"];
    floorNumber = json["floor_number"];
    isRead = int.parse(json["is_read"]) > 0 ? true : false;
    isPaid = int.parse(json["paid"]) > 0 ? true : false;
    isVerified = int.parse(json["verified"]) > 0 ? true : false;
  }
}

class NotifikasiPage extends StatefulWidget {
  const NotifikasiPage({super.key});

  @override
  State<NotifikasiPage> createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  int selectedIndex = 0;

  String ending = '...';

  bool tambah = true;

  // List<Notif> notif = ([
  //   Notif(
  //     notifdesk : 'hari ini ada kegiatan bersih - bersih kos. jadi tolong untuk semua penghuni dapat membersihkan kamarnya karna ibu akan skalian periksa sampai kedalam kamar.',
  //     notifpengirim : 'kost kostan',
  //   ),
  //   Notif(
  //     notifdesk : 'woyy yang belum bersihin kamar mandi siapa? piket siapa hari ini?',
  //     notifpengirim : 'penjaga kost',
  //   ),
  //   Notif(
  //     notifdesk : 'seluruh penghuni kost harus nonton film finding nemo. gak mau tau',
  //     notifpengirim : 'Ibu Kost',
  //   ),
  //   Notif(
  //     notifdesk : 'jangan lupa beri bintang 5 ya boskuu',
  //     notifpengirim : 'Ibu Kost',
  //   ),

  // ]);

  Color warna1 = Colors.brown.shade200;
  Color warna2 = Colors.brown;

  TextEditingController namaController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();

  Future<List<Notification>>? futureNotif;
  Future<List<Notification>> getFutureNotif(String url) async {
    List<String>? userLogged =
        await MySharedPreferences.fetchFromShared("_userLogged");
    String urlPath = url + userLogged![0];
    final response = await ClientRequest.getAll(urlPath);
    List<Notification> notifs = [];
    response.forEach((value) {
      notifs.add(Notification.fromJson(value));
    });
    return notifs;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureNotif = getFutureNotif(MySettings.getUrl() + ("user/notif/"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: warna2,
        automaticallyImplyLeading: false,
        title: Stack(
          children: [
            // Container(
            //   alignment: Alignment.centerLeft,
            //   width: 35,
            //   height: 35,
            //   decoration: const BoxDecoration(
            //     color: Colors.blue,
            //     shape: BoxShape.circle
            //   ),
            //   child: IconButton(
            //     icon: const Icon(
            //       Icons.add,
            //       color: Colors.white,
            //       size: 18,
            //     ),
            //     onPressed: () {

            //     },
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Notifikasi",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
          future: futureNotif,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return futureListView(context, snapshot.data!);
            } else {
              return emptyNotif();
            }
          }),
    );
  }

  void readNotif(List<Notification> notifs, int index) {
    ClientRequest.updateData(
            "${MySettings.getUrl()}user/notif/read/${notifs[index].id!}", {})
        .then((value) {
      if (value["status"] == "OK") {
        setState(() {
          notifs[index].isRead = true;
        });
      } else {
        setState(() {});
      }
    });
  }

  Widget futureListView(BuildContext context, List<Notification> notifs) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          actions: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        readNotif(notifs, index);
                                      });
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Oke',
                                      style: TextStyle(
                                          fontSize: 12, color: warna2),
                                    )),
                              ),
                            ),
                          ],
                          // icon: Image.asset(
                          //   'lib/src/images/dashboardkos.jpeg',
                          //   height: 120,
                          //   fit: BoxFit.cover,
                          // ),
                          title: Text(
                            textAlign: TextAlign.center,
                            notifs[index].title!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          content: Padding(
                            padding: const EdgeInsets.only(
                                right: 25, left: 25, top: 15),
                            child: Text(
                              textAlign: TextAlign.center,
                              notifs[index].content!,
                              style: const TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ));

                // AlertDialog(
                // contentPadding: EdgeInsets.zero,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(borderRadius),
                //   ),
              });
            },
            child: Container(
              margin: const EdgeInsets.only(
                  left: 5, top: 10, right: 15, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  notifs[index].isRead
                      ? Container(
                          height: 50,
                          width: 30,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.notifications,
                              size: 25, color: Colors.grey.shade700),
                        )
                      : Container(
                          height: 50,
                          width: 30,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Badge(
                              child: Icon(Icons.notifications,
                                  size: 25, color: Colors.grey.shade700)),
                        ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, top: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notifs[index].title!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    notifs[index].content!.substring(0, 5) +
                                        ending,
                                    style: const TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  notifs[index].isRead
                                      ? const Text(
                                          'Dibaca',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : const Text(
                                          'Belum Dibaca',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  ("${FormatDate.formateDateFromDateString(notifs[index].startDate!, "dd-MM-yyyy")} s/d ${FormatDate.formateDateFromDateString(notifs[index].endDate!, "dd-MM-yyyy")}"),
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                Text(
                                  "${notifs[index].due!} Hari",
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 0,
          );
        },
        itemCount: notifs.length);
  }

  Widget emptyNotif() {
    return const Center(
        child: Text(
      "Belum Ada Notifikasi",
      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
    ));
  }
}
