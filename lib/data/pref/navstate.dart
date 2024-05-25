import 'package:flutter/material.dart';
import 'package:komas_latihan/data/pref/btm_nav.dart';
import 'package:google_fonts/google_fonts.dart';


class Navstate extends State<Btmnav> {
  int a = 0;

  void tap(int b) {
    setState(() {
      a = b;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
     bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.lightBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'History',
            backgroundColor: Colors.lightBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
            backgroundColor: Colors.lightBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
            backgroundColor: Colors.lightBlue,
          ),
        ],
        currentIndex: a,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        selectedItemColor: Colors.blue[800],
        onTap: tap,
      ),

      body: <Widget>[
        /// Home page
      Stack(
        children: [
          Container(
          height: 275.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/4.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                    const SizedBox(
                      width: 20,
                    ),
                    Text("hi. Kids!",style: GoogleFonts.inter(color: Colors.white)),
                      ],
                    ),
                    Container(
                          alignment: Alignment.topRight ,
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            image: const DecorationImage(image: AssetImage('lib/src/images/3.jpeg'),),
                            borderRadius: BorderRadius.circular(45),
                            border: Border.all(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 2
                          )
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                Container(
                  height: 100,
                  width: 400,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 76, 144, 1),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow:[ BoxShadow(
                  color: Colors.lightBlue.withOpacity(1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 2),
               ),
              ],
                  ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.values[5],
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(17),
                          child: Column(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)
                                ),
                                child: const Icon(Icons.payment),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Pembayaran",
                                style: GoogleFonts.montserrat(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(17),
                          child: Column(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)
                                ),
                                child:const Icon(Icons.chat),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Chat",
                                style: GoogleFonts.montserrat(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.all(17),
                          child: Column(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)
                                ),
                                child: const Icon(Icons.info),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                "Info",
                                style: GoogleFonts.montserrat(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                )
              ],
            ),
          ],
        ),

        /// Messages page
        ListView.builder(
          reverse: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hello',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            }
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Hi!',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
            );
          },
        ),

        /// Notifications page
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 1'),
                  subtitle: Text('This is a notification'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 2'),
                  subtitle: Text('This is a notification'),
                ),
              ),
            ],
          ),
        ),

                /// setting
        Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                'Home page',
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
        ),
      ][a],
    );
  }
}