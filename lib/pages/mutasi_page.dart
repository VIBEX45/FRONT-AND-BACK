import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cool_alert/cool_alert.dart';

class Mtsi {

  bool readiable = false;
  String nama;
  String nokamar;
  String harga;
  Color warna;
  int waktutinggal;
  
  String tanggl = DateFormat("dd-MM-yyyy").format(DateTime.now());
  String bulanini = DateFormat("dd-MM").format(DateTime.now());
  String bulandepan = DateFormat("dd-MM-yyyy").format(DateTime.now().add(const Duration(days: 30)));
  
  String jam = DateFormat("HH-mm").format(DateTime.now());
  
  Mtsi({ required this.nama, required this.nokamar, 
  required this.harga, required this.warna, required this.waktutinggal});
}


class MutasiPage extends StatefulWidget {
  const MutasiPage({super.key,required this.admin});

  final bool admin;

  @override
State<MutasiPage> createState() => _MutasiPageState();
}
class _MutasiPageState extends State<MutasiPage> {

  int selectedIndex = 0;

  String ending = '...';
  
  String tanggal = DateFormat("dd-MM-yyyy").format(DateTime.now());
  
  List<Mtsi> mutasi = ([
    Mtsi(
      nama : 'rafli',
      nokamar : 'Kamar No 5 Lt 1',
      harga: '500.000 - 30 hari',
      warna: Colors.orange,
      waktutinggal: 30,
    ),
    Mtsi(
      nama : 'afdal',
      nokamar : 'Kamar No 2 Lt 2',
      harga: '450.000 - 30 hari',
      warna: Colors.orange,
      waktutinggal: 49,
    ),
    Mtsi(
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
                
                widget.admin?
                 const Text(
                    "Mutasi",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),
                  ):
                  const Text(
                    "Verifikasi",
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
      body: widget.admin ? mutasiWidget(): verifWidget(),
    );
  }
  Widget mutasiWidget(){
    return ListView.separated(itemBuilder: (context, index){
      return Card(
      child: Container(
        margin: const EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
        child: Column(
          children: [ 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
            Text(
              tanggal.toString(),
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
            Text(
              mutasi[index].jam.toString(),
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
              ],
            ),
            const SizedBox(
              height: 7,
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
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Rp.${mutasi[index].harga}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                    Text(
                      mutasi[index].nokamar,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    mutasi[index].readiable?
                    const Text(
                      'Lunas',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.green,
                        fontWeight: FontWeight.bold
                      ),
                    ):
                    Text(
                      'Sedang Diverifikasi',
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
      ),
    );
    }, separatorBuilder: (context, index){
      return const Divider(height: 0,);
    }, itemCount: mutasi.length);
  }
  Widget verifWidget(){
    return ListView.separated(itemBuilder: (context, index){
      return InkWell(
      onTap: () {
          setState(() {  
            showDialog(
              context: context, 
              builder: (context) => AlertDialog(
                backgroundColor: Colors.white,
                contentPadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          Navigator.of(context).pop();
                          mutasi[index].readiable?
                          null:
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.success,
                            title: 'Berhasil',
                            text: "\nTransaksi Berhasil Terverifikasi\n",
                          );
                          mutasi[index].readiable = true;
                        });
                      },
                      borderRadius: BorderRadius.circular(15),
                      child:  
                      mutasi[index].readiable?
                      
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
                          'keluar',
                          style: TextStyle(fontSize: 11, color: Colors.white),
                        ),
                      ):
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.orange
                        ),
                        child: const Text(
                          textAlign: TextAlign.center,
                          'Verifikasi',
                          style: TextStyle(fontSize: 11, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
                icon: Column(
                  children: [ 
                const Text(
                  textAlign: TextAlign.center,
                  'Transaksi',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                  ),
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
                        )
                      ],
                    ),
                    garispemabatas()
                  ],
                ) ,
                  ],
                  ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bukti Transaksi',
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
                        ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: GestureDetector(
                        onTap: () {
                              
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
                ) ,
              )
              );
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
                ),
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
                    )
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

  Widget garispemabatas(){
    return const Text(
      '________________________________________',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w200,
      ),
    );
  }
}