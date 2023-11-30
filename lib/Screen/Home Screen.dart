// import 'dart:convert';
// import 'dart:io';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../Controller/Tap Controller.dart';
// import '../Media_Qury/Media.dart';
// import '../Widget Controller/Controller.dart';
// import '../model_Class/clkass.dart';
//
// class Home_Screen extends StatefulWidget {
//   const Home_Screen({super.key});
//
//   @override
//   State<Home_Screen> createState() => _Home_ScreenState();
// }
//
// class _Home_ScreenState extends State<Home_Screen> {
//   var LIKE = false.obs;
//   var LIKE1 = false.obs;
//   var selectedIndex = 0.obs;
//
//   Future<bool> _onWillPop(BuildContext context) async {
//     bool? exitResult = await showDialog(
//       context: context,
//       builder: (context) => _buildExitDialog(context),
//     );
//     return exitResult ?? false;
//   }
//
//   Scaffold _buildExitDialog(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(50),
//           child: Container(
//             width: double.infinity,
//             height: ScreenSize.horizontalBlockSize! * 65,
//             decoration: ShapeDecoration(
//               color: Color(0xFF020525),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(13),
//               ),
//               shadows: [
//                 BoxShadow(
//                   color: Color(0xFF676EB8),
//                   blurRadius: 4,
//                   offset: Offset(0, 0),
//                   spreadRadius: 0,
//                 )
//               ],
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text(
//                   'EXIT ',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: ScreenSize.fSize_20(),
//                     fontFamily: 'MainFont',
//                     fontWeight: FontWeight.w500,
//                     height: 0,
//                   ),
//                 ),
//                 controllertext.getText(
//                     "Are you sure want to Exit?", FontWeight.w400, 3.5),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     GestureDetector(
//                       onTap: () => Navigator.of(context).pop(false),
//                       child:
//                           controllerBlueContainer.getText(30, 10, 2, 'No', 4),
//                     ),
//                     GestureDetector(
//                       onTap: () => SystemNavigator.pop(),
//                       child: Container(
//                         width: ScreenSize.horizontalBlockSize! * 30,
//                         height: ScreenSize.horizontalBlockSize! * 10,
//                         decoration: ShapeDecoration(
//                           color: Color(0xFF020525),
//                           shape: RoundedRectangleBorder(
//                             side: BorderSide(width: 1, color: Colors.white),
//                             borderRadius: BorderRadius.circular(
//                                 ScreenSize.horizontalBlockSize! * 2),
//                           ),
//                         ),
//                         child: Center(
//                           child:
//                               controllertext.getText('Yes', FontWeight.w500, 4),
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   var pagenumber = 1;
//   late MineCraft notes;
//
//   bool isloaded = false;
//
//   var data = [].obs;
//
//   @override
//   void initState() {
//     fetchUsers().then((value) {});
//     super.initState();
//     scrollController.addListener(() {
//       if (scrollController.position.pixels ==
//           scrollController.position.maxScrollExtent) {
//         fetchUsers();
//         isloaded = true;
//       }
//     });
//     createFolder('App');
//   }
//
//   Future<String> createFolder(String cow) async {
//     final folderName = cow;
//     final path = Directory(
//         "/storage/emulated/0/Android/data/com.example.mainfcraft/files/${folderName}");
//     print('TTTTTTTTT${folderName}');
//     var status = await Permission.storage.status;
//     if (!status.isGranted) {
//       await Permission.storage.request();
//     }
//     if ((await path.exists())) {
//       return path.path;
//     } else {
//       path.create();
//       return path.path;
//     }
//   }
//
//   Future fetchUsers() async {
//     int randomNumber = Random().nextInt(600) + 1;
//     print("number $pagenumber");
//     var url =
//         "http://owlsup.ru/posts?category=mods&page=${randomNumber}&lang=en&sort=downloads&order=desc&apiKey=37b51d194a7513e45b56f6524f2d51f2";
//     var response = await http.get(Uri.parse(url));
//
//     if (response.statusCode == 200) {
//       var notesjson = json.decode(response.body);
//       notes = (MineCraft.fromJson(notesjson));
//       data.value.addAll(notes.mods!);
//       setState(() {});
//     }
//     return notes;
//   }
//
//   ScrollController scrollController = ScrollController();
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () => _onWillPop(context),
//       child: Scaffold(
//         backgroundColor: Color(0xFF12202F),
//         appBar: AppBar(
//           backgroundColor: Color(0xFF12202F),
//           elevation: 0,
//           toolbarHeight: ScreenSize.horizontalBlockSize! * 23,
//           leading: Center(
//             child: Obx(
//               () => Image(
//                   image: AssetImage(selectedIndex.value == 0
//                       ? "asset/image/M.png"
//                       : "asset/image/icon/Arrow back ios.png"),
//                   width: selectedIndex.value == 0
//                       ? ScreenSize.horizontalBlockSize! * 10
//                       : ScreenSize.horizontalBlockSize! * 8),
//             ),
//           ),
//           title: Obx(() => Text(selectedIndex.value == 0
//               ? "MINECRAFT"
//               : selectedIndex.value == 1
//                   ? "Shop"
//                   : selectedIndex.value == 2
//                       ? "Favorite"
//                       : "Settings")),
//           titleTextStyle: TextStyle(
//               fontFamily: "MainFont",
//               fontSize: selectedIndex.value == 0
//                   ? ScreenSize.horizontalBlockSize! * 5
//                   : ScreenSize.horizontalBlockSize! * 4.2),
//           actions: [
//             Center(
//               child: Container(
//                 width: ScreenSize.horizontalBlockSize! * 21,
//                 height: ScreenSize.fSize_30(),
//                 decoration: ShapeDecoration(
//                   color: Color(0xFF020525),
//                   shape: RoundedRectangleBorder(
//                     side: BorderSide(
//                         width: 1,
//                         color: Color(selectedIndex.value == 1
//                             ? 0xff02E1FB
//                             : selectedIndex.value == 2
//                                 ? 0xff02E1FB
//                                 : selectedIndex.value == 2
//                                     ? 0xff02E1FB
//                                     : 0xFFFFB700)),
//                     borderRadius: BorderRadius.circular(18),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Image(
//                         image: AssetImage("asset/image/coin.png"),
//                         height: ScreenSize.horizontalBlockSize! * 4.8),
//                     Text(
//                       '200',
//                       style: GoogleFonts.montserrat(
//                           fontWeight: FontWeight.w500,
//                           fontSize: ScreenSize.horizontalBlockSize! * 3.5),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(width: ScreenSize.fSize_10()),
//           ],
//         ),
//         body: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Obx(
//             () => selectedIndex.value == 0
//                 ? Column(
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(color: Color(0xFF0D1129)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             height: ScreenSize.horizontalBlockSize! * 60,
//                             decoration: BoxDecoration(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(10))),
//                             child: ImageSlideshow(
//                               indicatorColor: Colors.white,
//                               autoPlayInterval: 0,
//                               indicatorRadius: 4,
//                               indicatorPadding: 8,
//                               indicatorBottomPadding: 20,
//                               isLoop: false,
//                               children: [
//                                 Image.asset(
//                                   'asset/image/mod_img.png',
//                                   // fit: BoxFit.cover,
//                                 ),
//                                 Image.asset(
//                                   'asset/image/add-on_img.png',
//                                   // fit: BoxFit.cover,
//                                 ),
//                                 Image.asset(
//                                   'asset/image/maps_img.png',
//                                   // fit: BoxFit.cover,
//                                 ),
//                                 Image.asset(
//                                   'asset/image/shaders_img.png',
//                                   // fit: BoxFit.cover,
//                                 ),
//                                 Image.asset(
//                                   'asset/image/skins_img.png',
//                                   // fit: BoxFit.cover,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       Obx(
//                         () => Padding(
//                           padding: const EdgeInsets.all(3),
//                           child: GridView.builder(
//                             physics: NeverScrollableScrollPhysics(),
//                             shrinkWrap: true,
//                             itemCount: PAGE.value.length,
//                             gridDelegate:
//                                 SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisCount: 3,
//                                     crossAxisSpacing: 4.0,
//                                     mainAxisSpacing: 4.0,
//                                     childAspectRatio: 0.8),
//                             itemBuilder: (BuildContext context, int index) {
//                               return GestureDetector(
//                                 onTap: () {
//                                   controller.showbuttonad(
//                                       context,
//                                       '/${PAGE.value[index]}',
//                                       '/Home_Screen',
//                                       '');
//                                 },
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Container(
//                                     child: Stack(
//                                       alignment: Alignment.bottomCenter,
//                                       children: [
//                                         Stack(
//                                           children: [
//                                             Image(
//                                                 image: AssetImage(
//                                                     '${IMAGE.value[index]}')),
//                                             Padding(
//                                                 padding: EdgeInsets.only(
//                                                     top: ScreenSize.fSize_70(),
//                                                     left:
//                                                         ScreenSize.fSize_10()),
//                                                 child: controllertext.getText(
//                                                     "${TEXT.value[index]}",
//                                                     FontWeight.w500,
//                                                     3.8)),
//                                             SizedBox(
//                                               height: ScreenSize.fSize_10(),
//                                             )
//                                           ],
//                                         ),
//                                         Padding(
//                                           padding: EdgeInsets.only(
//                                               bottom: ScreenSize.fSize_34()),
//                                           child: Container(
//                                             height: ScreenSize
//                                                     .horizontalBlockSize! *
//                                                 22,
//                                             width: ScreenSize
//                                                     .horizontalBlockSize! *
//                                                 22,
//                                             child: Image(
//                                                 image: AssetImage(
//                                                     "asset/image/Rectangle 16.png"),
//                                                 fit: BoxFit.cover),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: ScreenSize.fSize_20()),
//                       Container(
//                         decoration: BoxDecoration(color: Color(0xFF0D1129)),
//                         child: Column(
//                           children: [
//                             SizedBox(height: ScreenSize.fSize_10()),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Stack(
//                                 alignment: Alignment.center,
//                                 children: [
//                                   Image(
//                                       image: AssetImage(
//                                           "asset/image/get_coin_background.png")),
//                                   Image(
//                                       image:
//                                           AssetImage("asset/image/coins.png"),
//                                       height:
//                                           ScreenSize.horizontalBlockSize! * 25),
//                                   Padding(
//                                     padding: EdgeInsets.only(
//                                         top: ScreenSize.horizontalBlockSize! *
//                                             23),
//                                     child: controllerBlueContainer.getText(
//                                         28, 8, 100, "Get Coins", 4),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             ListView.builder(
//                               physics: NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount: data.value.length,
//                               itemBuilder: (context, index) {
//                                 final Dnum =
//                                     int.parse(data.value[index].downloads!);
//                                 final Vnum =
//                                     int.parse(data.value[index].views!);
//                                 final Lnum =
//                                     int.parse(data.value[index].likes!);
//                                 return Obx(
//                                   () => GestureDetector(
//                                     onTap: () {
//                                       createFolder("App");
//                                       controller.showbuttonad(context,
//                                           '/Transport_Addon', '/Home_Screen', [
//                                         data.value[index].id,
//                                         data.value[index].title,
//                                         Dnum,
//                                         Vnum,
//                                         Lnum,
//                                         data.value[index].screens!,
//                                         data.value[index].files![0].url,
//                                         pagenumber++,
//                                         data.value[index].description,
//                                         data.value[index].versions![0].code,
//                                         data.value[index].screens,
//                                       ]);
//                                     },
//                                     child: Padding(
//                                         padding: EdgeInsets.all(8.0),
//                                         child: controllerContainer.getText(
//                                             double.infinity,
//                                             ScreenSize.horizontalBlockSize! *
//                                                 66,
//                                             "http://owlsup.ru/main_catalog/mods/${data.value[index].id}/screens/s1.jpg",
//                                             200,
//                                             '${data.value[index].title}', () {
//                                           LIKE.value = !LIKE.value;
//                                         },
//                                             LIKE.value == true
//                                                 ? Icon(
//                                                     Icons.favorite_border,
//                                                     color: Colors.red,
//                                                     size: ScreenSize
//                                                             .horizontalBlockSize! *
//                                                         6.5,
//                                                   )
//                                                 : Icon(Icons.favorite,
//                                                     color: Colors.red),
//                                             '${NumberFormat.compact().format(Lnum)}',
//                                             '${NumberFormat.compact().format(Dnum)}',
//                                             () {})),
//                                   ),
//                                 );
//                               },
//                             )
//                             // Obx(
//                             //   () => Padding(
//                             //       padding: EdgeInsets.all(8.0),
//                             //       child: controllerContainer.getText(
//                             //           double.infinity,
//                             //           ScreenSize.horizontalBlockSize! * 66,
//                             //           "asset/image/Rectangle 17 (1).png",
//                             //           200,
//                             //           "Transport Add-on", () {
//                             //         LIKE1.value = !LIKE1.value;
//                             //       },
//                             //           LIKE1.value == true
//                             //               ? Icon(
//                             //                   Icons.favorite_border,
//                             //                   color: Colors.red,
//                             //                   size: ScreenSize
//                             //                           .horizontalBlockSize! *
//                             //                       6.5,
//                             //                 )
//                             //               : Icon(Icons.favorite,
//                             //                   color: Colors.red),
//                             //           798,
//                             //           '4.7k',
//                             //           () {})),
//                             // ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: ScreenSize.fSize_80(),
//                       )
//                     ],
//                   )
//                 : selectedIndex.value == 1
//                     ? Column(
//                         children: [
//                           // ElevatedButton(
//                           //     onPressed: () {
//                           //       showDialog(
//                           //           context: context,
//                           //           builder: (BuildContext context) {
//                           //             return Dialog(
//                           //               backgroundColor: Colors.transparent,
//                           //               shape: RoundedRectangleBorder(
//                           //                   borderRadius:
//                           //                       BorderRadius.circular(20.0)),
//                           //               //this right here
//                           //               child: Container(
//                           //                 height:
//                           //                     ScreenSize.horizontalBlockSize! *
//                           //                         90,
//                           //                 width: double.infinity,
//                           //                 child: Stack(
//                           //                   alignment: Alignment.topCenter,
//                           //                   children: [
//                           //                     Padding(
//                           //                       padding: EdgeInsets.only(
//                           //                           top: ScreenSize
//                           //                                   .horizontalBlockSize! *
//                           //                               6),
//                           //                       child: Stack(
//                           //                         children: [
//                           //                           Image(
//                           //                               image: AssetImage(
//                           //                                   "asset/image/vector1.png")),
//                           //                           Column(
//                           //                             mainAxisAlignment:
//                           //                                 MainAxisAlignment
//                           //                                     .center,
//                           //                             children: [
//                           //                               SizedBox(
//                           //                                   height: ScreenSize
//                           //                                           .horizontalBlockSize! *
//                           //                                       8),
//                           //                               Center(
//                           //                                 child: Text(
//                           //                                   'Successfully Received',
//                           //                                   style: GoogleFonts.montserrat(
//                           //                                       color: Colors
//                           //                                           .black,
//                           //                                       fontSize: ScreenSize
//                           //                                               .horizontalBlockSize! *
//                           //                                           4,
//                           //                                       fontWeight:
//                           //                                           FontWeight
//                           //                                               .w600),
//                           //                                 ),
//                           //                               ),
//                           //                               SizedBox(
//                           //                                   height: ScreenSize
//                           //                                           .horizontalBlockSize! *
//                           //                                       5),
//                           //                               Center(
//                           //                                 child: Text(
//                           //                                   '50 Coins ',
//                           //                                   style: GoogleFonts.montserrat(
//                           //                                       color: Color(
//                           //                                           0xffF4A001),
//                           //                                       fontSize: ScreenSize
//                           //                                               .horizontalBlockSize! *
//                           //                                           4,
//                           //                                       fontWeight:
//                           //                                           FontWeight
//                           //                                               .w600),
//                           //                                 ),
//                           //                               ),
//                           //                               SizedBox(
//                           //                                   height: ScreenSize
//                           //                                           .horizontalBlockSize! *
//                           //                                       5),
//                           //                               Center(
//                           //                                   child: Image(
//                           //                                 image: AssetImage(
//                           //                                     "asset/image/coins.png"),
//                           //                                 height: ScreenSize
//                           //                                         .horizontalBlockSize! *
//                           //                                     20,
//                           //                               )),
//                           //                               SizedBox(
//                           //                                   height: ScreenSize
//                           //                                           .horizontalBlockSize! *
//                           //                                       8),
//                           //                               GestureDetector(
//                           //                                 onTap: () {},
//                           //                                 child: Padding(
//                           //                                   padding: EdgeInsets.only(
//                           //                                       left: ScreenSize
//                           //                                               .horizontalBlockSize! *
//                           //                                           20,
//                           //                                       right: ScreenSize
//                           //                                               .horizontalBlockSize! *
//                           //                                           20),
//                           //                                   child: Center(
//                           //                                     child: Image(
//                           //                                       image: AssetImage(
//                           //                                           "asset/image/vector2.png"),
//                           //                                       width: ScreenSize
//                           //                                               .horizontalBlockSize! *
//                           //                                           45,
//                           //                                     ),
//                           //                                   ),
//                           //                                 ),
//                           //                               ),
//                           //                             ],
//                           //                           ),
//                           //                         ],
//                           //                       ),
//                           //                     ),
//                           //                     Image(
//                           //                       image: AssetImage(
//                           //                           "asset/image/vector.png"),
//                           //                       width: ScreenSize
//                           //                               .horizontalBlockSize! *
//                           //                           45,
//                           //                     ),
//                           //                   ],
//                           //                 ),
//                           //               ),
//                           //             );
//                           //           });
//                           //     },
//                           //     child: Text('data')),
//                           Obx(
//                             () => Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: GridView.builder(
//                                 itemCount: SHOPIMAGE.value.length,
//                                 physics: NeverScrollableScrollPhysics(),
//                                 shrinkWrap: true,
//                                 gridDelegate:
//                                     SliverGridDelegateWithFixedCrossAxisCount(
//                                         crossAxisCount: 2),
//                                 itemBuilder: (context, index) {
//                                   return Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Container(
//                                       decoration: ShapeDecoration(
//                                         color: Color(0xFF020525),
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(13),
//                                         ),
//                                       ),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         children: [
//                                           Image(
//                                             image: AssetImage(
//                                                 "${SHOPIMAGE.value[index]}"),
//                                             height: ScreenSize
//                                                     .horizontalBlockSize! *
//                                                 15,
//                                           ),
//                                           Container(
//                                             width: ScreenSize
//                                                     .horizontalBlockSize! *
//                                                 36,
//                                             child: Text(SHOPTEXT.value[index],
//                                                 textAlign: TextAlign.center,
//                                                 style: GoogleFonts.montserrat(
//                                                     color: Colors.white,
//                                                     fontSize:
//                                                         ScreenSize.horizontalBlockSize! *
//                                                                     index ==
//                                                                 0
//                                                             ? 10.8
//                                                             : index == 7
//                                                                 ? 10.8
//                                                                 : 14,
//                                                     fontWeight: index == 0
//                                                         ? FontWeight.w400
//                                                         : index == 7
//                                                             ? FontWeight.w400
//                                                             : FontWeight.w600)),
//                                           ),
//                                           GestureDetector(
//                                             onTap: () {},
//                                             child:
//                                                 controllerBlueContainer.getText(
//                                                     28,
//                                                     8.8,
//                                                     2,
//                                                     "₹6400.00",
//                                                     3.3),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             ),
//                           )
//                         ],
//                       )
//                     : selectedIndex.value == 2
//                         ? Center(
//                             child: Column(children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: ListView.separated(
//                                   physics: NeverScrollableScrollPhysics(),
//                                   shrinkWrap: true,
//                                   itemCount: 5,
//                                   itemBuilder: (context, index) {
//                                     return Column(
//                                       children: [
//                                         Row(
//                                           children: [
//                                             SizedBox(
//                                                 width: ScreenSize.fSize_10()),
//                                             controllertext.getText(
//                                                 "Transport Add-on",
//                                                 FontWeight.w500,
//                                                 4.5),
//                                           ],
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Container(
//                                             height: ScreenSize
//                                                     .horizontalBlockSize! *
//                                                 60,
//                                             decoration: ShapeDecoration(
//                                               image: DecorationImage(
//                                                 image: AssetImage(
//                                                     "asset/image/Rectangle 17.png"),
//                                                 fit: BoxFit.fill,
//                                               ),
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(19),
//                                               ),
//                                             ),
//                                             child: Padding(
//                                               padding: const EdgeInsets.all(12),
//                                               child: Column(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.end,
//                                                 children: [
//                                                   Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment.end,
//                                                     children: [
//                                                       Container(
//                                                         width: ScreenSize
//                                                                 .horizontalBlockSize! *
//                                                             11,
//                                                         height: ScreenSize
//                                                                 .horizontalBlockSize! *
//                                                             11,
//                                                         decoration:
//                                                             ShapeDecoration(
//                                                           image: DecorationImage(
//                                                               image: AssetImage(
//                                                                   "asset/image/icon/like.png"),
//                                                               scale: 2.5),
//                                                           color:
//                                                               Color(0x7702E1FB),
//                                                           shape: OvalBorder(),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     );
//                                   },
//                                   separatorBuilder:
//                                       (BuildContext context, int index) {
//                                     return (index + 1) % 1 == 0
//                                         ? Padding(
//                                             padding: const EdgeInsets.all(9),
//                                             child: Container(
//                                               height: ScreenSize
//                                                       .horizontalBlockSize! *
//                                                   0.3,
//                                               width: double.infinity,
//                                               color: Color(0xFF9293B5),
//                                             ),
//                                           )
//                                         : SizedBox();
//                                   },
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: ScreenSize.fSize_20(),
//                               )
//                             ]),
//                           )
//                         : Center(
//                             child: Column(children: [
//                               Container(
//                                 child: ListView.builder(
//                                   shrinkWrap: true,
//                                   physics: NeverScrollableScrollPhysics(),
//                                   itemCount: SETTINGIMAGE.value.length,
//                                   itemBuilder: (context, index) {
//                                     return GestureDetector(
//                                       onTap: () {
//                                         // shareURL
//                                         index == 0
//                                             ? shareURL()
//                                             : index == 1
//                                                 ? Share.share(
//                                                     "https://in.linkedin.com/company/infinitizi?trk=ppro_cprof")
//                                                 : controller.showbuttonad(
//                                                     context,
//                                                     '/${SETTINGPAGE.value[index]}',
//                                                     '/Home_Screen',
//                                                     '');
//                                       },
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Container(
//                                           decoration: ShapeDecoration(
//                                             color: Color(0xFF020525),
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(12),
//                                             ),
//                                           ),
//                                           child: Column(
//                                             children: [
//                                               SizedBox(
//                                                   height:
//                                                       ScreenSize.fSize_10()),
//                                               Row(
//                                                 children: [
//                                                   SizedBox(
//                                                       width: ScreenSize
//                                                           .fSize_25()),
//                                                   Center(
//                                                     child: Image(
//                                                         image: AssetImage(
//                                                             '${SETTINGIMAGE.value[index]}'),
//                                                         height: ScreenSize
//                                                                 .horizontalBlockSize! *
//                                                             9.5),
//                                                   ),
//                                                   SizedBox(
//                                                       width: ScreenSize
//                                                           .fSize_25()),
//                                                   Container(
//                                                       height: ScreenSize
//                                                               .horizontalBlockSize! *
//                                                           6,
//                                                       width: ScreenSize
//                                                               .horizontalBlockSize! *
//                                                           0.15,
//                                                       color: Color(0xFF9293B5)),
//                                                   SizedBox(
//                                                       width: ScreenSize
//                                                           .fSize_25()),
//                                                   controllertext.getText(
//                                                       "${SETTINGTEXT.value[index]}",
//                                                       FontWeight.w500,
//                                                       4)
//                                                 ],
//                                               ),
//                                               SizedBox(
//                                                   height:
//                                                       ScreenSize.fSize_10()),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               )
//                             ]),
//                           ),
//           ),
//         ),
//         bottomNavigationBar: createBottomNavigationBar(),
//       ),
//     );
//   }
//
//   var IMAGE = [
//     "asset/image/Rectangle 15.png",
//     "asset/image/Rectangle 15 (1).png",
//     "asset/image/Rectangle 15 (3).png",
//     "asset/image/Rectangle 15 (3).png",
//     "asset/image/Rectangle 15.png",
//     "asset/image/Rectangle 15 (1).png",
//   ].obs;
//   var TEXT = [
//     "Add-On",
//     "Textures",
//     "Mods",
//     "Maps",
//     "Skins",
//     "Shaders",
//   ].obs;
//   var PAGE = [
//     "Add_on",
//     "Add_on",
//     "Add_on",
//     "Add_on",
//     "Add_on",
//     "Add_on",
//   ].obs;
//   var SHOPIMAGE = [
//     "asset/image/icon/free_coin.png",
//     "asset/image/icon/100coins.png",
//     "asset/image/icon/500coins.png",
//     "asset/image/icon/2000coins.png",
//     "asset/image/icon/6000coins.png",
//     "asset/image/icon/20000coins.png",
//     "asset/image/icon/50000coins.png",
//     "asset/image/disablead.png",
//   ].obs;
//   var SHOPTEXT = [
//     """Watch video and gain 50 free coins!""",
//     """100 COINS""",
//     """500 COINS""",
//     """2000 COINS""",
//     """6000 COINS""",
//     """20000 COINS""",
//     """50000 COINS""",
//     """Disable ads in the app""",
//   ].obs;
//   var SETTINGIMAGE = [
//     "asset/image/icon/rate.png",
//     "asset/image/icon/share.png",
//     "asset/image/icon/privacy policy.png",
//     "asset/image/icon/help.png",
//     "asset/image/icon/downloaded.png",
//     "asset/image/icon/terms & Conditions.png",
//   ].obs;
//   var SETTINGTEXT = [
//     "Rate App",
//     "Share App",
//     "Privacy Policy",
//     "Help",
//     "Downloaded",
//     "Terms & Conditions",
//   ].obs;
//   var SETTINGPAGE = [
//     "",
//     "",
//     "In_App_Privacy",
//     "Help",
//     "In_App_Privacy",
//     "In_App_Privacy",
//   ].obs;
//
//   Widget createBottomNavigationBar() {
//     return Obx(
//       () => BottomNavigationBar(
//         currentIndex: selectedIndex.value,
//         onTap: (index) {
//           selectedIndex.value = index;
//         },
//         showUnselectedLabels: true,
//         backgroundColor: Color(0xff020525),
//         type: BottomNavigationBarType.fixed,
//         elevation: 0,
//         selectedItemColor: Color(0xFF02E1FB),
//         unselectedItemColor: Colors.white,
//         items: [
//           BottomNavigationBarItem(
//             icon: Padding(
//               padding: const EdgeInsets.all(4),
//               child: Image(
//                   image: AssetImage('asset/image/icon/home.png'),
//                   height: ScreenSize.horizontalBlockSize! * 8,
//                   color: selectedIndex.value == 0
//                       ? Color(0xFF02E1FB)
//                       : Colors.white),
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Padding(
//               padding: const EdgeInsets.all(4),
//               child: Image(
//                   image: AssetImage('asset/image/icon/shop.png'),
//                   height: ScreenSize.horizontalBlockSize! * 8,
//                   color: selectedIndex.value == 1
//                       ? Color(0xFF02E1FB)
//                       : Colors.white),
//             ),
//             label: 'Shop ',
//           ),
//           BottomNavigationBarItem(
//             icon: Padding(
//               padding: const EdgeInsets.all(4),
//               child: Image(
//                   image: AssetImage('asset/image/icon/favorite.png'),
//                   height: ScreenSize.horizontalBlockSize! * 8,
//                   color: selectedIndex.value == 2
//                       ? Color(0xFF02E1FB)
//                       : Colors.white),
//             ),
//             label: 'Favorite',
//           ),
//           BottomNavigationBarItem(
//             icon: Padding(
//               padding: const EdgeInsets.all(4),
//               child: Image(
//                   image: AssetImage('asset/image/icon/setings.png'),
//                   height: ScreenSize.horizontalBlockSize! * 8,
//                   color: selectedIndex.value == 3
//                       ? Color(0xFF02E1FB)
//                       : Colors.white),
//             ),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }
//
//   shareURL() async {
//     const url = 'https://in.linkedin.com/company/infinitizi?trk=ppro_cprof';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:masterofmaincraft/Controller/Google_Ads.dart';
import 'package:masterofmaincraft/Controller/My%20Controller.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Controller/Tap Controller.dart';
import '../DBFile/DbHelper.dart';
import '../DBFile/notes.dart';
import '../Media_Qury/Media.dart';
import '../Widget Controller/Controller.dart';
import '../model_Class/Seeds.dart';
import '../model_Class/Texture.dart';
import '../model_Class/clkass.dart';
import '../model_Class/maps.dart';
import '../model_Class/shaders.dart';
import '../model_Class/skin.dart';

var Selected = false.obs;

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  var LIKE = false.obs;
  var selectedIndex = 0.obs;

  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
    return exitResult ?? false;
  }

  Scaffold _buildExitDialog(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Container(
            width: double.infinity,
            height: ScreenSize.horizontalBlockSize! * 65,
            decoration: ShapeDecoration(
              color: Color(0xFF020525),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0xFF676EB8),
                  blurRadius: 4,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'EXIT ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenSize.fSize_20(),
                    fontFamily: 'MainFont',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                controllertext.getText(
                    "Are you sure want to Exit?", FontWeight.w400, 3.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(false),
                      child:
                          controllerBlueContainer.getText(30, 10, 2, 'No', 4),
                    ),
                    GestureDetector(
                      onTap: () => SystemNavigator.pop(),
                      child: Container(
                        width: ScreenSize.horizontalBlockSize! * 30,
                        height: ScreenSize.horizontalBlockSize! * 10,
                        decoration: ShapeDecoration(
                          color: Color(0xFF020525),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(
                                ScreenSize.horizontalBlockSize! * 2),
                          ),
                        ),
                        child: Center(
                          child:
                              controllertext.getText('Yes', FontWeight.w500, 4),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  var Counterr = 0.obs;
  var pagenumber = 1;
  late MineCraft notes;

  var isloaded = false.obs;

  var data = [].obs;
  var NOT2 = <SkinsData>[].obs;
  var randomNumber1 = 0.obs;
  var NOT3 = <MapsData>[].obs;
  var randomNumber2 = 0.obs;
  var NOT4 = <ShadersData>[].obs;
  var randomNumber3 = 0.obs;
  var NOT5 = <TextData>[].obs;
  var randomNumber4 = 0.obs;
  var NOT6 = <SeedsData>[].obs;
  var randomNumber6 = 0.obs;

  @override
  void initState() {
    fetchUsers2().then((value) {
      NOT2.value.addAll(value);
    });
    fetchUsers3().then((value) {
      NOT3.value.addAll(value);
    });
    fetchUsers4().then((value) {
      NOT4.value.addAll(value);
    });
    fetchUsers5().then((value) {
      NOT5.value.addAll(value);
    });
    fetchUsers6().then((value) {
      NOT6.value.addAll(value);
    });
    fetchUsers().then((value) {
      data.value.addAll(notes.mods!);
      setState(() {});
    });
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        fetchUsers();
        isloaded.value = true;
      }
    });
    createFolder('App');
  }

  Future<String> createFolder(String cow) async {
    final folderName = cow;
    final path = Directory(
        "/storage/emulated/0/Android/data/com.example.mainfcraft/files/${folderName}");
    print('TTTTTTTTT${folderName}');
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    if ((await path.exists())) {
      return path.path;
    } else {
      path.create();
      return path.path;
    }
  }

  Future fetchUsers() async {
    int randomNumber = Random().nextInt(600) + 1;
    print("number $pagenumber");
    var url =
        "http://owlsup.ru/posts?category=mods&page=${randomNumber}&lang=en&sort=downloads&order=desc&apiKey=37b51d194a7513e45b56f6524f2d51f2";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var notesjson = json.decode(response.body);
      notes = (MineCraft.fromJson(notesjson));
      data.value.addAll(notes.mods!);
    }
    return notes;
  }

  ScrollController scrollController = ScrollController();

  final DBhelper dbHelper = DBhelper();
  var imageUrl = ''.obs;

  Future fetchUsers2() async {
    randomNumber1.value = Random().nextInt(399) + 1;
    var url;
    url =
        "http://owlsup.ru/posts?category=skins&page=${randomNumber1.value}&lang=en&sort=downloads&order=desc&apiKey=37b51d194a7513e45b56f6524f2d51f2";
    var response2 = await http.get(Uri.parse(url));
    var notes2 = <SkinsData>[].obs;
    notes2.value.clear();
    if (response2.statusCode == 200) {
      var notesjson = json.decode(response2.body);
      notes2.value.add(SkinsData.fromJson(notesjson));
    }
    NOT2.value = notes2.value;
    return NOT2.value;
  }

  Future fetchUsers3() async {
    randomNumber2.value = Random().nextInt(196) + 1;
    var url;
    url =
        "http://owlsup.ru/posts?category=maps&page=${randomNumber2.value}&lang=en&sort=downloads&order=desc&apiKey=37b51d194a7513e45b56f6524f2d51f2";
    var response2 = await http.get(Uri.parse(url));
    var notes2 = <MapsData>[].obs;
    notes2.value.clear();
    if (response2.statusCode == 200) {
      var notesjson = json.decode(response2.body);
      notes2.value.add(MapsData.fromJson(notesjson));
    }
    print('RRRRRRRR${randomNumber2}');
    NOT3.value = notes2.value;
    return NOT3.value;
  }

  Future fetchUsers4() async {
    randomNumber3.value = Random().nextInt(27) + 1;
    var url;
    url =
        "http://owlsup.ru/posts?category=Shaders&page=${randomNumber3.value}&lang=en&sort=downloads&order=desc&apiKey=37b51d194a7513e45b56f6524f2d51f2";
    var response2 = await http.get(Uri.parse(url));
    var notes2 = <ShadersData>[].obs;
    notes2.value.clear();
    if (response2.statusCode == 200) {
      var notesjson = json.decode(response2.body);
      notes2.value.add(ShadersData.fromJson(notesjson));
    }
    NOT4.value = notes2.value;
    return NOT4.value;
  }

  Future fetchUsers5() async {
    randomNumber4.value = Random().nextInt(99) + 1;
    var url;
    url =
        "http://owlsup.ru/posts?category=texture-packs&page=${randomNumber4.value}&lang=en&sort=downloads&order=desc&apiKey=37b51d194a7513e45b56f6524f2d51f2";
    var response2 = await http.get(Uri.parse(url));
    var notes2 = <TextData>[].obs;
    notes2.value.clear();
    if (response2.statusCode == 200) {
      var notesjson = json.decode(response2.body);
      notes2.value.add(TextData.fromJson(notesjson));
    }
    NOT5.value = notes2.value;
    return NOT5.value;
  }

  Future fetchUsers6() async {
    randomNumber6.value = Random().nextInt(27) + 1;
    var url;
    url =
        "http://owlsup.ru/posts?category=seeds&page=${randomNumber6.value}&lang=en&sort=downloads&order=desc&apiKey=37b51d194a7513e45b56f6524f2d51f2";
    var response2 = await http.get(Uri.parse(url));
    var notes2 = <SeedsData>[].obs;
    notes2.value.clear();
    if (response2.statusCode == 200) {
      var notesjson = json.decode(response2.body);
      notes2.value.add(SeedsData.fromJson(notesjson));
    }
    NOT6.value = notes2.value;
    return NOT6.value;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        backgroundColor: Color(0xFF12202F),
        appBar: AppBar(
          backgroundColor: Color(0xFF12202F),
          elevation: 0,
          toolbarHeight: ScreenSize.horizontalBlockSize! * 23,
          leading: Center(
            child: Obx(
              () => Image(
                  image: AssetImage(selectedIndex.value == 0
                      ? "asset/image/M.png"
                      : "asset/image/icon/Arrow back ios.png"),
                  width: selectedIndex.value == 0
                      ? ScreenSize.horizontalBlockSize! * 10
                      : ScreenSize.horizontalBlockSize! * 8),
            ),
          ),
          title: Obx(() => Text(selectedIndex.value == 0
              ? "MINECRAFT"
              : selectedIndex.value == 1
                  ? "Shop"
                  : selectedIndex.value == 2
                      ? "Favorite"
                      : "Settings")),
          titleTextStyle: TextStyle(
              fontFamily: "MainFont",
              fontSize: selectedIndex.value == 0
                  ? ScreenSize.horizontalBlockSize! * 5
                  : ScreenSize.horizontalBlockSize! * 4.2),
          actions: [
            Center(
              child: Container(
                width: ScreenSize.horizontalBlockSize! * 21,
                height: ScreenSize.fSize_30(),
                decoration: ShapeDecoration(
                  color: Color(0xFF020525),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1,
                        color: Color(selectedIndex.value == 1
                            ? 0xff02E1FB
                            : selectedIndex.value == 2
                                ? 0xff02E1FB
                                : selectedIndex.value == 2
                                    ? 0xff02E1FB
                                    : 0xFFFFB700)),
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                        image: AssetImage("asset/image/coin.png"),
                        height: ScreenSize.horizontalBlockSize! * 4.8),
                    Text(
                      '200',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: ScreenSize.horizontalBlockSize! * 3.5),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: ScreenSize.fSize_10()),
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Obx(
            () => selectedIndex.value == 0
                ? Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Color(0xFF0D1129)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: ScreenSize.horizontalBlockSize! * 60,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: ImageSlideshow(
                              indicatorColor: Colors.white,
                              autoPlayInterval: 0,
                              indicatorRadius: 4,
                              indicatorPadding: 8,
                              indicatorBottomPadding: 20,
                              isLoop: false,
                              children: [
                                Image.asset(
                                  'asset/image/mod_img.png',
                                  // fit: BoxFit.cover,
                                ),
                                Image.asset(
                                  'asset/image/add-on_img.png',
                                  // fit: BoxFit.cover,
                                ),
                                Image.asset(
                                  'asset/image/maps_img.png',
                                  // fit: BoxFit.cover,
                                ),
                                Image.asset(
                                  'asset/image/shaders_img.png',
                                  // fit: BoxFit.cover,
                                ),
                                Image.asset(
                                  'asset/image/skins_img.png',
                                  // fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.all(3),
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: TEXT.value.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 4.0,
                                    mainAxisSpacing: 4.0,
                                    childAspectRatio: 0.8),
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    controller.showbuttonad(
                                        context, '/Add_on', '/Home_Screen', [
                                      index,
                                      NAME.value[index],
                                      NOT6.value[0].seeds,
                                      data.value,
                                      data.value,
                                      NOT3.value[0].maps,
                                      NOT4.value[0].shaders,
                                      NOT2.value[0].skins
                                    ]);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Stack(
                                            children: [
                                              Image(
                                                  image: AssetImage(
                                                      '${IMAGE.value[index]}')),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top:
                                                          ScreenSize.fSize_70(),
                                                      left: ScreenSize
                                                          .fSize_10()),
                                                  child: controllertext.getText(
                                                      "${TEXT.value[index]}",
                                                      FontWeight.w500,
                                                      3.8)),
                                              SizedBox(
                                                height: ScreenSize.fSize_10(),
                                              )
                                            ],
                                          ),
                                          index == 1
                                              ? Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: ScreenSize
                                                          .fSize_34()),
                                                  child: Container(
                                                    height: ScreenSize
                                                            .horizontalBlockSize! *
                                                        22,
                                                    width: ScreenSize
                                                            .horizontalBlockSize! *
                                                        22,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      child: Image(
                                                          image: AssetImage(
                                                              "asset/image/Rectangle 16 (2).png"),
                                                          fit: BoxFit.cover),
                                                    ),
                                                  ),
                                                )
                                              : index == 5
                                                  ? Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: ScreenSize
                                                              .fSize_34()),
                                                      child: Container(
                                                        height: ScreenSize
                                                                .horizontalBlockSize! *
                                                            22,
                                                        width: ScreenSize
                                                                .horizontalBlockSize! *
                                                            22,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          child: Image(
                                                              image: AssetImage(
                                                                  "asset/image/Rectangle 16 (1).png"),
                                                              fit:
                                                                  BoxFit.cover),
                                                        ),
                                                      ),
                                                    )
                                                  : Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: ScreenSize
                                                              .fSize_34()),
                                                      child: Container(
                                                        height: ScreenSize
                                                                .horizontalBlockSize! *
                                                            22,
                                                        width: ScreenSize
                                                                .horizontalBlockSize! *
                                                            22,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          child: Image(
                                                              image: NetworkImage(
                                                                  "${TEXTMAGE.value[index]}"),
                                                              fit:
                                                                  BoxFit.cover),
                                                        ),
                                                      ),
                                                    ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: ScreenSize.fSize_20()),
                      Container(
                        decoration: BoxDecoration(color: Color(0xFF0D1129)),
                        child: Column(
                          children: [
                            SizedBox(height: ScreenSize.fSize_10()),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image(
                                      image: AssetImage(
                                          "asset/image/get_coin_background.png")),
                                  Image(
                                      image:
                                          AssetImage("asset/image/coins.png"),
                                      height:
                                          ScreenSize.horizontalBlockSize! * 25),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: ScreenSize.horizontalBlockSize! *
                                            23),
                                    child: controllerBlueContainer.getText(
                                        28, 8, 100, "Get Coins", 4),
                                  )
                                ],
                              ),
                            ),
                            Obx(
                              () => ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: data.value.length,
                                itemBuilder: (context, index) {
                                  final Dnum =
                                      int.parse(data.value[index].downloads!);
                                  final Vnum =
                                      int.parse(data.value[index].views!);
                                  final Lnum =
                                      int.parse(data.value[index].likes!);
                                  return (index + 1) % 3 == 0
                                      ? native.getNT(context, '/Home_Screen',
                                          'listTileMedium')
                                      : Obx(
                                          () => GestureDetector(
                                            onTap: () {
                                              Selected.value = false;
                                              createFolder("App");
                                              controller.showbuttonad(
                                                  context,
                                                  '/Transport_Addon',
                                                  '/Home_Screen', [
                                                data.value[index].id,
                                                data.value[index].title,
                                                data.value[index],
                                                data.value[index],
                                                data.value[index],
                                                data.value[index].screens!,
                                                data.value[index].files![0].url,
                                                pagenumber++,
                                                data.value[index].description,
                                                data.value[index].versions![0]
                                                    .code,
                                                data.value[index].screens,
                                              ]);
                                            },
                                            child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: controllerContainer.getText(
                                                    double.infinity,
                                                    ScreenSize
                                                            .horizontalBlockSize! *
                                                        66,
                                                    "http://owlsup.ru/main_catalog/mods/${data.value[index].id}/screens/s1.jpg",
                                                    200,
                                                    '${data.value[index].title}',
                                                    () {
                                                  LIKE.value = !LIKE.value;
                                                },
                                                    LIKE.value == true
                                                        ? Icon(
                                                            Icons
                                                                .favorite_border,
                                                            color: Colors.red,
                                                            size: ScreenSize
                                                                    .horizontalBlockSize! *
                                                                6.5,
                                                          )
                                                        : Icon(Icons.favorite,
                                                            color: Colors.red),
                                                    '${NumberFormat.compact().format(Lnum)}',
                                                    '${NumberFormat.compact().format(Dnum)}',
                                                    () {})),
                                          ),
                                        );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenSize.fSize_80(),
                      )
                    ],
                  )
