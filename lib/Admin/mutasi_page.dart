import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdminMtsi {

  bool readiable = false;
  bool tolak = false;
  String nama;
  String nokamar;
  String harga;
  Color warna;
  int waktutinggal;
  
  String tanggl = DateFormat("dd-MM-yyyy").format(DateTime.now());
  String bulanini = DateFormat("dd-MM").format(DateTime.now());
  String bulandepan = DateFormat("dd-MM-yyyy").format(DateTime.now().add(const Duration(days: 30)));
  
  String jam = DateFormat("HH-mm").format(DateTime.now());
  
  AdminMtsi({ required this.nama, required this.nokamar, 
  required this.harga, required this.warna, required this.waktutinggal});
}


class AdminMutasiPage extends StatefulWidget {

  @override
State<AdminMutasiPage> createState() => _AdminMutasiPageState();
}
class _AdminMutasiPageState extends State<AdminMutasiPage> {

  int selectedIndex = 0;

  bool perip = true;

  String ending = '...';
  
  bool gambar = true;
  
  String tanggal = DateFormat("dd-MM-yyyy").format(DateTime.now());
  
  List<AdminMtsi> mutasi = ([
    AdminMtsi(
      nama : 'rafli',
      nokamar : 'Kamar No 5 Lt 1',
      harga: '500.000 - 30 hari',
      warna: Colors.orange,
      waktutinggal: 30,
    ),
    AdminMtsi(
      nama : 'afdal',
      nokamar : 'Kamar No 2 Lt 2',
      harga: '450.000 - 30 hari',
      warna: Colors.orange,
      waktutinggal: 49,
    ),
    AdminMtsi(
      nama : 'anan',
      nokamar : 'Kamar No 9 Lt 1',
      harga: '600.000 - 60 hari',
      warna: Colors.orange,
      waktutinggal: 60,
    ),
    
  ]);

