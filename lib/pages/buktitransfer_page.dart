import 'dart:io';

import 'package:komas_latihan/pages/home_page.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BuktiTransfer extends StatefulWidget {
  const BuktiTransfer({super.key});

  @override
  State<BuktiTransfer> createState() => _BuktiTransferState();
}

class _BuktiTransferState extends State<BuktiTransfer> {

  
  Color warna1 = Colors.brown.shade100;
  Color warna2 = Colors.brown;

  File ? gambar;

  void selectimage() async{
    final img = await ImagePicker().pickImage(source :ImageSource.gallery);

    if(img == null) return;
    setState(() {
      gambar = File(img.path); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left:15, top: 40),
        child: Center(
          child: ListView(
            children:[ 
              const Text(
                  "Input Bukti Tansaksi",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                  "Tutorial Membayar",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black
                  ),
                ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    tutorial('1. Login ke MBanking/ATM terdekat'),
                    tutorial('2. Pada menu utama, pilih opsi "Transfer" untuk memulai proses pembayaran '),
                    tutorial('3. Pilih opsi untuk transfer ke bank BCA'),
                    tutorial('4. Masukkan nomor rekening tujuan: 5526262666 An AlfizaKos.'),
                    tutorial('5. Masukkan jumlah uang yang akan dibayar sesuai dengan tagihan bulanan kos yang kamu ambil.'),
                    tutorial('6. Pada kolom keterangan, tulis informasi yang membantu konfirmasi  pembayaran, seperti "Pembayaran Kos Bulan [masukkan bulan]"'),
                    tutorial('7. Konfirmasi dan Lakukan Transfer'),
                    tutorial('8. Setelah transaksi berhasil, simpan bukti transfer yang muncul. Screenshot atau foto bukti transfer.'),
                    tutorial('9. Silahkan upload bukti transaksi dibagian bawah ini untuk mengkonfirmasi pembayaran Kos!'),
                  ],
                ),
              ), 
                const SizedBox(
                  height: 10,
                ),

                gambar != null ?

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.7,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: warna1.withOpacity(0.2)
                          ),
                        ],
                        image: DecorationImage(
                          image: FileImage(gambar!),
                          fit: BoxFit.cover,
                          ),
                      ),
                    ),
                  ):
              DottedBorder(
                color: Colors.black,
                strokeWidth: 1,
                borderPadding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: (){
                    selectimage();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    child: const Icon(Icons.camera, size: 60,weight: 0.7,)),
                ),
              ),
                const SizedBox(
                  height: 40,
                ),
              savecancel(),

                const SizedBox(
                  height: 100,
                ),
            ]
          ),
        ),
      ),
    );
  }

  Widget tutorial(String tutor){
    return Text(
      textAlign: TextAlign.left,
      tutor,
      style: const TextStyle(
        fontSize: 10.3,
      ),
    );
  }

    
Widget savecancel(){
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OutlinedButton(
          onPressed: (){
            setState(() {
              Navigator.of(context).pop();
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
            gambar != null?
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(admin: true),));
              CoolAlert.show(
                // backgroundColor: Colors.white,
                context: context,
                type: CoolAlertType.success,
                title: 'Berhasil',
                text: "\nTunggu beberapa menit, Permintaan anda sedang diproses\n",
              );
            }):
            setState(() {
             
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: gambar != null? warna2: warna1,
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