// import 'package:cool_alert/cool_alert.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:komas_latihan/Admin/admin_mutasi_page.dart';


// // ignore: must_be_immutable
// class AdminVerifikasiPage extends StatefulWidget {
//   AdminVerifikasiPage({required this.perip, required this.nama, required this.nokamar, 
//   required this.harga,});

//   bool perip;
//   String nama;
//   String nokamar;
//   String harga;

//   @override
// State<AdminVerifikasiPage> createState() => _AdminVerifikasiPageState(harga: harga, nama: nama, nokamar: nokamar,
//  perip: perip,);
// }
// class _AdminVerifikasiPageState extends State<AdminVerifikasiPage> {
//         _AdminVerifikasiPageState({required this.perip, required this.nama, required this.nokamar, 
//           required this.harga,});



//   bool perip;
//   String nama;
//   String nokamar;
//   String harga;

//   String bulanini = DateFormat("dd-MM").format(DateTime.now());
//   String bulandepan = DateFormat("dd-MM-yyyy").format(DateTime.now().add(const Duration(days: 30)));

//   int selectedIndex = 0;

//   String ending = '...';
  
//   bool gambar = true;
  
//   String tanggal = DateFormat("dd-MM-yyyy").format(DateTime.now());

//   Color warna1 = Colors.brown.shade200;
//   Color warna2 = Colors.brown;

//   TextEditingController settanggalController= TextEditingController();

//   bool durasi = true;

//   @override

//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       extendBody: true,
//       appBar: AppBar(
//         toolbarHeight: 90,
//         backgroundColor: warna2,
//         automaticallyImplyLeading: false,
//         title: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 8),
//               child: Container(
//                 alignment: Alignment.center,
//                 child:
//                   durasi?
//                   const Text(
//                     "Verifikasi Transaksi",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 15
//                     ),
//                   ):
//                   const Text(
//                     "Edit Tanggal",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 15
//                     ),
//                   ),
//               ),
//             ),
//           ],
//         ),
//     ),
//       body: durasi? verifwidget(selectedIndex):null
//     );
//   }

//   Widget verifwidget(int index){
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 30),
//       child: ListView(
//         children: [
//           const SizedBox(
//             height: 15,
//           ),
          
//           Column(
//             children: [ 
//             Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Padding(
//                 padding: EdgeInsets.only(left: 5, top: 13),
//                 child: Text(
//                   'Profil',
//                   style: TextStyle(
//                     fontSize: 11, 
//                     fontWeight: FontWeight.w200
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 8
//               ),
//               Row(
//                 children: [
//                   Container(
//                     height: 35,
//                     width: 35,
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image: AssetImage('lib/src/images/3.jpeg'),
//                         fit: BoxFit.cover
//                         ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 18),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           nokamar,
//                           style: const TextStyle(
//                             fontSize: 10,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           nama,
//                           style: const TextStyle(
//                             fontSize: 10,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
                  
//                 ],
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               garispemabatas()
//             ],
//           ) ,
//             ],
//             ),
          
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 10,
//               ),
//               const Text(
//                 'Bukti Transaksi',
//                 style: TextStyle(
//                   fontSize: 10, 
//                   fontWeight: FontWeight.w200
//                 ),
//               ),
//               const SizedBox(
//                 height: 10
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Pembayaran',
//                     style: TextStyle(
//                       fontSize: 10,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     'Rp.${harga}',
//                     style: const TextStyle(
//                       fontSize: 10,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   gambar?
//                   Container(
//                     alignment: Alignment.center,
//                     height: 80,
//                     width: MediaQuery.of(context).size.width,
//                     decoration: const  BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage('lib/src/images/dashboardkos.jpeg'),
//                         fit: BoxFit.cover
//                         ),
//                     ),
//                   ):Container(
//                     alignment: Alignment.center,
//                     height: 400,
//                     width: MediaQuery.of(context).size.width,
//                     decoration: const  BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage('lib/src/images/dashboardkos.jpeg'),
//                         fit: BoxFit.fitWidth
//                         ),
//                     ),
//                   ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: GestureDetector(
//                   onTap: () {
//                         setState(() {
//                           if (gambar == true) {
//                             gambar = false;
//                           } else {
//                             gambar= true;
//                           }
//                         });
//                       },
//                       child: const Text(
//                       'Lihat Detail',
//                       style: TextStyle(
//                         fontSize: 10,
//                         decoration: TextDecoration.underline
//                       ),
//                       )
//                     ),
//               ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               garispemabatas(),
//               const SizedBox(
//                 height: 15,
//               ),
//               const Text(
//                 'Waktu Tinggal',
//                 style: TextStyle(
//                   fontSize: 10, 
//                   fontWeight: FontWeight.w200
//                 ),
//               ),
//               const SizedBox(
//                 height: 8
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                       '${bulanini} s/d ${bulandepan}',
//                     style: const TextStyle(
//                       fontSize: 10,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
                      
