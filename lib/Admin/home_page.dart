
import 'package:flutter/material.dart';
import 'package:komas_latihan/Admin/dashboard_page.dart';
import 'package:komas_latihan/Admin/mutasi_page.dart';
import 'package:komas_latihan/Admin/notifikasi_page.dart';
import 'package:komas_latihan/Admin/profil_page.dart';

// ignore: must_be_immutable
class AdminHomePage extends StatefulWidget {
  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {

  // final initialScreen = const DashboardPage(admin: true);

  // Bottom navBar
  int currentab = 0;
  final List<Widget> screens = [
    AdminDashboardPage(),
    AdminMutasiPage(),
    AdminNotifikasiPage(),
    const AdminProfilPage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget anotherscreen = AdminDashboardPage();

  Color warna1 = Colors.brown.shade200;
  Color warna2 = Colors.brown;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
      PageStorage(
        bucket: bucket,
        child: anotherscreen
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0,
        child: FloatingActionButton(
          onPressed: (){
          },
          backgroundColor: warna2,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          disabledElevation: 0,
          child: const Icon(Icons.air),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 4.0,
        shape: const CircularNotchedRectangle(),
        color:  warna2,
        height: 65,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            //tab kiri
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.36,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    minWidth: 0,
                    onPressed: (){
                      setState(() {
                        anotherscreen = AdminDashboardPage();
                        currentab = 0;
                      });
                    },
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(25.0) ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentab == 0 ? warna1 : Colors.white,
                          size: 20,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: currentab == 0 ? warna1 : Colors.white, 
                            fontSize: 6
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 0,
                    onPressed: (){
                      setState(() {
                        anotherscreen = AdminMutasiPage();
                        currentab = 1;
                      });
                    },
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(25.0) ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.article,
                          color: currentab == 1 ? warna1 : Colors.white,
                          size: 20,
                        ),Text(
                          'Verifikasi',
                          style: TextStyle(
                            color: currentab == 1 ? warna1 : Colors.white,
                            fontSize: 6
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            //tab kanan
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.38,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    minWidth: 0,
                    onPressed: (){
                      setState(() {
                        anotherscreen = AdminNotifikasiPage();
                        currentab = 2;
                      });
                    },
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(25.0) ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications,
                          color: currentab == 2 ? warna1 : Colors.white,
                          size: 20,
                        ),
                        Text(
                          'Notifikasi',
                          style: TextStyle(
                            color: currentab == 2 ? warna1: Colors.white, 
                            fontSize: 6
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 0,
                    onPressed: (){
                      setState(() {
                        anotherscreen = const AdminProfilPage();
                        currentab = 3;
                      });
                    },
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(25.0) ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentab == 3 ? warna1 : Colors.white,
                          size: 20,
                        ),
                        Text(
                          'Profil',
                          style: TextStyle(
                            color: currentab == 3 ? warna1: Colors.white, 
                            fontSize: 6
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

            ],
          ),
        ),
      ),
    );
  }
}