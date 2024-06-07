import 'package:komas_latihan/CostumView/lantai.dart';
import 'package:komas_latihan/pages/pemesanan_page.dart';
import 'package:flutter/material.dart';



// ignore: must_be_immutable
class PemesananltPage extends StatefulWidget {
   PemesananltPage({super.key, required this.admin, required this.lantaikamar});

   bool admin;
   bool lantaikamar;

  @override
  State<PemesananltPage> createState() => _Pemesananlt1pageState(admin : admin, lantaikamar: lantaikamar);
}

class _Pemesananlt1pageState extends State<PemesananltPage> {
  _Pemesananlt1pageState({required this.admin, required this.lantaikamar});
  bool admin;

  bool lantaikamar;
  

  final PageStorageBucket bucket = PageStorageBucket();

    bool bayar = true;
    double tinggibar = 90;

  Color warna1 = Colors.brown.shade200;
  Color warna2 = Colors.brown;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:       
      PageStorage(
        bucket: bucket,
        child: Lantai(lantaikamar: lantaikamar),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          backgroundColor:warna2,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          mini: true,
          child: const Icon(Icons.arrow_back),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                    textAlign: TextAlign.start,
                    "Rp",
                  style: TextStyle(color: Colors.white, fontSize: 12)
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child:
                    Row(
                      children: [
                        Text(
                          "800.000",
                        style: TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold)
                        ),
                      ],
                    )
                  ),
                  ],
                ),
              ),
              InkWell (
                onTap: () {
                  showModalBottomSheet(
                    
                    // shape: const RoundedRectangleBorder(
                    // borderRadius:
                    //   BorderRadius.vertical(top: Radius.circular(32))),
                    showDragHandle: true,
                    context: context,
                    builder: (BuildContext context){
                      return SizedBox(
                        height: 310,
                      child : Pemesanan(admin: admin,lantai: lantaikamar,),

                      );
                    }
                  );
                },
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: warna1,
                      style: BorderStyle.solid,
                      width: 1
                    ),
                    boxShadow: [BoxShadow(
                      color: warna1.withOpacity(0.2),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                    ],
                    color: Colors.white,
                  ),
                  child: 
                  admin?
                  Text(
                    textAlign: TextAlign.center,
                    "Pesan Kamar",
                    style: TextStyle(fontSize: 12, color: warna2, fontWeight: FontWeight.bold),
                  ): Text(
                    textAlign: TextAlign.center,
                    "Lihat Kamar",
                    style: TextStyle(fontSize: 12, color: warna2, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}