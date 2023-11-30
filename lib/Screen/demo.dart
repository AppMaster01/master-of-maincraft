// import 'dart:convert';
// import 'dart:io';
// import 'dart:math';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:dio/dio.dart';
// import 'package:external_path/external_path.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'package:masterofmaincraft/Controller/Google_Ads.dart';
// import 'package:masterofmaincraft/Media_Qury/Media.dart';
// import 'package:open_file/open_file.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// import '../DBFile/DbHelper.dart';
// import '../DBFile/notes.dart';
// import '../Widget Controller/Controller.dart';
// import '../model_Class/class2.dart';
// import '../model_Class/clkass.dart';
//
// class Transport_Addon extends StatefulWidget {
//   const Transport_Addon({super.key});
//
//   @override
//   State<Transport_Addon> createState() => _Transport_AddonState();
// }
//
// class _Transport_AddonState extends State<Transport_Addon> {
//   var LIKE = false.obs;
//   var isShow = true.obs;
//   var DATA = "".obs;
//   var CLICK = false.obs;
//
//   ScrollController scrollController = ScrollController();
//
//   var pagenumber = 2;
//   var LOAD = false.obs;
//   var LOAD2 = false.obs;
//   var Game2 = {}.obs;
//
//   final List<MineCraft> notes = <MineCraft>[];
//
//   Rx<Dio> dio2 = Dio().obs;
//
//   var downloading = false.obs;
//   var progressString = ''.obs;
//   var downloadedUrl = ''.obs;
//   var imageUrl = ''.obs;
//   var exits = false.obs;
//   var Value = 0.0.obs;
//   var Downlod = "Downlod".obs;
//   var downloded = "".obs;
//   var open = "".obs;
//
//   @override
//   void initState() {
//     imageUrl.value =
//         "http://owlsup.ru/main_catalog/mods/${abc[0]}/files/${abc[6]}";
//     fetchUsers2().then((value) {
//       NOT2.value.addAll(value);
//     });
//     super.initState();
//     Chek();
//     print('LLLLLLLLLL${"${imageUrl}"}');
//   }
//
//   var NOT2 = <Mincraft2>[].obs;
//
//   Future fetchUsers2() async {
//     int randomNumber2 = Random().nextInt(600) + 2;
//     var url;
//     url =
//         "http://owlsup.ru/posts?category=mods&page=${randomNumber2}&lang=en&sort=downloads&order=desc&apiKey=37b51d194a7513e45b56f6524f2d51f2";
//     var response2 = await http.get(Uri.parse(url));
//     var notes2 = <Mincraft2>[].obs;
//     notes2.value.clear();
//     if (response2.statusCode == 200) {
//       var notesjson = json.decode(response2.body);
//       notes2.value.add(Mincraft2.fromJson(notesjson));
//     }
//     print('RRRRRRRR${randomNumber2}');
//     NOT2.value = notes2.value;
//     print('RRRRRRRR${notes2.value[0].mods![0].title}');
//     return NOT2.value;
//   }
//
//   downlod([index]) {
//     imageUrl.value =
//         "http://owlsup.ru/main_catalog/mods/${NOT2[0].mods![index].id}/files/${NOT2[0].mods![index].files![0].url}";
//     print('LLLLLLLLLL${"${imageUrl}"}');
//   }
//
//   var abc = Get.arguments;
//
//   var _openResult = 'Unknown'.obs;
//
//   Future<bool> getStoragePremission() async {
//     return await Permission.manageExternalStorage.request().isGranted;
//   }
//
//   Future<String> getDownloadFolderPath() async {
//     return await ExternalPath.getExternalStoragePublicDirectory(
//         ExternalPath.DIRECTORY_DOWNLOADS);
//   }
//
//   Future downloadFile(String downloadDireactory) async {
//     var downloadedImagepath =
//         '/storage/emulated/0/Download/Download/${imageUrl.split("/").last}'.obs;
//     try {
//       await dio2.value.download(
//         imageUrl.value,
//         downloadedImagepath.value,
//         onReceiveProgress: (rec, total) {
//           print("Rec:$rec,Total:$total");
//           downloading.value = true;
//           progressString.value = "${((rec / total) * 100).toStringAsFixed(0)}%";
//           Value.value = (rec / total);
//         },
//       );
//     } catch (e) {
//       print(e);
//     }
//     await Future.delayed(const Duration(seconds: 3));
//     return downloadedImagepath.value;
//   }
//
//   Future<void> doDownload() async {
//     if (await getStoragePremission()) {
//       String downloadDirectory = await getDownloadFolderPath();
//       await downloadFile(downloadDirectory).then(
//         (Url) {
//           displayImage(Url);
//         },
//       );
//     }
//   }
//
//   void displayImage(String downloadDirectory) {
//     downloading.value = false;
//     progressString.value = "COMPLETED";
//     downloadedUrl.value = imageUrl.value;
//     exits.value = true;
//   }
//
//   Future<void> openFile() async {
//     var filePath =
//         '/storage/emulated/0/Download/Download/${imageUrl.split("/").last}';
//     final _result = await OpenFile.open(filePath, type: "*/*");
//     print(_result.message);
//
//     _openResult.value = "type=${_result.type}  message=${_result.message}";
//   }
//
//   Chek() async {
//     if (await File(
//             '/storage/emulated/0/Download/Download/${imageUrl.split("/").last}')
//         .exists()) {
//       exits.value = true;
//     } else {
//       exits.value = false;
//     }
//   }
//
//   var DONE = false.obs;
//   var TEXTLIST = [].obs;
//   DBhelper? dBhelper;
//   late Future<List<NotesModel>> noteslist;
//
//   loadData() async {
//     noteslist = dBhelper!.getNotesList();
//   }
//
//   final DBhelper dbHelper = DBhelper();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: controllerMainapp.getText(
//           10,
//           "asset/image/icon/Arrow back ios.png",
//           Obx(() =>
//               Text("${LOAD.value == true ? Game2.value['TITAL'] : abc[1]}")),
//           "200",
//           3.8),
//       backgroundColor: Color(0xFF0D1129),
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Container(
//                     width: double.infinity,
//                     height: ScreenSize.horizontalBlockSize! * 55,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                     child: Stack(
//                       children: [
//                         Obx(
//                           () => Container(
//                             height: double.infinity,
//                             width: double.infinity,
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(20),
//                               child: CachedNetworkImage(
//                                 imageUrl:
//                                     "http://owlsup.ru/main_catalog/mods/${CLICK.value == true ? DATA.value : abc[0]}/screens/s1.jpg",
//                                 fit: BoxFit.cover,
//                                 placeholder: (context, url) => SizedBox(
//                                     height: ScreenSize.fSize_50(),
//                                     width: ScreenSize.fSize_50(),
//                                     child: const Center(
//                                         child: CircularProgressIndicator(
//                                       color: Color(0xff78CFCA),
//                                     ))),
//                                 errorWidget: (context, url, error) =>
//                                     const Icon(Icons.error,
//                                         color: Color(0xFF9293B5)),
//                               ),
//                             ),
//                           ),
//                         ),
//                         // Column(
//                         //   mainAxisAlignment: MainAxisAlignment.end,
//                         //   children: [
//                         //     Row(
//                         //       mainAxisAlignment: MainAxisAlignment.end,
//                         //       children: [
//                         //         GestureDetector(
//                         //             onTap: () async {
//                         //               // if (TEXTLIST.value.contains(abc[1])) {
//                         //               //   dBhelper!.delet(abc[1]);
//                         //               // } else {
//                         //               //   dBhelper!
//                         //               //       .insert(NotesModel(
//                         //               //     image:
//                         //               //         "http://owlsup.ru/main_catalog/mods/${abc[0]}/screens/s1.jpg",
//                         //               //     text: abc[1],
//                         //               //   ))
//                         //               //       .then((value) {
//                         //               //     print("data added");
//                         //               //   }).onError((error, stackTrace) {
//                         //               //     print(
//                         //               //         '--------------------------${error.toString()}');
//                         //               //   });
//                         //               // }
//                         //               LIKE.value = !LIKE.value;
//                         //             },
//                         //             child: LIKE.value == true
//                         //                 ? Icon(Icons.favorite,
//                         //                     color: Colors.red)
//                         //                 : Icon(Icons.favorite_border,
//                         //                     color: Colors.black)),
//                         //       ],
//                         //     ),
//                         //   ],
//                         // ),
//                         FutureBuilder(
//                           future: dbHelper.getNotesList(),
//                           builder: (context, snapshot) {
//                             for (int i = 0; i < snapshot.data!.length; i++) {
//                               TEXTLIST.value.add(snapshot.data![i].text);
//                               print('=====================${TEXTLIST.value}');
//                             }
//                             return Obx(
//                               () => Padding(
//                                 padding: const EdgeInsets.all(15),
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     if (TEXTLIST.value.contains(abc[1])) {
//                                       dBhelper!.delet(abc[1]);
//                                     } else {
//                                       dBhelper!
//                                           .insert(NotesModel(
//                                         image:
//                                             "http://owlsup.ru/main_catalog/mods/${abc[0]}/screens/s1.jpg",
//                                         text: abc[1],
//                                       ))
//                                           .then((value) {
//                                         print("data added");
//                                       }).onError((error, stackTrace) {
//                                         print(
//                                             '--------------------------${error.toString()}');
//                                       });
//                                     }
//                                   },
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.end,
//                                         children: [
//                                           Center(
//                                             child: Container(
//                                               width: ScreenSize
//                                                       .horizontalBlockSize! *
//                                                   12,
//                                               height: ScreenSize
//                                                       .horizontalBlockSize! *
//                                                   12,
//                                               decoration: ShapeDecoration(
//                                                 image: DecorationImage(
//                                                     image: AssetImage(TEXTLIST
//                                                             .value
//                                                             .contains(abc[1])
//                                                         ? "asset/image/icon/like.png"
//                                                         : "asset/image/icon/like_1.png"),
//                                                     scale: 2.5),
//                                                 color: Color(0x7702E1FB),
//                                                 shape: OvalBorder(),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: ScreenSize.fSize_13()),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     controllerlikedownlod.getText(
//                         "asset/image/icon/file.png", 6.5, '${abc[9]}', 3.5),
//                     controllerlikedownlod.getText(
//                         "asset/image/icon/like.png", 6.5, '${abc[3]}', 3.5),
//                     controllerlikedownlod.getText(
//                         "asset/image/icon/download.png", 6.5, '${abc[4]}', 3.5),
//                   ],
//                 ),
//                 SizedBox(height: ScreenSize.fSize_20()),
//                 Padding(
//                   padding: EdgeInsets.only(left: ScreenSize.fSize_15()),
//                   child: Container(
//                     width: ScreenSize.fSize_70(),
//                     height: ScreenSize.fSize_34(),
//                     decoration: ShapeDecoration(
//                       color: Color(0xFF020525),
//                       shape: RoundedRectangleBorder(
//                         side: BorderSide(width: 1, color: Color(0xFF02E1FB)),
//                         borderRadius: BorderRadius.circular(17),
//                       ),
//                     ),
//                     child: Center(
//                       child:
//                           controllertext.getText('Tag', FontWeight.w500, 3.8),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: ScreenSize.fSize_15()),
//                 Row(
//                   children: [
//                     SizedBox(width: ScreenSize.horizontalBlockSize! * 3),
//                     controllerdata.getText(25, "Blocks"),
//                     SizedBox(width: ScreenSize.horizontalBlockSize! * 3),
//                     controllerdata.getText(27, "Zombies"),
//                     SizedBox(width: ScreenSize.horizontalBlockSize! * 3),
//                     controllerdata.getText(29, "Add-ons"),
//                   ],
//                 ),
//                 SizedBox(height: ScreenSize.fSize_15()),
//                 Padding(
//                   padding: EdgeInsets.only(left: ScreenSize.fSize_15()),
//                   child: controllertext.getText(
//                       """Lorem Ipsum is simply dummy text of the printing and typesetting industry.""",
//                       FontWeight.w500,
//                       3.5),
//                 ),
//                 SizedBox(height: ScreenSize.fSize_20()),
//                 Obx(
//                   () => DONE.value == false
//                       ? Stack(
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 showDialog(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       return Dialog(
//                                         backgroundColor: Colors.transparent,
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(20.0)),
//                                         //this right here
//                                         child: Container(
//                                           height:
//                                               ScreenSize.horizontalBlockSize! *
//                                                   45,
//                                           width:
//                                               ScreenSize.horizontalBlockSize! *
//                                                   80,
//                                           decoration: ShapeDecoration(
//                                             color: Color(0xFF020525),
//                                             shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(13),
//                                             ),
//                                             shadows: [
//                                               BoxShadow(
//                                                 color: Color(0xFF676EB8),
//                                                 blurRadius: 4,
//                                                 offset: Offset(0, 0),
//                                                 spreadRadius: 0,
//                                               )
//                                             ],
//                                           ),
//                                           child: Column(
//                                             children: [
//                                               SizedBox(
//                                                   height: ScreenSize
//                                                           .horizontalBlockSize! *
//                                                       5),
//                                               Row(
//                                                 children: [
//                                                   SizedBox(
//                                                       width: ScreenSize
//                                                           .fSize_20()),
//                                                   controllertext.getText("Oops",
//                                                       FontWeight.w500, 5.5)
//                                                 ],
//                                               ),
//                                               SizedBox(
//                                                   height: ScreenSize
//                                                           .horizontalBlockSize! *
//                                                       5),
//                                               Row(
//                                                 children: [
//                                                   SizedBox(
//                                                       width: ScreenSize
//                                                           .fSize_20()),
//                                                   controllertext.getText(
//                                                       "Not enough 200 Coins!",
//                                                       FontWeight.w400,
//                                                       4.5)
//                                                 ],
//                                               ),
//                                               SizedBox(
//                                                   height: ScreenSize
//                                                           .horizontalBlockSize! *
//                                                       9),
//                                               GestureDetector(
//                                                 onTap: () {
//                                                   DONE.value = true;
//                                                   Navigator.of(context)
//                                                       .pop(false);
//                                                 },
//                                                 child: controllerBlueContainer
//                                                     .getText(28, 8, 2,
//                                                         "Get Coins", 3.2),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                       );
//                                     });
//                               },
//                               child: Center(
//                                 child: controllerBlueContainer.getText(
//                                     93, 12.4, 2, "Unlock For 2000 Coins", 4),
//                               ),
//                             ),
//                           ],
//                         )
//                       : Center(
//                           child: Obx(
//                             () => Column(children: [
//                               exits.value == true
//                                   ? GestureDetector(
//                                       onTap: () => openFile(),
//                                       child: controllerBlueContainer.getText(
//                                           93, 12.4, 1.5, "Open", 4))
//                                   : downloading.value
//                                       ? Center(
//                                           child: Container(
//                                             height: ScreenSize
//                                                     .horizontalBlockSize! *
//                                                 12.4,
//                                             width: ScreenSize
//                                                     .horizontalBlockSize! *
//                                                 93,
//                                             child: LinearPercentIndicator(
//                                               lineHeight: ScreenSize
//                                                       .horizontalBlockSize! *
//                                                   12,
//                                               barRadius:
//                                                   const Radius.circular(3),
//                                               percent: Value.value,
//                                               center: Text(
//                                                   "${progressString.value}",
//                                                   style: GoogleFonts.archivo(
//                                                       color: Colors.white,
//                                                       fontWeight:
//                                                           FontWeight.w600)),
//                                               linearStrokeCap:
//                                                   LinearStrokeCap.roundAll,
//                                               progressColor:
//                                                   const Color(0xFF174AA7),
//                                             ),
//                                           ),
//                                         )
//                                       : downloadedUrl.value == ""
//                                           ? GestureDetector(
//                                               onTap: () {
//                                                 // exits.value = true;
//                                                 doDownload();
//                                               },
//                                               child: controllerBlueContainer
//                                                   .getText(93, 12.4, 1.5,
//                                                       "DOWNLOAD", 4))
//                                           : GestureDetector(
//                                               onTap: () => openFile(),
//                                               child: controllerBlueContainer
//                                                   .getText(
//                                                       93, 12.4, 1.5, "Open", 4))
//                             ]),
//                           ),
//                         ),
//                 ),
//                 SizedBox(height: ScreenSize.fSize_20()),
//                 Container(
//                   // height: ScreenSize.fSize_50(),
//                   decoration: ShapeDecoration(
//                     color: Color(0xFF020525),
//                     shape: RoundedRectangleBorder(
//                       side: BorderSide(
//                         width: 1,
//                         strokeAlign: BorderSide.strokeAlignOutside,
//                         color: Color(0xFF9293B5),
//                       ),
//                     ),
//                   ),
//                   child: Obx(
//                     () => Column(
//                       children: [
//                         SizedBox(height: ScreenSize.horizontalBlockSize! * 4.5),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             controllertext.getText(
//                                 "Transport Add-on - Description",
//                                 FontWeight.w500,
//                                 3.5),
//                             SizedBox(width: ScreenSize.fSize_10()),
//                             GestureDetector(
//                               onTap: () {
//                                 isShow.value = !isShow.value;
//                               },
//                               child: Container(
//                                 width: ScreenSize.horizontalBlockSize! * 28,
//                                 child: Center(
//                                   child: Text(
//                                     "Read ${isShow.value ? "More" : "Less"}",
//                                     style: GoogleFonts.montserrat(
//                                         color: Color(0xFF9293B5),
//                                         fontWeight: FontWeight.w600,
//                                         fontSize:
//                                             ScreenSize.horizontalBlockSize! *
//                                                 3.8),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                         Visibility(
//                           visible: isShow.value,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Container(
//                               width: double.infinity,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Divider(
//                                     thickness:
//                                         ScreenSize.horizontalBlockSize! * 0.12,
//                                     indent: ScreenSize.fSize_6(),
//                                     endIndent: ScreenSize.fSize_10(),
//                                     color: Color(0xFF9293B5),
//                                   ),
//                                   SizedBox(height: ScreenSize.fSize_6()),
//                                   Padding(
//                                     padding: EdgeInsets.only(
//                                         left: ScreenSize.fSize_4()),
//                                     child: Text(
//                                       'IMAGES',
//                                       style: GoogleFonts.montserrat(
//                                           color: Color(0xFF9293B5),
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: ScreenSize.fSize_13()),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                       height:
//                                           ScreenSize.horizontalBlockSize! * 2),
//                                   Container(
//                                     height:
//                                         ScreenSize.horizontalBlockSize! * 17,
//                                     width: double.infinity,
//                                     child: ListView.builder(
//                                       physics: BouncingScrollPhysics(),
//                                       shrinkWrap: true,
//                                       itemCount: abc[10].length,
//                                       scrollDirection: Axis.horizontal,
//                                       itemBuilder: (context, index) {
//                                         return Padding(
//                                           padding: const EdgeInsets.all(1),
//                                           child: Row(
//                                             children: [
//                                               Container(
//                                                 width: ScreenSize
//                                                         .horizontalBlockSize! *
//                                                     22,
//                                                 decoration: BoxDecoration(
//                                                     borderRadius:
//                                                         BorderRadius.all(
//                                                             Radius.circular(8)),
//                                                     image: DecorationImage(
//                                                         image: NetworkImage(
//                                                             "http://owlsup.ru/main_catalog/mods/${abc[0]}/screens//s$index.jpg"),
//                                                         fit: BoxFit.cover)),
//                                               ),
//                                               SizedBox(
//                                                   width: ScreenSize
//                                                           .horizontalBlockSize! *
//                                                       2),
//                                             ],
//                                           ),
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                   SizedBox(
//                                       height:
//                                           ScreenSize.horizontalBlockSize! * 2),
//                                   Padding(
//                                     padding: EdgeInsets.only(
//                                         left: ScreenSize.fSize_4()),
//                                     child: Text(
//                                       'DISCRIPTION :',
//                                       style: GoogleFonts.montserrat(
//                                           color: Color(0xFF9293B5),
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: ScreenSize.fSize_13()),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                       height:
//                                           ScreenSize.horizontalBlockSize! * 2),
//                                   Padding(
//                                     padding: EdgeInsets.only(
//                                         left: ScreenSize.fSize_4()),
//                                     child: Text(
//                                       """${abc[8]}""",
//                                       style: GoogleFonts.montserrat(
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.w400,
//                                           fontSize:
//                                               ScreenSize.horizontalBlockSize! *
//                                                   3),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: ScreenSize.horizontalBlockSize! * 4.5),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: ScreenSize.fSize_20()),
//                 Row(
//                   children: [
//                     SizedBox(width: ScreenSize.fSize_10()),
//                     controllertext.getText("Related", FontWeight.w500, 4.5)
//                   ],
//                 ),
//                 SizedBox(height: ScreenSize.fSize_6()),
//                 Obx(
//                   () => NOT2.value.isEmpty
//                       ? const Center(
//                           child: CircularProgressIndicator(
//                               color: Color(0xff78CFCA)))
//                       : Container(
//                           height: ScreenSize.horizontalBlockSize! * 55,
//                           width: double.infinity,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: ListView.builder(
//                               physics: BouncingScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount: NOT2.value[0].mods!.length,
//                               scrollDirection: Axis.horizontal,
//                               itemBuilder: (context, index) {
//                                 final Dnum = int.parse(
//                                     NOT2.value[0].mods![index].downloads!);
//                                 final Vnum = int.parse(
//                                     NOT2.value[0].mods![index].views!);
//                                 final Lnum = int.parse(
//                                     NOT2.value[0].mods![index].likes!);
//                                 return GestureDetector(
//                                   onTap: () {
//                                     CLICK.value = true;
//                                     DATA.value = NOT2.value[0].mods![index].id!;
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(5.5),
//                                     child: Container(
//                                       width:
//                                           ScreenSize.horizontalBlockSize! * 65,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(10)),
//                                       ),
//                                       child: Stack(
//                                         children: [
//                                           Container(
//                                             height: double.infinity,
//                                             width: double.infinity,
//                                             child: ClipRRect(
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(10)),
//                                               child: CachedNetworkImage(
//                                                 imageUrl:
//                                                     "http://owlsup.ru/main_catalog/mods/${NOT2.value[0].mods![index].id}/screens/s1.jpg",
//                                                 fit: BoxFit.cover,
//                                                 placeholder: (context, url) =>
//                                                     Container(
//                                                   height: ScreenSize
//                                                           .horizontalBlockSize! *
//                                                       45,
//                                                   child: Center(
//                                                     child: SizedBox(
//                                                         height: ScreenSize
//                                                             .fSize_30(),
//                                                         width: ScreenSize
//                                                             .fSize_30(),
//                                                         child: Center(
//                                                             child:
//                                                                 CircularProgressIndicator(
//                                                           color: const Color(
//                                                               0xff78CFCA),
//                                                           strokeWidth: ScreenSize
//                                                                   .horizontalBlockSize! *
//                                                               0.8,
//                                                         ))),
//                                                   ),
//                                                 ),
//                                                 errorWidget: (context, url,
//                                                         error) =>
//                                                     Container(
//                                                         height: ScreenSize
//                                                                 .horizontalBlockSize! *
//                                                             45,
//                                                         child: const Center(
//                                                             child: Icon(
//                                                                 Icons.error))),
//                                               ),
//                                             ),
//                                           ),
//                                           Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment.end,
//                                                 children: [
//                                                   Padding(
//                                                     padding: EdgeInsets.only(
//                                                         top: ScreenSize
//                                                             .fSize_6()),
//                                                     child: Container(
//                                                       width: ScreenSize
//                                                               .horizontalBlockSize! *
//                                                           19,
//                                                       height:
//                                                           ScreenSize.fSize_28(),
//                                                       decoration:
//                                                           ShapeDecoration(
//                                                               color: Color(
//                                                                       0xFF020525)
//                                                                   .withOpacity(
//                                                                       0.4),
//                                                               shape:
//                                                                   RoundedRectangleBorder(
//                                                                 side: BorderSide(
//                                                                     width: 1,
//                                                                     color: Color(
//                                                                         0xFFFFB700)),
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             18),
//                                                               )),
//                                                       child: Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceEvenly,
//                                                         children: [
//                                                           Image(
//                                                               image: AssetImage(
//                                                                   "asset/image/coin.png"),
//                                                               height: ScreenSize
//                                                                       .horizontalBlockSize! *
//                                                                   4),
//                                                           Text(
//                                                             '2000',
//                                                             style: GoogleFonts.montserrat(
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w500,
//                                                                 color: Colors
//                                                                     .white,
//                                                                 fontSize: ScreenSize
//                                                                         .horizontalBlockSize! *
//                                                                     3.2),
//                                                           )
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   SizedBox(
//                                                     width:
//                                                         ScreenSize.fSize_10(),
//                                                   )
//                                                 ],
//                                               ),
//                                               Container(
//                                                 height: ScreenSize
//                                                         .horizontalBlockSize! *
//                                                     18,
//                                                 width: double.infinity,
//                                                 decoration: BoxDecoration(
//                                                     color: Color(0xff000000)
//                                                         .withOpacity(0.6),
//                                                     borderRadius:
//                                                         BorderRadius.only(
//                                                             bottomRight: Radius
//                                                                 .circular(10),
//                                                             bottomLeft:
//                                                                 Radius.circular(
//                                                                     10))),
//                                                 child: Stack(
//                                                   children: [
//                                                     Row(
//                                                       children: [
//                                                         SizedBox(
//                                                             width: ScreenSize
//                                                                 .fSize_10()),
//                                                         Column(
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .start,
//                                                           children: [
//                                                             SizedBox(
//                                                                 height: ScreenSize
//                                                                     .fSize_10()),
//                                                             Container(
//                                                               width: ScreenSize
//                                                                       .horizontalBlockSize! *
//                                                                   60,
//                                                               child: Text(
//                                                                   '${NOT2.value[0].mods![index].title}',
//                                                                   overflow:
//                                                                       TextOverflow
//                                                                           .ellipsis,
//                                                                   style: GoogleFonts
//                                                                       .montserrat(
//                                                                     color: Colors
//                                                                         .white,
//                                                                     fontSize:
//                                                                         ScreenSize.horizontalBlockSize! *
//                                                                             3.5,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w500,
//                                                                   )),
//                                                             ),
//                                                             SizedBox(
//                                                                 height: ScreenSize
//                                                                     .fSize_10()),
//                                                             Row(
//                                                               children: [
//                                                                 controllerlikedownlod
//                                                                     .getText(
//                                                                         "asset/image/icon/like.png",
//                                                                         5.5,
//                                                                         '${NumberFormat.compact().format(Vnum)}',
//                                                                         3.5),
//                                                                 SizedBox(
//                                                                     width: ScreenSize
//                                                                         .fSize_12()),
//                                                                 controllerlikedownlod
//                                                                     .getText(
//                                                                         "asset/image/icon/download.png",
//                                                                         5.5,
//                                                                         '${NumberFormat.compact().format(Dnum)}',
//                                                                         3.5),
//                                                               ],
//                                                             )
//                                                           ],
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                 ),
//                 SizedBox(
//                   height: ScreenSize.fSize_80(),
//                 )
//               ],
//             ),
//           ),
//           banner.getBN('/Transport_Addon')
//         ],
//       ),
//     );
//   }
//
//   Widget buildUsers() {
//     return Obx(
//       () => Padding(
//         padding: const EdgeInsets.all(12),
//         child: NOT2.value.isEmpty
//             ? const Center(
//                 child: CircularProgressIndicator(color: Color(0xff78CFCA)))
//             : GridView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                     maxCrossAxisExtent: 200,
//                     childAspectRatio: 0.8,
//                     crossAxisSpacing: 15,
//                     mainAxisSpacing: 15),
//                 itemCount: NOT2.value[0].mods!.length,
//                 itemBuilder: (BuildContext ctx, index) {
//                   final Dnum = int.parse(NOT2.value[0].mods![index].downloads!);
//                   final Vnum = int.parse(NOT2.value[0].mods![index].views!);
//                   final Lnum = int.parse(NOT2.value[0].mods![index].likes!);
//                   return GestureDetector(
//                     onTap: () {
//                       exits.value == false;
//                       LOAD.value = true;
//                       fetchUsers2();
//                       downlod(index);
//                       Chek();
//                       Game2.value = {
//                         "IMAGE":
//                             "http://owlsup.ru/main_catalog/mods/${NOT2.value[0].mods![index].id}/screens/s1.jpg",
//                         "DOWNLOD": NumberFormat.compact().format(Dnum),
//                         "LIKE": NumberFormat.compact().format(Vnum),
//                         "VIEW": NumberFormat.compact().format(Lnum),
//                         "DISCRIP": NOT2.value[0].mods![index].description,
//                         "DOWNLODFILE": NOT2.value[0].mods![index].files![0].url,
//                         "TITAL": NOT2.value[0].mods![index].title,
//                         "ID": NOT2.value[0].mods![index].id,
//                         "VEROSN": NOT2.value[0].mods![index].versions![0].code
//                       };
//                       final position =
//                           scrollController.position.minScrollExtent;
//                       scrollController.animateTo(position,
//                           duration: const Duration(milliseconds: 300),
//                           curve: Curves.linear);
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: const Color(0xffF9FCFB),
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(color: const Color(0xff78CFCA))),
//                       child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               height: ScreenSize.horizontalBlockSize! * 40,
//                               child: Stack(
//                                 children: [
//                                   Container(
//                                     height:
//                                         ScreenSize.horizontalBlockSize! * 45,
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(3),
//                                       child: Container(
//                                         height:
//                                             ScreenSize.horizontalBlockSize! *
//                                                 45,
//                                         width: ScreenSize.horizontalBlockSize! *
//                                             40,
//                                         child: ClipRRect(
//                                           borderRadius: const BorderRadius.only(
//                                               topLeft: Radius.circular(15),
//                                               topRight: Radius.circular(15)),
//                                           child: CachedNetworkImage(
//                                             imageUrl:
//                                                 "http://owlsup.ru/main_catalog/mods/${NOT2.value[0].mods![index].id}/screens/s1.jpg",
//                                             fit: BoxFit.cover,
//                                             placeholder: (context, url) =>
//                                                 Container(
//                                               height: ScreenSize
//                                                       .horizontalBlockSize! *
//                                                   45,
//                                               child: Center(
//                                                 child: SizedBox(
//                                                     height:
//                                                         ScreenSize.fSize_30(),
//                                                     width:
//                                                         ScreenSize.fSize_30(),
//                                                     child: Center(
//                                                         child:
//                                                             CircularProgressIndicator(
//                                                       color: const Color(
//                                                           0xff78CFCA),
//                                                       strokeWidth: ScreenSize
//                                                               .horizontalBlockSize! *
//                                                           0.8,
//                                                     ))),
//                                               ),
//                                             ),
//                                             errorWidget: (context, url, error) =>
//                                                 Container(
//                                                     height: ScreenSize
//                                                             .horizontalBlockSize! *
//                                                         45,
//                                                     child: const Center(
//                                                         child:
//                                                             Icon(Icons.error))),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     bottom: 0,
//                                     right: ScreenSize.fSize_13(),
//                                     child: Column(
//                                       children: const [
//                                         Image(
//                                           image: AssetImage(
//                                               'asset/image/Group 71.png'),
//                                           width: 30,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding:
//                                   EdgeInsets.only(left: ScreenSize.fSize_8()),
//                               child: Container(
//                                   height: ScreenSize.fSize_30(),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Container(
//                                         child: Text(
//                                           '${NOT2.value[0].mods![index].title}',
//                                           overflow: TextOverflow.ellipsis,
//                                           style: GoogleFonts.archivo(
//                                               color: Colors.black,
//                                               fontSize: ScreenSize.fSize_14(),
//                                               fontWeight: FontWeight.w600),
//                                         ),
//                                       )
//                                     ],
//                                   )),
//                             ),
//                             SizedBox(height: ScreenSize.fSize_4()),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 controllerlikecomentsmall.getText(
//                                     'asset/image/CloudArrowDown.png',
//                                     '${NumberFormat.compact().format(Dnum)}'),
//                                 controllerlikecomentsmall.getText(
//                                     'asset/image/HeartStraight.png',
//                                     '${NumberFormat.compact().format(Vnum)}'),
//                                 controllerlikecomentsmall.getText(
//                                     'asset/image/Eye.png',
//                                     '${NumberFormat.compact().format(Lnum)}'),
//                               ],
//                             ),
//                           ]),
//                     ),
//                   );
//                 }),
//       ),
//     );
//   }
//
//   Widget buildUsers2() {
//     return Obx(
//       () => Padding(
//         padding: const EdgeInsets.all(12),
//         child: NOT2.value.isEmpty
//             ? const Center(
//                 child: CircularProgressIndicator(color: Color(0xff78CFCA)))
//             : GridView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                     maxCrossAxisExtent: 200,
//                     childAspectRatio: 0.8,
//                     crossAxisSpacing: 15,
//                     mainAxisSpacing: 15),
//                 itemCount: NOT2.value[0].mods!.length,
//                 itemBuilder: (BuildContext ctx, index) {
//                   final Dnum = int.parse(NOT2.value[0].mods![index].downloads!);
//                   final Vnum = int.parse(NOT2.value[0].mods![index].views!);
//                   final Lnum = int.parse(NOT2.value[0].mods![index].likes!);
//                   return GestureDetector(
//                     onTap: () {
//                       LOAD.value = true;
//                       fetchUsers2();
//                       Chek();
//                       downlod(index);
//                       Game2.value = {
//                         "IMAGE":
//                             "http://owlsup.ru/main_catalog/mods/${NOT2.value[0].mods![index].id}/screens/s1.jpg",
//                         "DOWNLOD": NumberFormat.compact().format(Dnum),
//                         "LIKE": NumberFormat.compact().format(Vnum),
//                         "VIEW": NumberFormat.compact().format(Lnum),
//                         "DISCRIP": NOT2.value[0].mods![index].description,
//                         "DOWNLODFILE": NOT2.value[0].mods![index].files![0].url,
//                         "TITAL": NOT2.value[0].mods![index].title,
//                         "ID": NOT2.value[0].mods![index].id,
//                         "VEROSN": NOT2.value[0].mods![index].versions![0].code
//                       };
//                       final position =
//                           scrollController.position.minScrollExtent;
//                       scrollController.animateTo(position,
//                           duration: const Duration(milliseconds: 300),
//                           curve: Curves.linear);
//                     },
//                     child: Obx(
//                       () => Container(
//                         decoration: BoxDecoration(
//                             color: const Color(0xffF9FCFB),
//                             borderRadius: BorderRadius.circular(20),
//                             border: Border.all(color: const Color(0xff78CFCA))),
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 height: ScreenSize.horizontalBlockSize! * 40,
//                                 child: Stack(
//                                   children: [
//                                     Container(
//                                       height:
//                                           ScreenSize.horizontalBlockSize! * 45,
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(3),
//                                         child: Container(
//                                           height:
//                                               ScreenSize.horizontalBlockSize! *
//                                                   45,
//                                           width:
//                                               ScreenSize.horizontalBlockSize! *
//                                                   45,
//                                           child: ClipRRect(
//                                             borderRadius:
//                                                 const BorderRadius.only(
//                                                     topLeft:
//                                                         Radius.circular(15),
//                                                     topRight:
//                                                         Radius.circular(15)),
//                                             child: CachedNetworkImage(
//                                               imageUrl:
//                                                   "http://owlsup.ru/main_catalog/mods/${NOT2.value[0].mods![index].id}/screens/s1.jpg",
//                                               fit: BoxFit.cover,
//                                               placeholder: (context, url) =>
//                                                   Container(
//                                                 height: ScreenSize
//                                                         .horizontalBlockSize! *
//                                                     45,
//                                                 child: Center(
//                                                   child: SizedBox(
//                                                       height:
//                                                           ScreenSize.fSize_30(),
//                                                       width:
//                                                           ScreenSize.fSize_30(),
//                                                       child: Center(
//                                                           child:
//                                                               CircularProgressIndicator(
//                                                         color: const Color(
//                                                             0xff78CFCA),
//                                                         strokeWidth: ScreenSize
//                                                                 .horizontalBlockSize! *
//                                                             0.8,
//                                                       ))),
//                                                 ),
//                                               ),
//                                               errorWidget: (context, url,
//                                                       error) =>
//                                                   Container(
//                                                       height: ScreenSize
//                                                               .horizontalBlockSize! *
//                                                           45,
//                                                       child: const Center(
//                                                           child: Icon(
//                                                               Icons.error))),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Positioned(
//                                       bottom: 0,
//                                       right: ScreenSize.fSize_13(),
//                                       child: Column(
//                                         children: const [
//                                           Image(
//                                             image: AssetImage(
//                                                 'asset/image/Group 71.png'),
//                                             width: 30,
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     EdgeInsets.only(left: ScreenSize.fSize_8()),
//                                 child: Container(
//                                     height: ScreenSize.fSize_30(),
//                                     // color: Colors.black12,
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                           child: Text(
//                                             '${NOT2.value[0].mods![index].title}',
//                                             overflow: TextOverflow.ellipsis,
//                                             style: GoogleFonts.archivo(
//                                                 color: Colors.black,
//                                                 fontSize: ScreenSize.fSize_14(),
//                                                 fontWeight: FontWeight.w600),
//                                           ),
//                                         )
//                                       ],
//                                     )),
//                               ),
//                               SizedBox(height: ScreenSize.fSize_4()),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   controllerlikecomentsmall.getText(
//                                       'asset/image/CloudArrowDown.png',
//                                       // 'aa'
//                                       '${NumberFormat.compact().format(Dnum)}'),
//                                   controllerlikecomentsmall.getText(
//                                       'asset/image/HeartStraight.png',
//                                       // 'aa'
//                                       '${NumberFormat.compact().format(Vnum)}'),
//                                   controllerlikecomentsmall.getText(
//                                       'asset/image/Eye.png',
//                                       // 'aa'
//                                       '${NumberFormat.compact().format(Lnum)}'),
//                                 ],
//                               ),
//                             ]),
//                       ),
//                     ),
//                   );
//                 }),
//       ),
//     );
//   }
//
//   var IMAGES = [
//     "asset/image/Rectangle 27.png",
//     "asset/image/Rectangle 28.png",
//     "asset/image/Rectangle 29.png",
//     "asset/image/Rectangle 30.png",
//   ].obs;
// }
//
// final controllerdata = Get.put(datacontroller());
//
// class datacontroller extends GetxController {
//   getText(width, text) {
//     return Container(
//       width: ScreenSize.horizontalBlockSize! * width,
//       height: 34,
//       decoration: ShapeDecoration(
//         color: Color(0xFF020525),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(17),
//         ),
//       ),
//       child: Center(
//         child: controllertext.getText(text, FontWeight.w500, 3.2),
//       ),
//     );
//   }
// }
//
// final controllerdownlod = Get.put(controllerDownlod());
//
// class controllerDownlod extends GetxController {
//   getContain(TEXT) {
//     return Container(
//         // width: ScreenSize.horizontalBlockSize! * 20,
//         height: ScreenSize.horizontalBlockSize! * 12,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: const Color(0xff78CFCA),
//             border: Border.all(color: const Color(0xff78CFCA))),
//         child: Center(
//           child: Text(
//             TEXT,
//             style: GoogleFonts.archivo(
//                 color: Colors.white,
//                 fontSize: ScreenSize.fSize_15(),
//                 fontWeight: FontWeight.w600),
//           ),
//         ));
//   }
// }
//
// final controllerlikecomentsmall = Get.put(LIKECOMENTSMALL());
//
// class LIKECOMENTSMALL extends GetxController {
//   getText(IMAGE, TEXT) {
//     return Container(
//       child: Row(
//         children: [
//           Image(image: AssetImage(IMAGE)),
//           SizedBox(width: ScreenSize.fSize_4()),
//           // controllerblacktext.getText(
//           //     TEXT, ScreenSize.fSize_11(), FontWeight.w500)
//           controllertext.getText(TEXT, FontWeight.w500, 4)
//         ],
//       ),
//     );
//   }
// }