// =================================================================================================shop
//             ElevatedButton(
//                 onPressed: () {
//                   showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return Dialog(
//                           backgroundColor: Colors.transparent,
//                           shape: RoundedRectangleBorder(
//                               borderRadius:
//                               BorderRadius.circular(20.0)),
//                           //this right here
//                           child: Container(
//                             height:
//                             ScreenSize.horizontalBlockSize! *
//                                 90,
//                             width: double.infinity,
//                             child: Stack(
//                               alignment: Alignment.topCenter,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       top: ScreenSize
//                                           .horizontalBlockSize! *
//                                           6),
//                                   child: Stack(
//                                     children: [
//                                       Image(
//                                           image: AssetImage(
//                                               "asset/image/vector1.png")),
//                                       Column(
//                                         mainAxisAlignment:
//                                         MainAxisAlignment
//                                             .center,
//                                         children: [
//                                           SizedBox(
//                                               height: ScreenSize
//                                                   .horizontalBlockSize! *
//                                                   8),
//                                           Center(
//                                             child: Text(
//                                               'Successfully Received',
//                                               style: GoogleFonts
//                                                   .montserrat(
//                                                   color: Colors
//                                                       .black,
//                                                   fontSize:
//                                                   ScreenSize
//                                                       .horizontalBlockSize! *
//                                                       4,
//                                                   fontWeight:
//                                                   FontWeight
//                                                       .w600),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                               height: ScreenSize
//                                                   .horizontalBlockSize! *
//                                                   5),
//                                           Center(
//                                             child: Text(
//                                               '50 Coins ',
//                                               style: GoogleFonts.montserrat(
//                                                   color: Color(
//                                                       0xffF4A001),
//                                                   fontSize: ScreenSize
//                                                       .horizontalBlockSize! *
//                                                       4,
//                                                   fontWeight:
//                                                   FontWeight
//                                                       .w600),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                               height: ScreenSize
//                                                   .horizontalBlockSize! *
//                                                   5),
//                                           Center(
//                                               child: Image(
//                                                 image: AssetImage(
//                                                     "asset/image/coins.png"),
//                                                 height: ScreenSize
//                                                     .horizontalBlockSize! *
//                                                     20,
//                                               )),
//                                           SizedBox(
//                                               height: ScreenSize
//                                                   .horizontalBlockSize! *
//                                                   8),
//                                           GestureDetector(
//                                             onTap: () {},
//                                             child: Padding(
//                                               padding: EdgeInsets.only(
//                                                   left: ScreenSize
//                                                       .horizontalBlockSize! *
//                                                       20,
//                                                   right: ScreenSize
//                                                       .horizontalBlockSize! *
//                                                       20),
//                                               child: Center(
//                                                 child: Image(
//                                                   image: AssetImage(
//                                                       "asset/image/vector2.png"),
//                                                   width: ScreenSize
//                                                       .horizontalBlockSize! *
//                                                       45,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Image(
//                                   image: AssetImage(
//                                       "asset/image/vector.png"),
//                                   width: ScreenSize
//                                       .horizontalBlockSize! *
//                                       45,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       });
//                 },
//                 child: Text('data'))
                : selectedIndex.value == 1
                    ? Column(
                        children: [
                          Obx(
                            () => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.builder(
                                itemCount: SHOPIMAGE.value.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF020525),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(13),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                "${SHOPIMAGE.value[index]}"),
                                            height: ScreenSize
                                                    .horizontalBlockSize! *
                                                15,
                                          ),
                                          Container(
                                            width: ScreenSize
                                                    .horizontalBlockSize! *
                                                36,
                                            child: Text(SHOPTEXT.value[index],
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.montserrat(
                                                    color: Colors.white,
                                                    fontSize:
                                                        ScreenSize.horizontalBlockSize! *
                                                                    index ==
                                                                0
                                                            ? 10.8
                                                            : index == 7
                                                                ? 10.8
                                                                : 14,
                                                    fontWeight: index == 0
                                                        ? FontWeight.w400
                                                        : index == 7
                                                            ? FontWeight.w400
                                                            : FontWeight.w600)),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return SizedBox(
                                                      height: ScreenSize
                                                              .horizontalBlockSize! *
                                                          85,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets.only(
                                                                left: ScreenSize
                                                                        .horizontalBlockSize! *
                                                                    5,
                                                                top: ScreenSize
                                                                        .horizontalBlockSize! *
                                                                    2),
                                                            child: controllertextblack
                                                                .getText(
                                                                    "Google play",
                                                                    FontWeight
                                                                        .w600,
                                                                    3.2),
                                                          ),
                                                          SizedBox(
                                                              height: ScreenSize
                                                                  .fSize_4()),
                                                          Divider(
                                                            color: Color(
                                                                0xFF12202F),
                                                          ),
                                                          SizedBox(
                                                              height: ScreenSize
                                                                  .fSize_8()),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Center(
                                                                  child: Image(
                                                                image: AssetImage(
                                                                    "asset/image/logo.png"),
                                                                height: ScreenSize
                                                                        .horizontalBlockSize! *
                                                                    7,
                                                              )),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  controllertextblack.getText(
                                                                      "2000 coins",
                                                                      FontWeight
                                                                          .w600,
                                                                      3.5),
                                                                  SizedBox(
                                                                      height: ScreenSize
                                                                          .fSize_4()),
                                                                  controllertextblack.getText(
                                                                      "Addons for Minecraft PE",
                                                                      FontWeight
                                                                          .w500,
                                                                      3.5)
                                                                ],
                                                              ),
                                                              controllertextblack
                                                                  .getText(
                                                                      "₹144.99",
                                                                      FontWeight
                                                                          .w600,
                                                                      3.8)
                                                            ],
                                                          ),
                                                          SizedBox(
                                                              height: ScreenSize
                                                                  .fSize_8()),
                                                          Divider(
                                                            color: Color(
                                                                0xFF12202F),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              controllertextblack
                                                                  .getText(
                                                                      "Quantity",
                                                                      FontWeight
                                                                          .w500,
                                                                      3.5),
                                                              SizedBox(
                                                                  width: ScreenSize
                                                                          .horizontalBlockSize! *
                                                                      10),
                                                              Container(
                                                                height: ScreenSize
                                                                        .horizontalBlockSize! *
                                                                    7.8,
                                                                width: ScreenSize
                                                                        .horizontalBlockSize! *
                                                                    26,
                                                                child: Obx(
                                                                  () => Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceAround,
                                                                    children: [
                                                                      controllermainuysplus
                                                                          .getText(
                                                                              () {
                                                                        Counterr
                                                                            .value--;
                                                                        Counterr.value <=
                                                                                0
                                                                            ? 0
                                                                            : Counterr.value;
                                                                      }, "asset/image/56889.png"),
                                                                      Container(
                                                                          width: ScreenSize.horizontalBlockSize! *
                                                                              12,
                                                                          child:
                                                                              Center(
                                                                            child: controllertextblack.getText(
                                                                                "${Counterr.value}",
                                                                                FontWeight.w500,
                                                                                4),
                                                                          )),
                                                                      controllermainuysplus
                                                                          .getText(
                                                                              () {
                                                                        Counterr
                                                                            .value++;
                                                                      }, "asset/image/172525_plus_icon.png"),
                                                                    ],
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          Divider(
                                                            color: Color(
                                                                0xFF12202F),
                                                          ),
                                                          Container(
                                                            height: ScreenSize
                                                                    .horizontalBlockSize! *
                                                                10,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                controllertextblack
                                                                    .getText(
                                                                        "State Bank Of India: @oksbi",
                                                                        FontWeight
                                                                            .w500,
                                                                        3.7),
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                      left: ScreenSize
                                                                              .horizontalBlockSize! *
                                                                          20),
                                                                  child: Icon(Icons
                                                                      .navigate_next),
                                                                ),
                                                                Divider(
                                                                  color: Color(
                                                                      0xFF12202F),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            color: Color(
                                                                0xFF12202F),
                                                          ),
                                                          SizedBox(
                                                              height: ScreenSize
                                                                      .horizontalBlockSize! *
                                                                  2),
                                                          Center(
                                                            child: Container(
                                                              width: ScreenSize
                                                                      .horizontalBlockSize! *
                                                                  85,
                                                              child: Center(
                                                                child: Stack(
                                                                  children: [
                                                                    Text(
                                                                        """By tapping 'Buy', you accept the following Google Payments Terms of Service: Terms of Service - Buyer (india),Privacy Notice""",
                                                                        style: GoogleFonts.montserrat(
                                                                            color:
                                                                                Colors.black,
                                                                            fontWeight: FontWeight.w500,
                                                                            fontSize: ScreenSize.horizontalBlockSize! * 2.7)),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {},
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top: ScreenSize.horizontalBlockSize! *
                                                                                6.7,
                                                                            left:
                                                                                ScreenSize.horizontalBlockSize! * 10),
                                                                        child: Text(
                                                                            "More",
                                                                            style: GoogleFonts.montserrat(
                                                                                color: Colors.blue,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontSize: ScreenSize.horizontalBlockSize! * 2.9)),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              height: ScreenSize
                                                                      .horizontalBlockSize! *
                                                                  4),
                                                          Padding(
                                                            padding: EdgeInsets.only(
                                                                left: ScreenSize
                                                                        .horizontalBlockSize! *
                                                                    8,
                                                                right: ScreenSize
                                                                        .horizontalBlockSize! *
                                                                    8),
                                                            child: Container(
                                                              height: ScreenSize
                                                                      .horizontalBlockSize! *
                                                                  9,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .blue,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              100))),
                                                              child: Center(
                                                                  child: controllertext
                                                                      .getText(
                                                                          "Buy",
                                                                          FontWeight
                                                                              .w500,
                                                                          3)),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child:
                                                controllerBlueContainer.getText(
                                                    28,
                                                    8.8,
                                                    2,
                                                    "₹6400.00",
                                                    3.3),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      )
// =================================================================================================favrite
                    : selectedIndex.value == 2
                        ? Container(
                            height: ScreenSize.horizontalBlockSize! * 155,
                            child: FutureBuilder<List<NotesModel>>(
                              future: dbHelper.getNotesList(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text('Error: ${snapshot.error}'));
                                } else {
                                  List<NotesModel>? notesList = snapshot.data;
                                  return snapshot.data!.isEmpty
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: ScreenSize.fSize_50(),
                                                  right: ScreenSize.fSize_50()),
                                              child: Container(
                                                width: double.infinity,
                                                height: ScreenSize.fSize_60(),
                                                decoration: BoxDecoration(
                                                    color: Color(0xffAAAAAA),
                                                    // border: Border.all(
                                                    //     color: Colors.black,width: 4)
                                                    border: Border(
                                                        right: BorderSide(
                                                            width: 3,
                                                            color: Color(
                                                                0xff555555)),
                                                        bottom: BorderSide(
                                                            width: 3,
                                                            color: Color(
                                                                0xff555555)),
                                                        left: BorderSide(
                                                            width: 3,
                                                            color:
                                                                Colors.white),
                                                        top: BorderSide(
                                                            width: 3,
                                                            color:
                                                                Colors.white))),
                                                child: Center(
                                                    child: Text(
                                                  'No data',
                                                  style: GoogleFonts.prozaLibre(
                                                      fontSize:
                                                          ScreenSize.fSize_16(),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                )),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ListView.separated(
                                            physics: BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: notesList!.length,
                                            itemBuilder: (context, index) {
                                              NotesModel notesModel =
                                                  notesList[index];
                                              return GestureDetector(
                                                onTap: () {},
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                            width: ScreenSize
                                                                .fSize_10()),
                                                        Container(
                                                          width: ScreenSize
                                                                  .horizontalBlockSize! *
                                                              70,
                                                          child: Text(
                                                            notesModel.text
                                                                .toString(),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts.montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .white,
                                                                fontSize: ScreenSize
                                                                        .horizontalBlockSize! *
                                                                    4.2),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                        height: ScreenSize
                                                                .horizontalBlockSize! *
                                                            60,
                                                        decoration:
                                                            ShapeDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                                "${notesModel.image}"),
                                                            fit: BoxFit.fill,
                                                          ),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        19),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(12),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Container(
                                                                    width: ScreenSize
                                                                            .horizontalBlockSize! *
                                                                        11,
                                                                    height:
                                                                        ScreenSize.horizontalBlockSize! *
                                                                            11,
                                                                    decoration:
                                                                        ShapeDecoration(
                                                                      image: DecorationImage(
                                                                          image: AssetImage(
                                                                              "asset/image/icon/like.png"),
                                                                          scale:
                                                                              2.5),
                                                                      color: Color(
                                                                          0x7702E1FB),
                                                                      shape:
                                                                          OvalBorder(),
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return (index + 1) % 1 == 0
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              9),
                                                      child: Container(
                                                        height: ScreenSize
                                                                .horizontalBlockSize! *
                                                            0.3,
                                                        width: double.infinity,
                                                        color:
                                                            Color(0xFF9293B5),
                                                      ),
                                                    )
                                                  : SizedBox();
                                            },
                                          ),
                                        );
                                }
                              },
                            ),
                          )
