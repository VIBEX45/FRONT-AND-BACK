import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


class AdminProfilPage extends StatefulWidget {
  const AdminProfilPage({super.key});

  @override
  State <AdminProfilPage> createState() => _AdminProfilPageState();
}

class _AdminProfilPageState extends State<AdminProfilPage> {

  bool pilihan = true;
  TextEditingController kunci = TextEditingController();
  TextEditingController masukkannamaController= TextEditingController();
  TextEditingController masukkankamarController= TextEditingController();
  TextEditingController masukkantelpController = TextEditingController();
  TextEditingController masukkanemailController = TextEditingController();
  TextEditingController masukkanpasswordController = TextEditingController();

  List<Kontak> kontak = [
    Kontak(
      masukkankamar: "Kamar No 7", 
      masukkannama: "Nama Kids", 
      masukkantelp: "0800000000",
      masukkanemail: "nanda3ka2003@gmail.com",
      masukkanpassword: "GorontaloAnjay"
      )
  ];

  int selectedindex = 0;

  File ? gambar;

  void selectimage() async{
    final img = await ImagePicker().pickImage(source :ImageSource.gallery);

    if(img == null) return;
    setState(() {
      gambar = File(img.path); 
    });
  }

  Color warna1 = Colors.brown.shade200;
  Color warna2 = Colors.brown;

  @override
  Widget build(BuildContext context) {

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
                    "Profil Setting",
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
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  gambar != null ?

                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: warna1.withOpacity(0.2)
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: FileImage(gambar!),
                          fit: BoxFit.cover,
                          ),
                      ),
                    ),
                  ):
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: warna1.withOpacity(0.2)
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage('lib/src/images/3.jpeg'),
                          fit: BoxFit.cover,
                          ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: (){
                        selectimage();
                      },
                      child: Container(
                        height: 28,
                        width: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          ),
                          color: warna2,
                        ),
                        child: const Icon(
                          Icons.photo_camera,
                          size: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            pilihan ? 
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
            child: Column(
              children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 30,),
                  child: Icon(
                    Icons.person_outlined,
                      size: 25,
                      ),
                ),
                  buildTextField1(
                  "Nama",
                  selectedindex, 
                  "Gunakan nama yang di ketahui dengan\nbaik dan benar untuk memudahkan informasi"
                ),
                ],
                ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 30,),
                  child: Icon(
                    Icons.info_outline,
                      size: 25,
                      ),
                ),
                  buildTextField2(
                  "Info",
                  selectedindex, 
                  "Informasi ini menunjukan status anda,\njika anda bukan anak kos, isilah sesuai status anda"
                  ),
                ],
                ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 30,),
                  child: Icon(
                    Icons.phone,
                      size: 25,
                      ),
                ),
                  buildTextField3(
                    "Telephon",
                    selectedindex,
                    ""
                    ),
                ],
                ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 30,),
                  child: Icon(
                    Icons.mail,
                      size: 25,
                      ),
                ),
                  buildTextField4(
                    "Email",
                    selectedindex,
                    "Gunakan Email Aktif"
                    ),
                ],
                ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 30,),
                  child: Icon(
                    Icons.password,
                      size: 25,
                      ),
                ),
                  buildTextField5(
                    "Password",
                    selectedindex,
                    "Gunakan Password yang muda di ingat"
                    ),
                ],
                ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: (){
                  //
                  //
                    setState(() {
                      pilihan = false;
                    });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: warna2,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                ),
                  child: const Text(
                  "Edit Profil", style: TextStyle(
                    fontSize: 10,
                    letterSpacing: 2, 
                    color: Colors.white,
                  ),
                ),
              ),
              ],
            ),
            ):
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                fituredit1("Nama", "Masukkan Nama..."),
                fituredit2("Info", "Masukkan nomor kamar..."),
                fituredit3("Telepon", "Masukkan nomor telepon..."),
                fituredit4("Email", "Masukkan Alamat Email..."),
                fituredit5("Password", "Masukkan Password Baru..."),
              savecancel(),
              ] 
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
        ),
        ),
    );
  }
Widget buildTextField1(String labelText, int index, String informasi) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 20),
          child: Container(
            alignment: Alignment.centerLeft,
            width: 190,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                  labelText,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                  kontak[index].masukkannama,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                    informasi,
                    style: const TextStyle(fontSize: 8, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            child: const Icon(Icons.edit,
            size: 19,
            color: Colors.grey,
            ),
            onTap: () {
              setState(() {
              });
            },
          ),
        ),
      ],
    ),
  );
}

Widget buildTextField2(String labelText, int index, String informasi) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 20),
          child: Container(
            alignment: Alignment.centerLeft,
            width: 190,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                  labelText,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                  kontak[index].masukkankamar,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                    informasi,
                    style: const TextStyle(fontSize: 8, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    child: const Icon(Icons.edit,
                    size: 19,
                    color: Colors.grey,
                    ),
                    onTap: () {
                      setState(() {
                      });
                    },
                  ),
                ),
      ],
    ),
  );
}