//                     },
//                     child: const Text(
//                     'Edit',
//                     style: TextStyle(
//                       fontSize: 10,
//                       color: Colors.red,
//                       fontWeight: FontWeight.bold,
//                       decoration: TextDecoration.underline, decorationColor: Colors.red
//                     ),
//                     )
//                   ),
//                 ],
//               ),
//             ],
//           ),
          
//           const SizedBox(
//             height: 50,
//           ),
          
//           perip?
//           const SizedBox(
//             height: 0,
//             width: 0,
//           ) :
//           savecancel(index),
          
//           perip?

//           Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: InkWell(
//                 onTap: (){
//                   setState(() {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => AdminMutasiPage(perip: false,),));
//                     perip = false;
//                   });
//                 },
//                 borderRadius: BorderRadius.circular(15),
//                 child:  
//                 Container(
//                   alignment: Alignment.center,
//                   height: 30,
//                   width: 90,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     color: Colors.red.shade400
//                   ),
//                   child: const Text(
//                     textAlign: TextAlign.center,
//                     'Batalkan',
//                     style: TextStyle(fontSize: 11, color: Colors.white),
//                   ),
//                 )
//               ),
//             ):SizedBox(
//               height: 0,
//               width: 0,
//             ),

//             const SizedBox(
//               height: 20,
//             ),

//           Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: InkWell(
//                 onTap: (){
//                   setState(() {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => AdminMutasiPage(perip: perip,),));
//                   });
//                 },
//                 borderRadius: BorderRadius.circular(15),
//                 child:  
//                 Container(
//                   alignment: Alignment.center,
//                   height: 30,
//                   width: 90,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     color: warna2
//                   ),
//                   child: const Text(
//                     textAlign: TextAlign.center,
//                     'Kembali',
//                     style: TextStyle(fontSize: 11, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
          
//           SizedBox(
//           height: 100,
//         )
        
//           ]
//         ),
//     );
//   }

//   Widget edittgll(int index){
//   return Padding(
//     padding: const EdgeInsets.only(left: 20, right: 20),
//     child: Center(
//           child: Container(
//             width: MediaQuery.of(context).size.width*0.8,
//             padding: const EdgeInsets.only(top: 90),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Set Tanggal',
//                   style: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 12
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 TextField(
//                     controller: settanggalController,
//                     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                         contentPadding: EdgeInsets.only(bottom: 5),
//                         hintFadeDuration: Duration(milliseconds: 300),
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                           hintStyle: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.grey,
//                           ),
//                     ),
//                   ),
//               ]
//             )
//           )
//     )
//   );
// }

//   Widget savecancel(int index){
//   return Padding(
//     padding: const EdgeInsets.only(left: 20, right: 20),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         OutlinedButton(
//           onPressed: (){
//             setState(() {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => AdminMutasiPage(perip: true,),));
              
//               CoolAlert.show(
//                 context: context,
//                 type: CoolAlertType.error,
//                 title: 'Ditolak',
//                 text: "\nTransaksi Berhasil Ditolak\n",
                
//               );
              
//             });
//           }, 
//           style: OutlinedButton.styleFrom(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//           ),
//           child: const Text(
//             "Tolak",
//             style: TextStyle(
//               fontSize: 10,
//               letterSpacing: 2,
//               color: Colors.black
//             ),
//           ),
//           ),
//         ElevatedButton(
//           onPressed: (){
//             setState(() {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => AdminMutasiPage(perip: true,),));
//               CoolAlert.show(
//                 context: context,
//                 type: CoolAlertType.success,
//                 title: 'Diverifikasi',
//                 text: "\nTransaksi Berhasil Terverifikasi\n",
//               );
//             });
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor: warna2,
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
//           ),
//             child: const Text(
//             "Terima", style: TextStyle(
//               fontSize: 10,
//               letterSpacing: 2, 
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

//   Widget garispemabatas(){
//     return Container(
//       alignment: Alignment.center,
//       child: const Text(
//         '_________________________________________',
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           fontSize: 10,
//           fontWeight: FontWeight.w700,
//         ),
//       ),
//     );
//   }
// }