// =================================================================================================fsetting
                        : Center(
                            child: Column(children: [
                              Container(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: SETTINGIMAGE.value.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        // shareURL
                                        index == 0
                                            ? shareURL()
                                            : index == 1
                                                ? Share.share(
                                                    "https://in.linkedin.com/company/infinitizi?trk=ppro_cprof")
                                                : controller.showbuttonad(
                                                    context,
                                                    '/${SETTINGPAGE.value[index]}',
                                                    '/Home_Screen',
                                                    '');
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: ShapeDecoration(
                                            color: Color(0xFF020525),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                  height:
                                                      ScreenSize.fSize_10()),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                      width: ScreenSize
                                                          .fSize_25()),
                                                  Center(
                                                    child: Image(
                                                        image: AssetImage(
                                                            '${SETTINGIMAGE.value[index]}'),
                                                        height: ScreenSize
                                                                .horizontalBlockSize! *
                                                            9.5),
                                                  ),
                                                  SizedBox(
                                                      width: ScreenSize
                                                          .fSize_25()),
                                                  Container(
                                                      height: ScreenSize
                                                              .horizontalBlockSize! *
                                                          6,
                                                      width: ScreenSize
                                                              .horizontalBlockSize! *
                                                          0.15,
                                                      color: Color(0xFF9293B5)),
                                                  SizedBox(
                                                      width: ScreenSize
                                                          .fSize_25()),
                                                  controllertext.getText(
                                                      "${SETTINGTEXT.value[index]}",
                                                      FontWeight.w500,
                                                      4)
                                                ],
                                              ),
                                              SizedBox(
                                                  height:
                                                      ScreenSize.fSize_10()),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ]),
                          ),
          ),
        ),
        bottomNavigationBar: createBottomNavigationBar(),
      ),
    );
  }

  var IMAGE = [
    "asset/image/Rectangle 15.png",
    "asset/image/Rectangle 15 (1).png",
    "asset/image/Rectangle 15 (3).png",
    "asset/image/Rectangle 15 (3).png",
    "asset/image/Rectangle 15.png",
    "asset/image/Rectangle 15 (1).png",
  ].obs;
  var TEXT = [
    "Seeds",
    "Textures",
    "Mods",
    "Maps",
    "Shaders",
    "Skins",
  ].obs;
  var TEXTMAGE = [
    "http://owlsup.ru/main_catalog/seeds/6210/screens/s1.jpg",
    "http://owlsup.ru/main_catalog/texture-packs/6210/screens/s1.jpg",
    "http://owlsup.ru/main_catalog/mods/971/screens/s1.jpg",
    "http://owlsup.ru/main_catalog/maps/1331/screens/s1.jpg",
    "http://owlsup.ru/main_catalog/shaders/1957/screens/s1.jpg",
    "http://owlsup.ru/main_catalog/skins/6210/screens/s1.jpg",
  ].obs;
  var NAME = [
    "seeds",
    "texture-packs",
    "mods",
    "maps",
    "skins",
    "shaders",
  ].obs;
  var SHOPIMAGE = [
    "asset/image/icon/free_coin.png",
    "asset/image/icon/100coins.png",
    "asset/image/icon/500coins.png",
    "asset/image/icon/2000coins.png",
    "asset/image/icon/6000coins.png",
    "asset/image/icon/20000coins.png",
    "asset/image/icon/50000coins.png",
    "asset/image/disablead.png",
  ].obs;
  var SHOPTEXT = [
    """Watch video and gain 50 free coins!""",
    """100 COINS""",
    """500 COINS""",
    """2000 COINS""",
    """6000 COINS""",
    """20000 COINS""",
    """50000 COINS""",
    """Disable ads in the app""",
  ].obs;
  var SETTINGIMAGE = [
    "asset/image/icon/rate.png",
    "asset/image/icon/share.png",
    "asset/image/icon/privacy policy.png",
    "asset/image/icon/help.png",
    "asset/image/icon/downloaded.png",
    "asset/image/icon/terms & Conditions.png",
  ].obs;
  var SETTINGTEXT = [
    "Rate App",
    "Share App",
    "Privacy Policy",
    "Help",
    "Downloaded",
    "Terms & Conditions",
  ].obs;
  var SETTINGPAGE = [
    "",
    "",
    "In_App_Privacy",
    "Help",
    "In_App_Privacy",
    "In_App_Privacy",
  ].obs;

  Widget createBottomNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: selectedIndex.value,
        onTap: (index) {
          selectedIndex.value = index;
        },
        showUnselectedLabels: true,
        backgroundColor: Color(0xff020525),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: Color(0xFF02E1FB),
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4),
              child: Image(
                  image: AssetImage('asset/image/icon/home.png'),
                  height: ScreenSize.horizontalBlockSize! * 8,
                  color: selectedIndex.value == 0
                      ? Color(0xFF02E1FB)
                      : Colors.white),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4),
              child: Image(
                  image: AssetImage('asset/image/icon/shop.png'),
                  height: ScreenSize.horizontalBlockSize! * 8,
                  color: selectedIndex.value == 1
                      ? Color(0xFF02E1FB)
                      : Colors.white),
            ),
            label: 'Shop ',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4),
              child: Image(
                  image: AssetImage('asset/image/icon/favorite.png'),
                  height: ScreenSize.horizontalBlockSize! * 8,
                  color: selectedIndex.value == 2
                      ? Color(0xFF02E1FB)
                      : Colors.white),
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4),
              child: Image(
                  image: AssetImage('asset/image/icon/setings.png'),
                  height: ScreenSize.horizontalBlockSize! * 8,
                  color: selectedIndex.value == 3
                      ? Color(0xFF02E1FB)
                      : Colors.white),
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  shareURL() async {
    const url = 'https://in.linkedin.com/company/infinitizi?trk=ppro_cprof';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
