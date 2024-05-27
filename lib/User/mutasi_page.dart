import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  const MutasiPage({super.key});


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
                 const Text(
                    "Mutasi",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),
                  )
              ),
            ),
          ],
        ),
    ),
      body:mutasiWidget()
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