  Color warna1 = Colors.brown.shade200;
  Color warna2 = Colors.brown;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
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
                child:
                perip?
                const Text(
                    "Verifikasi",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),
                  ):
                  const Text(
                    "Verifikasi Transaksi",
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
      body: perip? daftarWidget(): verifwidget(selectedIndex)
    );
  }
  
  Widget daftarWidget(){
    return ListView.separated(itemBuilder: (context, index){
      return InkWell(
      onTap: () {
        setState(() {
           selectedIndex = index;

           perip = false;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mutasi[index].nokamar,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(
              height: 4,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Text(
                  mutasi[index].nama,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),  mutasi[index].tolak?
                    Text(
                      'Verifikasi Ditolak',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.red,
                        fontWeight: FontWeight.bold
                      ),
                    ):
                    mutasi[index].readiable?
                    const Text(
                      'lunas',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.green,
                        fontWeight: FontWeight.bold
                      ),
                    ):
                    Text(
                      'Verifikasi',
                      style: TextStyle(
                        fontSize: 13,
                        color: mutasi[index].warna,
                        fontWeight: FontWeight.bold
                      ),
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
                      const Text(
                    'Masa Aktif',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    '${mutasi[index].waktutinggal} hari',
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
    );
    }, separatorBuilder: (context, index){
      return const Divider(height: 0,);
    }, itemCount: mutasi.length);
  }

  Widget verifwidget(int index){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ListView(
        children: [
          const SizedBox(
            height: 15,
          ),
          
          Column(
            children: [ 
            Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 5, top: 13),
                child: Text(
                  'Profil',
                  style: TextStyle(
                    fontSize: 11, 
                    fontWeight: FontWeight.w200
                  ),
                ),
              ),
              const SizedBox(
                height: 8
              ),
              Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('lib/src/images/3.jpeg'),
                        fit: BoxFit.cover
                        ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mutasi[index].nokamar,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          mutasi[index].nama,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              garispemabatas()
            ],
          ) ,
            ],
            ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Bukti Transaksi',
                style: TextStyle(
                  fontSize: 10, 
                  fontWeight: FontWeight.w200
                ),
              ),
              const SizedBox(
                height: 10
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pembayaran',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Rp.${mutasi[index].harga}',
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  gambar?
                  Container(
                    alignment: Alignment.center,
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    decoration: const  BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/src/images/dashboardkos.jpeg'),
                        fit: BoxFit.cover
                        ),
                    ),
                  ):Container(
                    alignment: Alignment.center,
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    decoration: const  BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/src/images/dashboardkos.jpeg'),
                        fit: BoxFit.fitWidth
                        ),
                    ),
                  ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: () {
                        setState(() {
                          if (gambar == true) {
                            gambar = false;
                          } else {
                            gambar= true;
                          }
                        });
                      },
                      child: const Text(
                      'Lihat Detail',
                      style: TextStyle(
                        fontSize: 10,
                        decoration: TextDecoration.underline
                      ),
                      )
                    ),
              ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              garispemabatas(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Waktu Tinggal',
                style: TextStyle(
                  fontSize: 10, 
                  fontWeight: FontWeight.w200
                ),
              ),
              const SizedBox(
                height: 8
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      '${mutasi[index].bulanini} s/d ${mutasi[index].bulandepan}',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
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
                                      });
                                      Navigator.of(context).pop();
                                      
                                    },
                                    child: Text('oke',  style: TextStyle(fontSize: 12, color: warna2),)
                                    ),
                                ),
                              ),
                            ],
                          )
                          );

                      });
                    },
                    child: const Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline, decorationColor: Colors.red
                    ),
                    )
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          mutasi[index].readiable || mutasi[index].tolak?
          const SizedBox(
            height: 0,
            width: 0,
          ) :
          savecancel(index),
          
          mutasi[index].readiable || mutasi[index].tolak?

          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: (){
                  setState(() {
                    perip = true;
                    mutasi[index].tolak = false;
                    mutasi[index].readiable = false;
                  });
                },
                borderRadius: BorderRadius.circular(15),
                child:  
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red.shade400
                  ),
                  child: const Text(
                    textAlign: TextAlign.center,
                    'Batalkan',
                    style: TextStyle(fontSize: 11, color: Colors.white),
                  ),
                )
              ),
            ):SizedBox(
              height: 0,
              width: 0,
            ),

            const SizedBox(
              height: 20,
            ),

          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: (){
                  setState(() {
                    perip = true;
                  });
                },
                borderRadius: BorderRadius.circular(15),
                child:  
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: warna2
                  ),
                  child: const Text(
                    textAlign: TextAlign.center,
                    'Kembali',
                    style: TextStyle(fontSize: 11, color: Colors.white),
                  ),
                ),
              ),
            ),
          
          SizedBox(
          height: 100,
        )
        
          ]
        ),
    );
  }

  Widget savecancel(int index){
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton(
          onPressed: (){
            setState(() {
              perip = true;
              mutasi[index].tolak?
              
              null:CoolAlert.show(
                context: context,
                type: CoolAlertType.error,
                title: 'Ditolak',
                text: "\nTransaksi Berhasil Ditolak\n",
                
              );
              
              mutasi[index].tolak = true;
              
            });
          }, 
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          child: const Text(
            "Tolak",
            style: TextStyle(
              fontSize: 10,
              letterSpacing: 2,
              color: Colors.black
            ),
          ),
          ),
        ElevatedButton(
          onPressed: (){
            setState(() {
              perip = true;
              mutasi[index].readiable?
              null:
              CoolAlert.show(
                context: context,
                type: CoolAlertType.success,
                title: 'Diverifikasi',
                text: "\nTransaksi Berhasil Terverifikasi\n",
              );
              mutasi[index].readiable = true;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: warna2,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
          ),
            child: const Text(
            "Terima", style: TextStyle(
              fontSize: 10,
              letterSpacing: 2, 
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}

  Widget garispemabatas(){
    return Container(
      alignment: Alignment.center,
      child: const Text(
        '_________________________________________',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}