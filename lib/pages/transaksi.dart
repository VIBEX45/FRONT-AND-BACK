import 'package:cool_alert/cool_alert.dart';
import 'package:komas_latihan/pages/buktitransfer_page.dart';
import 'package:flutter/material.dart';
import 'package:komas_latihan/utils/shared_pref.dart';

class UserLogged {
  String? username, phonenumber, email, roleId, token;

  UserLogged.fromList(List<String> list) {
    username = list[0];
    phonenumber = list[1];
    email = list[2];
    roleId = list[3];
    token = list[4];
  }
}

// ignore: must_be_immutable
class Transaksi extends StatefulWidget {
  Transaksi({super.key, this.harga, required this.kamar, required this.lantai});
  int? harga;
  String kamar;
  String lantai;

  @override
//   State<Transaksi> createState() => _TransaksiState(harga: harga, kamar: kamar, lantai: lantai);
// }
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  // _TransaksiState({required this.harga, required this.kamar, required this.lantai});

  // late String kamar;
  // late String lantai;
  // late int harga;

  Color warna1 = Colors.brown.shade100;
  Color warna2 = Colors.brown;
  double tinggibar = 90;

  bool? check = false;

  Future<UserLogged> getLoggedUser(key) async {
    List<String>? logged = await MySharedPreferences.fetchFromShared(key);
    return UserLogged.fromList(logged!);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    UserLogged? userLogged;
    
    return Scaffold(
        backgroundColor: Colors.white,
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
                    "Pembayaran",
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
        bottomNavigationBar: BottomAppBar(
          color: warna2,
          height: tinggibar,
          shadowColor: Colors.black,
          child: SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //tab
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 80),
                        child: Text(
                            textAlign: TextAlign.start,
                            "Rp",
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                      Text("800.000",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (check == false) {
                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.warning,
                          title: 'Belum Dipilih',
                          text:
                              '\nsilahkan memilih kamar \nterlebih dahulu untuk dibayar\n',
                        );
                      } else {
                        Future<UserLogged>? loggedUser = getLoggedUser("_userLogged").then((value) {
                          userLogged = value;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BuktiTransfer(
                                userName: userLogged!.username,
                                phoneNumber: userLogged!.phonenumber,
                                email: userLogged!.email,
                                floorNumber: widget.lantai,
                                roomNumber: widget.kamar,
                              ),
                            )
                          );
                          return value;
                        });
                          
                      }
                    });
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    alignment: Alignment.centerRight,
                    height: 45,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: warna1, style: BorderStyle.solid, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: warna1.withOpacity(0.2),
                          blurRadius: 2,
                          spreadRadius: 1,
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        textAlign: TextAlign.center,
                        "Pesan Kamar",
                        style: TextStyle(
                            fontSize: 12,
                            color: warna2,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return keranjang(index);
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 0,
              );
            },
            itemCount: 1));
  }

  Widget keranjang(int index) {
    return Card(
      color: warna1,
      child: Container(
        margin: const EdgeInsets.only(left: 15, top: 20, right: 15, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                      value: check,
                      activeColor: warna2,
                      onChanged: (value) {
                        setState(() {
                          check = value;
                        });
                      }),
                  const SizedBox(
                    height: 7,
                  ),
                  Column(
                    children: [
                      Text(
                        'Kamar ${widget.kamar}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Lantai ${widget.lantai}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  'Rp. ${widget.harga.toString().substring(0, 3)}.${widget.harga.toString().substring(
                        3,
                      )} /',
                  style: TextStyle(
                      fontSize: 13, color: warna2, fontWeight: FontWeight.bold),
                ),
                Text(
                  '30 Hari',
                  style: TextStyle(
                      fontSize: 13, color: warna2, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
