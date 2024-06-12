import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  LatLng posisi = const LatLng(
    0.5621165058382015, 123.13713874842745
    );
    double box = 70;

  Color warna1 = Colors.brown.shade200;
  Color warna2 = Colors.brown;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: warna2,
        automaticallyImplyLeading: false,
        title: Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: warna1,
                shape: BoxShape.circle
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 18,
                ),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                    "Info",
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
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left:15, top: 20),
        child: Center(
          child: ListView(
            children: [ 
              const Text(
                  "KOST ALFIZA",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                textAlign: TextAlign.left,
                'kos alfiza adalah kos-kosan khusus untuk perempuan yang berkuliah ataupun sedang bekerja. bertempat di kabupaten bone bolango,kecamaatn tilongkabila desa bulituoiu. kos alfiza sangat nyaman dan juga tentunya sangat aman yang didukung dengan fasilitas yang baik seperti CCTV, Sofa, TV, westafel, dan parkiran yang luas tentunya sangat membantu.',
                style: TextStyle(
                  fontSize: 10.3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only( top: 5, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    kumpulanIkon(),
                    const SizedBox(
                      height: 5,
                    ),
                    kumpulanText(),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: 30,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20)
                  ),
                  color: Colors.lightBlue.withOpacity(0.2),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Detail Lokasi',
                    style: TextStyle( 
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14
                    ),
                  ),
                ),
              ),
              Container(
                height: 130,  
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlue.withOpacity(0.2)
                ),
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: posisi,
                    initialZoom: 16.2,
                
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          height: 170,
                          width: 170,
                          point: posisi,
                          child: const Icon(Icons.location_on, color: Colors.red, size: 140,),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: box,
                      width: box,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(image: AssetImage('lib/src/images/1.jpeg'), fit: BoxFit.cover),
                      ),
                    ),
                    // Container(
                    //   height: box,
                    //   width: box,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(10),
                    //     image: const DecorationImage(image: AssetImage('lib/src/images/3.jpeg'), fit: BoxFit.cover),
                    //   ),
                    // ),
                    Container(
                      height: box,
                      width: box,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(image: AssetImage('lib/src/images/2.jpeg'), fit: BoxFit.cover),
                      ),
                    )
                  ],
                ),
              ),
            const SizedBox(
              height: 100,
            )
            ]
          ),
        ),
      ),
    );
  }
}

Widget kumpulanIkon(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      iconUnggul(),
      iconUnggul(),
      iconUnggul(),
      iconUnggul()
    ],
  );
}

Widget kumpulanText(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      textunggul('Aman'),
      textunggul('Harga\nTerjangkau'),
      textunggul('Nyaman'),
      textunggul('Bersih'),
    ],
  );

}

Widget iconUnggul(){
  return Container(
    width: 70,
    alignment: Alignment.center,
    child: Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.3),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.black, width: 1)
      ),
      child: const Icon(
        Icons.check, color: Colors.black,size: 16,
      ),
    ),
  );
}

Widget textunggul(String point){
  return Container(
    width: 70,
    height: 40,
    alignment: Alignment.topCenter,
    child: Text(
      point,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),
    ),
  );
}


