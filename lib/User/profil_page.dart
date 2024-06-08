import 'dart:io';
import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:komas_latihan/utils/client_request.dart';
import 'package:komas_latihan/utils/settings.dart';
import 'package:komas_latihan/utils/shared_pref.dart';

import 'package:http/http.dart' as http;

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class User {
  String? username, phonenumber, email, role, token;

  User.fromList(List<String> data) {
    username = data[0];
    phonenumber = data[1];
    email = data[2];
    role = data[3];
    token = data[4];
  }
}

class _ProfilPageState extends State<ProfilPage> {
  bool pilihan = true;
  TextEditingController kunci = TextEditingController();
  TextEditingController masukkannamaController = TextEditingController();
  TextEditingController masukkankamarController = TextEditingController();
  TextEditingController masukkantelpController = TextEditingController();
  TextEditingController masukkanemailController = TextEditingController();
  TextEditingController masukkanpasswordController = TextEditingController();

  List<Kontak> kontak = [
    Kontak(
        masukkankamar: "Kamar No 7",
        masukkannama: "User",
        masukkantelp: "0800000000",
        masukkanemail: "user@gmail.com",
        masukkanpassword: "user")
  ];

  int selectedindex = 0;
  File? gambar;
  String? imgPath;

  void selectimage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (img == null) return;
    setState(() {
      imgPath = img.path;
      gambar = File(img.path);
    });
  }

  Future<bool> uploadImage(String url, String multiPartField, dynamic filePath,
      String filename) async {
    final streamedResponse =
        await ClientRequest.uploadFile(url, multiPartField, filePath, filename);
    final response = await http.Response.fromStream(streamedResponse);
    Map<String, dynamic> json = await jsonDecode(response.body);
    debugPrint(json.toString());
    if (json.isNotEmpty)
      return true;
    else
      return false;
  }

  Future<bool> updateProfile(
      String username, String url, Map<String, dynamic> postBody) async {
    final response = await ClientRequest.postData(url, postBody);
    if (response["status"] == "OK") {
      return true;
    } else {
      return false;
    }
  }

  void getUsernameNuploadProfile(String key, String url, String multiPartField,
      String filePath, Map<String, dynamic> postBody) {
    MySharedPreferences.fetchFromShared(key).then((value) {
      String pathUrl = url + value![0];
      // print(pathUrl);
      if (filePath.isEmpty) {
        updateProfile(username, pathUrl, postBody).then((value) {
          if (value) {
            setState(() {
              Navigator.of(context).pop();
              CoolAlert.show(
                context: context,
                type: CoolAlertType.success,
                title: 'Berhasil',
                text: "\nBerhasil memperbarui profil\n",
              );
            });
          } else {
            debugPrint("Cannot Upload Profile!");
          }
        });
      } else if (filePath.isNotEmpty && postBody.isEmpty) {
        uploadImage(pathUrl, multiPartField, filePath,
                "profil-picture-of_" + value[0] + ".jpg")
            .then((value) {
          if (value) {
            setState(() {
              Navigator.of(context).pop();
              CoolAlert.show(
                context: context,
                type: CoolAlertType.success,
                title: 'Berhasil',
                text: "\nBerhasil mengunggah foto\n",
              );
            });
          } else {
            debugPrint("Cannot Upload Image!");
          }
        });
      } else {
        updateProfile(username, pathUrl, postBody).then((isUpload) {
          uploadImage(pathUrl, multiPartField, filePath,
                  "profil-picture-of_" + value[0] + ".jpg")
              .then((value) {
            if (value && isUpload) {
              setState(() {
                Navigator.of(context).pop();
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.success,
                  title: 'Berhasil',
                  text: "\nBerhasil memperbarui profil\n",
                );
              });
            } else {
              debugPrint("Cannot Upload Profile and Image!");
            }
          });
        });
      }
    });
  }

  String sanitizedNumber(String phoneNumber) {
    List<String> sanitized = phoneNumber.split("");
    int start = 0;
    int end = sanitized.first == "0" ? 1 : 2;
    sanitized.fillRange(start, end, "62");
    phoneNumber = sanitized.join("");
    return phoneNumber;
    // debugPrint(phoneNumber);
    // debugPrint("Sanitized"+sanitized.join("").toString());
  }

  Color warna1 = Colors.brown.shade200;
  Color warna2 = Colors.brown;

  Future<User>? futureUser;
  Future<User> getFutureUser() async {
    final data = await MySharedPreferences.fetchFromShared("_userLogged");
    return User.fromList(data!);
  }

  String username = "";
  @override
  initState() {
    super.initState();
    futureUser = getFutureUser();
    MySharedPreferences.fetchFromShared("_userLogged").then((value) {
      username = value![0];
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
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
                      fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              //User Profile Image
              Center(
                child: Stack(
                  children: [
                    gambar != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.black),
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      color: warna1.withOpacity(0.2)),
                                ],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: FileImage(gambar!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        : FutureBuilder(
                            future: futureUser,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return //     ? Padding(
                                    Padding(
                                        padding: const EdgeInsets.only(top: 30),
                                        child: userProfileImage(
                                            MySettings.getUrl(),
                                            "user/profile/${snapshot.data!.username}",
                                            <String, dynamic>{
                                              "fit": BoxFit.none,
                                              "width": 90.0,
                                              "height": 90.0,
                                              "scale":5.0
                                            }));
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Container(
                                    width: 90,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.black),
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 2,
                                            blurRadius: 10,
                                            color: warna1.withOpacity(0.2)),
                                      ],
                                      shape: BoxShape.circle,
                                      //   image: const DecorationImage(
                                      //     image:
                                      //         AssetImage('lib/src/images/3.jpeg'),
                                      //     fit: BoxFit.cover,
                                      //   ),
                                    ),
                                    child: const Icon(
                                      Icons.person,
                                      size: 30,
                                    ),
                                  ),
                                );
                              }
                            }),
                    // : (username.isNotEmpty)
                    //     ? Padding(
                    //         padding: const EdgeInsets.only(top: 30),
                    //         child: userProfileImage(MySettings.getUrl(),
                    //             "user/profil/$username", <String, dynamic>{
                    //           "fit": BoxFit.cover,
                    //           "width": 90.0,
                    //           "height": 90.0
                    //         }))
                    //     : Padding(
                    //         padding: const EdgeInsets.only(top: 30),
                    //         child: Container(
                    //           width: 90,
                    //           height: 90,
                    //           decoration: BoxDecoration(
                    //             border: Border.all(
                    //                 width: 1, color: Colors.black),
                    //             boxShadow: [
                    //               BoxShadow(
                    //                   spreadRadius: 2,
                    //                   blurRadius: 10,
                    //                   color: warna1.withOpacity(0.2)),
                    //             ],
                    //             shape: BoxShape.circle,
                    //             //   image: const DecorationImage(
                    //             //     image:
                    //             //         AssetImage('lib/src/images/3.jpeg'),
                    //             //     fit: BoxFit.cover,
                    //             //   ),
                    //           ),
                    //           child: const Icon(
                    //             Icons.person,
                    //             size: 30,
                    //           ),
                    //         ),
                    //       ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
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
              pilihan
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 5, right: 5, bottom: 10),
                      child: Column(
                        children: [
                          //User Profile data
                          FutureBuilder(
                              future: futureUser,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return userProfile(snapshot.data!);
                                } else {
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                              bottom: 30,
                                            ),
                                            child: Icon(
                                              Icons.person_outlined,
                                              size: 25,
                                            ),
                                          ),
                                          buildTextField1("Nama", selectedindex,
                                              "Gunakan nama yang di ketahui dengan\nbaik dan benar untuk memudahkan informasi"),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                              bottom: 30,
                                            ),
                                            child: Icon(
                                              Icons.info_outline,
                                              size: 25,
                                            ),
                                          ),
                                          buildTextField2("Info", selectedindex,
                                              "Informasi ini menunjukan status anda,\njika anda bukan anak kos, isilah sesuai status anda"),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                              bottom: 30,
                                            ),
                                            child: Icon(
                                              Icons.phone,
                                              size: 25,
                                            ),
                                          ),
                                          buildTextField3(
                                              "Telephon", selectedindex, ""),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                              bottom: 30,
                                            ),
                                            child: Icon(
                                              Icons.mail,
                                              size: 25,
                                            ),
                                          ),
                                          buildTextField4(
                                              "Email",
                                              selectedindex,
                                              "Gunakan Email Aktif"),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                              bottom: 30,
                                            ),
                                            child: Icon(
                                              Icons.password,
                                              size: 25,
                                            ),
                                          ),
                                          buildTextField5(
                                              "Password",
                                              selectedindex,
                                              "Gunakan Password yang muda di ingat"),
                                        ],
                                      ),
                                    ],
                                  );
                                }
                              }),

                          //User Profile Data end
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              //
                              //
                              setState(() {
                                pilihan = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: warna2,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child: const Text(
                              "Edit Profil",
                              style: TextStyle(
                                fontSize: 10,
                                letterSpacing: 2,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          fituredit1("Nama", "Masukkan Nama..."),
                          // fituredit2("Info", "Masukkan nomor kamar..."),
                          fituredit3("Telepon", "Masukkan nomor telepon..."),
                          fituredit4("Email", "Masukkan Alamat Email..."),
                          fituredit5("Password", "Masukkan Password Baru..."),
                          savecancel(),
                        ]),
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
    print("USERNAME: " + username);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 20),
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
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      kontak[index].masukkannama,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        informasi,
                        style: const TextStyle(
                            fontSize: 8, fontWeight: FontWeight.w400),
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
              child: const Icon(
                Icons.edit,
                size: 19,
                color: Colors.grey,
              ),
              onTap: () {
                setState(() {});
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
            padding: const EdgeInsets.only(left: 15, right: 20),
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
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      kontak[index].masukkankamar,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        informasi,
                        style: const TextStyle(
                            fontSize: 8, fontWeight: FontWeight.w400),
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
              child: const Icon(
                Icons.edit,
                size: 19,
                color: Colors.grey,
              ),
              onTap: () {
                setState(() {});
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
            padding: const EdgeInsets.only(left: 15, right: 20),
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
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      kontak[index].masukkantelp,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        informasi,
                        style: const TextStyle(
                            fontSize: 8, fontWeight: FontWeight.w400),
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
              child: const Icon(
                Icons.edit,
                size: 19,
                color: Colors.grey,
              ),
              onTap: () {
                setState(() {});
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
            padding: const EdgeInsets.only(left: 15, right: 20),
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
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      kontak[index].masukkanemail,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        informasi,
                        style: const TextStyle(
                            fontSize: 8, fontWeight: FontWeight.w400),
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
              child: const Icon(
                Icons.edit,
                size: 19,
                color: Colors.grey,
              ),
              onTap: () {
                setState(() {});
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
            padding: const EdgeInsets.only(left: 15, right: 20),
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
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      kontak[index].masukkanpassword,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        informasi,
                        style: const TextStyle(
                            fontSize: 8, fontWeight: FontWeight.w400),
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
              child: const Icon(
                Icons.edit,
                size: 19,
                color: Colors.grey,
              ),
              onTap: () {
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget fituredit1(String label, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
      child: TextField(
        controller: masukkannamaController,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp('[a-z A-Z]'))
        ],
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

  Widget fituredit2(String label, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
      child: TextField(
        controller: masukkankamarController,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp('[a-z A-Z 0-9]'))
        ],
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

  Widget fituredit3(String label, String placeholder) {
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

  Widget fituredit4(String label, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
      child: TextField(
        controller: masukkanemailController,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9@.]'))
        ],
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

  Widget fituredit5(String label, String placeholder) {
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

  Widget savecancel() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton(
            onPressed: () {
              setState(() {
                masukkannamaController.text = '';
                // masukkankamarController.text = '';
                masukkantelpController.text = '';
                masukkanemailController.text = '';
                masukkanpasswordController.text = '';
                pilihan = true;
              });
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            child: const Text(
              "CANCEL",
              style: TextStyle(
                  fontSize: 10, letterSpacing: 2, color: Colors.black),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              //
              String masukkannama = masukkannamaController.text.trim();
              // String masukkankamar = masukkankamarController.text.trim();
              String masukkantelp = masukkantelpController.text.trim();
              masukkantelp = sanitizedNumber(masukkantelp);
              String masukkanemail = masukkanemailController.text.trim();
              String masukkanpassword = masukkanpasswordController.text.trim();
              //

              if (masukkannama.isNotEmpty &&
                  masukkantelp.isNotEmpty &&
                  masukkanemail.isNotEmpty &&
                  masukkanpassword.isNotEmpty &&
                  imgPath!.isNotEmpty) {
                getUsernameNuploadProfile(
                    "_userLogged",
                    MySettings.getUrl() + ("user/profile/upload/"),
                    "profile-pict",
                    imgPath!, <String, dynamic>{
                  "username": masukkannama,
                  "phonenumber": masukkantelp,
                  "email": masukkanemail,
                  "password": masukkanpassword
                });
              } else if (imgPath!.isNotEmpty) {
                getUsernameNuploadProfile(
                    "_userLogged",
                    MySettings.getUrl() + ("user/profile/upload/"),
                    "profile-pict",
                    imgPath!, <String, dynamic>{});
              }
              setState(() {
                masukkannamaController.text = '';
                masukkantelpController.text = '';
                masukkanemailController.text = '';
                masukkanpasswordController.text = '';

                kontak[selectedindex].masukkannama = masukkannama;
                kontak[selectedindex].masukkantelp = masukkantelp;
                kontak[selectedindex].masukkanemail = masukkanemail;
                kontak[selectedindex].masukkanpassword = masukkanpassword;
                pilihan = true;
              });

              // //
              // if (masukkannama.isNotEmpty &&
              //     masukkankamar.isNotEmpty &&
              //     masukkantelp.isNotEmpty &&
              //     masukkanemail.isNotEmpty &&
              //     masukkanpassword.isNotEmpty) {
              //   if (kontak.isEmpty) {
              //     setState(() {
              //       masukkannamaController.text = '';
              //       masukkankamarController.text = '';
              //       masukkantelpController.text = '';
              //       masukkanemailController.text = '';
              //       masukkanpasswordController.text = '';
              //       kontak.add(Kontak(
              //           masukkankamar: masukkankamar,
              //           masukkannama: masukkannama,
              //           masukkantelp: masukkantelp,
              //           masukkanemail: masukkanemail,
              //           masukkanpassword: masukkanpassword));
              //       pilihan = true;
              //     });
              //   }
              //   });
              // }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: warna2,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: const Text(
              "SAVE",
              style: TextStyle(
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

  Widget userProfileImage(String url, String path, Map<String, dynamic> style) {
    return Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ClientRequest.getImageFromNetwork(url, path, style));
  }

  Widget userFieldText(String label, String information, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 20),
            child: Container(
              alignment: Alignment.centerLeft,
              width: 190,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      label,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      content,
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        information,
                        style: const TextStyle(
                            fontSize: 8, fontWeight: FontWeight.w400),
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
              child: const Icon(
                Icons.edit,
                size: 19,
                color: Colors.grey,
              ),
              onTap: () {
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget userProfile(User user) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                bottom: 30,
              ),
              child: Icon(
                Icons.person_outlined,
                size: 25,
              ),
            ),
            userFieldText("Nama", "Gunakan nama yang sesuai", user.username!),
          ],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const Padding(
        //       padding: EdgeInsets.only(
        //         bottom: 30,
        //       ),
        //       child: Icon(
        //         Icons.info_outline,
        //         size: 25,
        //       ),
        //     ),
        //     buildTextField2("Info", selectedindex,
        //         "Informasi ini menunjukan status anda,\njika anda bukan anak kos, isilah sesuai status anda"),
        //   ],
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                bottom: 30,
              ),
              child: Icon(
                Icons.phone,
                size: 25,
              ),
            ),
            userFieldText(
                "Nomor Telepon", "Nomor telepon Anda", user.phonenumber!),
            // buildTextField3("Telephon", selectedindex, ""),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                bottom: 30,
              ),
              child: Icon(
                Icons.mail,
                size: 25,
              ),
            ),
            userFieldText("Email", "Gunakan Email Aktif", user.email!),
            // buildTextField4("Email", selectedindex, "Gunakan Email Aktif"),
          ],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const Padding(
        //       padding: EdgeInsets.only(
        //         bottom: 30,
        //       ),
        //       child: Icon(
        //         Icons.password,
        //         size: 25,
        //       ),
        //     ),
        //     buildTextField5("Password", selectedindex,
        //         "Gunakan Password yang muda di ingat"),
        //   ],
        // ),
      ],
    );
  }
}

class Kontak {
  String masukkannama;
  String masukkankamar;
  String masukkantelp;
  String masukkanemail;
  String masukkanpassword;

  Kontak(
      {required this.masukkankamar,
      required this.masukkannama,
      required this.masukkantelp,
      required this.masukkanemail,
      required this.masukkanpassword});
}
