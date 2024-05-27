import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AdminNotif{
  bool read = false;
  String notifdesk;
  String notifpengirim;
  
  String tanggl = DateFormat("dd-MM-yyyy").format(DateTime.now());
  
  String waktu = DateFormat("HH-mm").format(DateTime.now());
  
  AdminNotif({ required this.notifdesk, required this.notifpengirim});
}

class AdminNotifikasiPage extends StatefulWidget {
  const AdminNotifikasiPage({super.key});


  @override
  State<AdminNotifikasiPage> createState() => _AdminNotifikasiPageState();
}

class _AdminNotifikasiPageState extends State<AdminNotifikasiPage> {

  String ending = '...';

  bool tambah = true;
  
  List<AdminNotif> notif = ([
    AdminNotif(
      notifdesk : 'hari ini ada kegiatan bersih - bersih kos. jadi tolong untuk semua penghuni dapat membersihkan kamarnya karna ibu akan skalian periksa sampai kedalam kamar.',
      notifpengirim : 'kost kostan',
    ),
    AdminNotif(
      notifdesk : 'woyy yang belum bersihin kamar mandi siapa? piket siapa hari ini?',
      notifpengirim : 'penjaga kost',
    ),
    AdminNotif(
      notifdesk : 'seluruh penghuni kost harus nonton film finding nemo. gak mau tau',
      notifpengirim : 'Ibu Kost',
    ),
    AdminNotif(
      notifdesk : 'jangan lupa beri bintang 5 ya boskuu',
      notifpengirim : 'Ibu Kost',
    ),
    
  ]);

    Color warna1 = Colors.brown.shade200;
    Color warna2 = Colors.brown;

  
  TextEditingController namaController= TextEditingController();
  TextEditingController deskripsiController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return 
    tambah?
    Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: FloatingActionButton(
          onPressed: (){
            setState(() {
              tambah = false;
            });
          },
          backgroundColor: warna2,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          mini: true,
          child: const Icon(Icons.add),
        ),
      ),

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
                      fontSize: 15
                    ),
                  ),
              ),
            ),
          ],
        ),
    ),
      body:
      listView()
    ):
    Scaffold(
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
                    "Tambah Notifikasi",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),
                  ),
              ),
            ),
          ],
        ),
    ),
    body: ListView(
      children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width*0.8,
            padding: const EdgeInsets.only(top: 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nama Pengirim',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                    controller: namaController,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-z A-Z 0-9]'))],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(bottom: 5),
                        hintFadeDuration: Duration(milliseconds: 300),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                  const Text(
                  'Deskripsi',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                  TextField(
                    controller: deskripsiController,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-z A-Z 0-9]'))],
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 5),
                        border: OutlineInputBorder(),
                        hintFadeDuration: Duration(milliseconds: 300),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                    ),
                  ),
                const SizedBox(
                  height: 30,
                ),

                  savecancel()
              ],
            ),
          ),
        ),
      ],
    ),
    );
  
  }
  Widget listView(){
    return ListView.separated(itemBuilder: (context, index){
      return InkWell(
      onTap: (){
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
                            notif[index].read = true;
                          });
                          Navigator.of(context).pop();
                          
                        },
                        child: Text('oke',  style: TextStyle(fontSize: 12, color: warna2),)
                        ),
                    ),
                  ),
                ],
                icon: Image.asset('lib/src/images/dashboardkos.jpeg', height: 120, fit: BoxFit.cover, ),
                title: Text(
                  textAlign: TextAlign.center,
                  notif[index].notifpengirim,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  ),
                content: Padding(
                    padding: const EdgeInsets.only(right: 25, left: 25, top: 15),
                    child: Text(
                      textAlign: TextAlign.center,
                      notif[index].notifdesk,
                      style: const TextStyle(
                      fontSize: 10,
                    ),
                    ),
                  ),
              )
              );


            // AlertDialog(
              // contentPadding: EdgeInsets.zero,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(borderRadius),
            //   ),
          });
      },
      child: Container(
        margin: const EdgeInsets.only(left: 5, top: 10, right: 15, bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 30,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.notifications, size: 25, color: Colors.grey.shade700),
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
                          notif[index].notifpengirim,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              notif[index].notifdesk.substring(0, 5) + ending,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ]
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            notif[index].tanggl.toString(),
                            style: const TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            notif[index].waktu.toString(),
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
    }, separatorBuilder: (context, index){
      return const Divider(height: 0,);
    }, itemCount: notif.length);
  }

  
Widget savecancel(){
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton(
          onPressed: (){
            setState(() {
              tambah = true;
            });
          }, 
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          child: const Text(
            "CANCEL",
            style: TextStyle(
              fontSize: 10,
              letterSpacing: 2,
              color: Colors.black
            ),
          ),
          ),
        ElevatedButton(
          onPressed: (){

            String nama = namaController.text.trim();
            String deskripsi = deskripsiController.text.trim();

            setState(() {
              
              namaController.text = '';
              deskripsiController.text = '';
              notif.add(AdminNotif(notifpengirim: nama, notifdesk: deskripsi));
              tambah = true;

            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: warna2,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
          ),
            child: const Text(
            "SAVE", style: TextStyle(
              fontSize: 10,
              letterSpacing: 2, 
              color: Colors.white,
            ),
          ),
        )
      ],
    ),
  );
}

}