Widget buildTextField3(String labelText, int index, String informasi) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 20),
          child: Container(
            alignment: Alignment.centerLeft,
            width: 190,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                  labelText,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                  kontak[index].masukkantelp,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                    informasi,
                    style: const TextStyle(fontSize: 8, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    child: const Icon(Icons.edit,
                    size: 19,
                    color: Colors.grey,
                    ),
                    onTap: () {
                      setState(() {
                      });
                    },
                  ),
                ),
      ],
    ),
  );
}

Widget buildTextField4(String labelText, int index, String informasi) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 20),
          child: Container(
            alignment: Alignment.centerLeft,
            width: 190,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                  labelText,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                  kontak[index].masukkanemail,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                    informasi,
                    style: const TextStyle(fontSize: 8, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    child: const Icon(Icons.edit,
                    size: 19,
                    color: Colors.grey,
                    ),
                    onTap: () {
                      setState(() {
                      });
                    },
                  ),
                ),
      ],
    ),
  );
}

Widget buildTextField5(String labelText, int index, String informasi) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 20),
          child: Container(
            alignment: Alignment.centerLeft,
            width: 190,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                  labelText,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                  kontak[index].masukkanpassword,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                    informasi,
                    style: const TextStyle(fontSize: 8, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    child: const Icon(Icons.edit,
                    size: 19,
                    color: Colors.grey,
                    ),
                    onTap: () {
                      setState(() {
                      });
                    },
                  ),
                ),
      ],
    ),
  );
}

Widget fituredit1(String label, String placeholder){
  return Padding(
    padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
    child: TextField(
            controller: masukkannamaController,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-z A-Z]'))],
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(bottom: 5),
                labelText: label,
                hintFadeDuration: const Duration(milliseconds: 300),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: placeholder,
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
            ),
          ),
  );
}

Widget fituredit2(String label, String placeholder){
  return Padding(
    padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
    child: TextField(
            controller: masukkankamarController,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-z A-Z 0-9]'))],
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(bottom: 5),
                labelText: label,
                hintFadeDuration: const Duration(milliseconds: 300),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: placeholder,
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
            ),
          ),
  );
}

Widget fituredit3(String label, String placeholder){
  return Padding(
    padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
    child: TextField(
            controller: masukkantelpController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(bottom: 5),
                labelText: label,
                hintFadeDuration: const Duration(milliseconds: 300),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: placeholder,
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
            ),
          ),
  );
}

Widget fituredit4(String label, String placeholder){
  return Padding(
    padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
    child: TextField(
            controller: masukkanemailController,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9@.]'))],
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(bottom: 5),
                labelText: label,
                hintFadeDuration: const Duration(milliseconds: 300),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: placeholder,
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
            ),
          ),
  );
}

Widget fituredit5(String label, String placeholder){
  return Padding(
    padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
    child: TextField(
            controller: masukkanpasswordController,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(bottom: 5),
                labelText: label,
                hintFadeDuration: const Duration(milliseconds: 300),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: placeholder,
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
            ),
          ),
  );
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
              masukkannamaController.text = '';
              masukkankamarController.text = '';
              masukkantelpController.text = '';
              masukkanemailController.text = '';
              masukkanpasswordController.text = '';
              pilihan = true;
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
            //
            String masukkannama = masukkannamaController.text.trim();
            String masukkankamar = masukkankamarController.text.trim();
            String masukkantelp = masukkantelpController.text.trim();
            String masukkanemail= masukkanemailController.text.trim();
            String masukkanpassword = masukkanpasswordController.text.trim();
            //
    
            //
            if(masukkannama.isNotEmpty && masukkankamar.isNotEmpty && masukkantelp.isNotEmpty && masukkanemail.isNotEmpty && masukkanpassword.isNotEmpty){
              if ( kontak.isEmpty ) {
                setState(() {
                masukkannamaController.text = '';
                masukkankamarController.text = '';
                masukkantelpController.text = '';
                masukkanemailController.text = '';
                masukkanpasswordController.text = '';
                kontak.add(Kontak(masukkankamar: masukkankamar, masukkannama: masukkannama, masukkantelp: masukkantelp, masukkanemail: masukkanemail, masukkanpassword: masukkanpassword));
                pilihan = true;
                });
              }  
                setState(() {
                  masukkannamaController.text = '';
                  masukkankamarController.text = '';
                  masukkantelpController.text = '';
                  masukkanemailController.text = '';
                  masukkanpasswordController.text = '';
                  
                  kontak[selectedindex].masukkannama = masukkannama;
                  kontak[selectedindex].masukkankamar = masukkankamar;
                  kontak[selectedindex].masukkantelp = masukkantelp;
                  kontak[selectedindex].masukkanemail = masukkanemail;
                  kontak[selectedindex].masukkanpassword = masukkanpassword;
                  pilihan = true;
                }
              );
            } 
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

class Kontak {
  String masukkannama;
  String masukkankamar;
  String masukkantelp;
  String masukkanemail;
  String masukkanpassword;


  Kontak({required this.masukkankamar, required this.masukkannama, 
  required this.masukkantelp, required this.masukkanemail, required this.masukkanpassword});
}