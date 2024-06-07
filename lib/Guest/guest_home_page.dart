

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:komas_latihan/Guest/guest_dashboard_page.dart';
import 'package:komas_latihan/pages/login_page.dart';


class GuestHomePage extends StatefulWidget {
  const GuestHomePage({super.key});

  @override
  State<GuestHomePage> createState() => _GuestHomePageState();
}

class _GuestHomePageState extends State<GuestHomePage> {

  // final initialScreen = const DashboardPage(admin: true);

  // Bottom navBar
  Color warna1 = Colors.brown.shade200;
  Color warna2 = Colors.brown;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget guestscreen = GuestDashboardPage();
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: 
      PageStorage(
        bucket: bucket,
        child: guestscreen,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0,
        child: FloatingActionButton(
          onPressed: (){
            
              CoolAlert.show(
                context: context, 
                type: CoolAlertType.info,
                title: 'Yakin?',
                text: '\nApakah Anda yakin ingin keluar dari Guest mode?\n',
                confirmBtnText: 'login',
                closeOnConfirmBtnTap: bool.hasEnvironment('keluar'),
                onConfirmBtnTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(admin: true),));
                },
                cancelBtnText: 'tidak',
                showCancelBtn: true,
              );
          },
          backgroundColor: warna2,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          disabledElevation: 0,
          child: Container(
            width: 35,
            height: 35,
            child: Image.asset('lib/src/images/LOGO.png', 
            )
          ),
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
                        CoolAlert.show(
                          context: context, 
                          type: CoolAlertType.warning,
                          title: 'Belum Login',
                          text: '\nbuat akun terlebih dahulu untuk mengakses menu ini!\n',
                          );
                      });
                    },
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(25.0) ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.white, 
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
                        CoolAlert.show(
                          context: context, 
                          type: CoolAlertType.warning,
                          title: 'Belum Login',
                          text: '\nbuat akun terlebih dahulu untuk mengakses menu ini!\n'
                          );
                      });
                    },
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(25.0) ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.article,
                          color: Colors.white,
                          size: 20,
                        ),Text(
                          'History',
                          style: TextStyle(
                            color: Colors.white,
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
                        CoolAlert.show(
                          context: context, 
                          type: CoolAlertType.warning,
                          title: 'Belum Login',
                          text: '\nbuat akun terlebih dahulu untuk mengakses menu ini!\n'
                          );
                      });
                    },
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(25.0) ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text(
                          'Notifikasi',
                          style: TextStyle(
                            color: Colors.white, 
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
                        CoolAlert.show(
                          context: context, 
                          type: CoolAlertType.warning,
                          title: 'Belum Login',
                          text: '\nbuat akun terlebih dahulu untuk mengakses menu ini!\n'
                          );
                      });
                    },
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(25.0) ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 20,
                        ),
                        Text(
                          'Profil',
                          style: TextStyle(
                            color:Colors.white, 
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