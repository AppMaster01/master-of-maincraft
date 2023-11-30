// // import 'dart:convert';
// // import 'dart:io';
// // import 'dart:math';
// //
// // import 'package:archive/archive_io.dart';
// // import 'package:cached_network_image/cached_network_image.dart';
// // import 'package:dio/dio.dart';
// // import 'package:external_path/external_path.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
// // import 'package:get/get.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:intl/intl.dart';
// // import 'package:open_file/open_file.dart';
// // import 'package:path_provider/path_provider.dart';
// // import 'package:percent_indicator/linear_percent_indicator.dart';
// // import 'package:permission_handler/permission_handler.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:uuid/uuid.dart';
// //
// // import '../Controller/Back controller.dart';
// // import '../Controller/Google_Ads.dart';
// // import '../DBFile/DbHelper.dart';
// // import '../DBFile/notes.dart';
// // import '../Media_qury/Media.dart';
// // import '../Model_class/class2.dart';
// // import '../Widget Controller/Controller.dart';
// // import '../model_Class/clkass.dart';
// // import 'Home Screen.dart';
// //
// // // String imageUrl =
// // //     "http://owlsup.ru/main_catalog/maps/1933/files/Zombie_apocalypse.mcworl";
// //
// // class Transport_Addon extends StatefulWidget {
// //   const Transport_Addon({super.key});
// //
// //   @override
// //   State<Transport_Addon> createState() => _Transport_AddonState();
// // }
// //
// // class _Transport_AddonState extends State<Transport_Addon> {
// //   var LIKE = false.obs;
// //   var isShow = true.obs;
// //   var DATA = "".obs;
// //   var CLICK = [].obs;
// //
// //   ScrollController scrollController = ScrollController();
// //
// //   var pagenumber = 2;
// //   var LOAD = false.obs;
// //   var LOAD2 = false.obs;
// //   var Game2 = {}.obs;
// //
// //   final List<MineCraft> notes = <MineCraft>[];
// //
// //   Rx<Dio> dio2 = Dio().obs;
// //
// //   var downloading = false.obs;
// //   var progressString = ''.obs;
// //   var downloadedUrl = ''.obs;
// //   var imageUrl = ''.obs;
// //   var exits = false.obs;
// //   var Value = 0.0.obs;
// //   var Downlod = "Downlod".obs;
// //   var downloded = "".obs;
// //   var open = "".obs;
// //   var DONE = false.obs;
// //
// //   @override
// //   void initState() {
// //     GETDAT();
// //     dBhelper = DBhelper();
// //     loadData();
// //     imageUrl.value = Selected.value == true
// //         ? "http://owlsup.ru/main_catalog/${abc[1]}/${abc[3]}/files/${abc[8]}"
// //         : LOAD.value == true
// //             ? "http://owlsup.ru/main_catalog/mods/${Game2.value['ID']}/files/${Game2.value["DOWNLODFILE"]}"
// //             : "http://owlsup.ru/main_catalog/mods/${abc[0]}/files/${abc[6]}";
// //
// //     fetchUsers2().then((value) {
// //       NOT2.value.addAll(value);
// //     });
// //     super.initState();
// //     Chek();
// //     print('LLLLLLLLLL${"${imageUrl}"}');
// //   }
// //
// //   GETDAT() async {
// //     var prefs = await SharedPreferences.getInstance();
// //     DONE.value = (await prefs.getBool("BOOL"))!;
// //   }
// //
// //   var NOT2 = <Mincraft2>[].obs;
// //
// //   Future fetchUsers2() async {
// //     int randomNumber2 = Random().nextInt(600) + 2;
// //     var url;
// //     url =
// //         "http://owlsup.ru/posts?category=mods&page=${randomNumber2}&lang=en&sort=downloads&order=desc&apiKey=37b51d194a7513e45b56f6524f2d51f2";
// //     var response2 = await http.get(Uri.parse(url));
// //     var notes2 = <Mincraft2>[].obs;
// //     notes2.value.clear();
// //     if (response2.statusCode == 200) {
// //       var notesjson = json.decode(response2.body);
// //       notes2.value.add(Mincraft2.fromJson(notesjson));
// //     }
// //     print('RRRRRRRR${randomNumber2}');
// //     NOT2.value = notes2.value;
// //     print('RRRRRRRR${notes2.value[0].mods![0].title}');
// //     return NOT2.value;
// //   }
// //
// //   downlod([index]) {
// //     imageUrl.value =
// //         "http://owlsup.ru/main_catalog/mods/${NOT2[0].mods![index].id}/files/${NOT2[0].mods![index].files![0].url}";
// //     print('LLLLLLLLLL${"${imageUrl}"}');
// //   }
// //
// //   var abc = Get.arguments;
// //
// //   var _openResult = 'Unknown'.obs;
// //
// //   Future<bool> getStoragePremission() async {
// //     return await Permission.manageExternalStorage.request().isGranted;
// //   }
// //
// //   Future<String> getDownloadFolderPath() async {
// //     return await ExternalPath.getExternalStoragePublicDirectory(
// //         ExternalPath.DIRECTORY_DOWNLOADS);
// //   }
// //
// //   Future downloadFile(String downloadDireactory) async {
// //     var downloadedImagepath =
// //         '/storage/emulated/0/Download/Download/${imageUrl.split("/").last}'.obs;
// //     try {
// //       await dio2.value.download(
// //         imageUrl.value,
// //         downloadedImagepath.value,
// //         onReceiveProgress: (rec, total) {
// //           print("Rec:$rec,Total:$total");
// //           downloading.value = true;
// //           progressString.value = "${((rec / total) * 100).toStringAsFixed(0)}%";
// //           Value.value = (rec / total);
// //         },
// //       );
// //     } catch (e) {
// //       print(e);
// //     }
// //     await Future.delayed(const Duration(seconds: 3));
// //     return downloadedImagepath.value;
// //   }
// //
// //   Future<void> doDownload() async {
// //     if (await getStoragePremission()) {
// //       String downloadDirectory = await getDownloadFolderPath();
// //       await downloadFile(downloadDirectory).then(
// //         (Url) {
// //           displayImage(Url);
// //         },
// //       );
// //     }
// //   }
// //
// //   void displayImage(String downloadDirectory) {
// //     downloading.value = false;
// //     progressString.value = "COMPLETED";
// //     downloadedUrl.value = imageUrl.value;
// //     exits.value = true;
// //   }
// //
// //   Future<void> openFile() async {
// //     var filePath =
// //         '/storage/emulated/0/Download/Download/${imageUrl.split("/").last}';
// //     final _result = await OpenFile.open(filePath, type: "*/*");
// //     print(_result.message);
// //
// //     _openResult.value = "type=${_result.type}  message=${_result.message}";
// //   }
// //
// //   Chek() async {
// //     if (await File(
// //             '/storage/emulated/0/Download/Download/${imageUrl.split("/").last}')
// //         .exists()) {
// //       exits.value = true;
// //     } else {
// //       exits.value = false;
// //     }
// //   }
// //
// //   var TEXTLIST = [].obs;
// //   DBhelper? dBhelper;
// //   late Future<List<NotesModel>> noteslist;
// //
// //   loadData() async {
// //     noteslist = dBhelper!.getNotesList();
// //   }
// //
// //   final DBhelper dbHelper = DBhelper();
// //
// //   var uuid = Uuid();
// //
// //   void _go() async {
// //     try {
// //       Map<String, dynamic> a = {
// //         "format_version": 1,
// //         "header": {
// //           "description": "${abc[2]}",
// //           "name": "${abc[2]}",
// //           "uuid": "${uuid.v1()}",
// //           "version": [0, 0, 1],
// //           "min_engine_version": [1, 2, 0]
// //         },
// //         "modules": [
// //           {
// //             "description": "${abc[2]}",
// //             "type": "skin_pack",
// //             "uuid": "${uuid.v1()}",
// //             "version": [0, 0, 1]
// //           }
// //         ]
// //       };
// //
// //       Map<String, dynamic> b = {
// //         "skins": [
// //           {
// //             "localization_name": "${abc[2]}",
// //             "geometry": "geometry.humanoid.custom",
// //             "texture": "${abc[2]}.png",
// //             "type": "free"
// //           }
// //         ],
// //         "serialize_name": "${abc[2]}",
// //         "localization_name": "${abc[2]}"
// //       };
// //
// //       final Directory? directory = await getExternalStorageDirectory();
// //       final File manifestFile = File(
// //           '${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/manifest.json');
// //       final File skinsFile = File(
// //           '${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/skins.json');
// //       await manifestFile.writeAsString(json.encode(a));
// //       await skinsFile.writeAsString(json.encode(b));
// //       await zip();
// //     } catch (e) {
// //       print('Error in _go(): $e');
// //     }
// //   }
// //
// //   Future<void> zip() async {
// //     try {
// //       Directory? appDocDirectory = await getExternalStorageDirectory();
// //       var encoder = ZipFileEncoder();
// //       encoder.create(
// //           "${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/${abc[2]}.macpack");
// //       encoder.addFile(File(
// //           '${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/manifest.json'));
// //       encoder.addFile(File(
// //           '${'/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}'}${abc[2]}/skins.json'));
// //       encoder.addFile(File(
// //           '${'/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}'}${abc[2]}/${abc[2]}.jpg'));
// //       // encoder.create(
// //           // "${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/${abc[2]}.zip");
// //
// //       await _downloadImage(
// //         LOAD.value == true
// //             ? Game2.value['IMAGE']
// //             : Selected.value == true
// //                 ? "http://owlsup.ru/main_catalog/${abc[1]}/${abc[3]}/screens/s1.jpg"
// //                 : "http://owlsup.ru/main_catalog/mods/${abc[0]}/screens/s1.jpg",
// //         "${'/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}'}${abc[2]}/${abc[2]}.jpg",
// //       );
// //       // createZipFile();
// //       encoder.close();
// //     } catch (e) {
// //       print('Error in zip(): $e');
// //     }
// //   }
// //
// //   // Future<void> createZipFile() async {
// //   //   try {
// //   //     // Define the paths to the files you want to include in the zip
// //   //
// //   //     // Create a ZipFileEncoder
// //   //     var encoder = ZipFileEncoder();
// //   //     // encoder.create(
// //   //     //     "${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/${abc[2]}.zip");
// //   //     // encoder.create(
// //   //     // "${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/${abc[2]}.mcpack");
// //   //     // encoder.addFile(File(
// //   //     // '${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/${abc[2]}.zip'));
// //   //     encoder.addFile(File(
// //   //         '${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/${abc[2]}.mcpack'));
// //   //     encoder.addFile(File(
// //   //         '${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/manifest.json'));
// //   //     encoder.addFile(File(
// //   //         '${'/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}'}${abc[2]}/skins.json'));
// //   //     encoder.addFile(File(
// //   //         '${'/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}'}${abc[2]}/${abc[2]}.jpg'));
// //   //     // encoder.create("${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/${abc[2]}.zip");
// //   //
// //   //     await _downloadImage(
// //   //       LOAD.value == true
// //   //           ? Game2.value['IMAGE']
// //   //           : Selected.value == true
// //   //               ? "http://owlsup.ru/main_catalog/${abc[1]}/${abc[3]}/screens/s1.jpg"
// //   //               : "http://owlsup.ru/main_catalog/mods/${abc[0]}/screens/s1.jpg",
// //   //       "${'/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}'}${abc[2]}/${abc[2]}.jpg",
// //   //     );
// //   //     encoder.close();
// //   //
// //   //     print('Zip file created successfully.');
// //   //   } catch (e) {
// //   //     print('Error creating zip file: $e');
// //   //   }
// //   // }
// //
// //   Future<void> _downloadImage(String imageurl, String savePath) async {
// //     final response = await http.get(Uri.parse(LOAD.value == true
// //         ? Game2.value['IMAGE']
// //         : Selected.value == true
// //             ? "http://owlsup.ru/main_catalog/${abc[1]}/${abc[3]}/screens/s1.jpg"
// //             : "http://owlsup.ru/main_catalog/mods/${abc[0]}/screens/s1.jpg"));
// //     if (response.statusCode == 200) {
// //       File(savePath).writeAsBytesSync(response.bodyBytes);
// //     } else {
// //       throw Exception('Failed to download image: ${response.statusCode}');
// //     }
// //   }
// //
// //   Future<void> openFile2() async {
// //     var filePath =
// //         '${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/${abc[2]}.mcpack';
// //     // '${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${LOAD.value == true ? Game2.value['TITAL'] : Selected.value == false ? abc[1] : abc[2]}/${LOAD.value == true ? Game2.value['TITAL'] : Selected.value == false ? abc[1] : abc[2]}.mcpack';
// //     final _result = await OpenFile.open(filePath, type: "*/*");
// //     print(_result.message);
// //
// //     _openResult.value = "type=${_result.type}  message=${_result.message}";
// //   }
// //
// // //=============================================================================================================
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     print('--------------------------${abc[1]}');
// //     final Dnum =
// //         int.parse(Selected.value == true ? abc[4].downloads : abc[2].downloads);
// //     // final Vnum = int.parse(Selected.value == true ? 0 : abc[9]);
// //     final Lnum =
// //         int.parse(Selected.value == true ? abc[4].likes! : abc[2].likes);
// //     ScreenSize.sizerInit(context);
// //     // final Dnum = int.parse(abc[4].downloads);
// //     return WillPopScope(
// //       onWillPop: () => backbuttoncontroller.showBackbuttonad(
// //           context, '/Transport_Addon', ''),
// //       child: Scaffold(
// //           backgroundColor: Color(0xFF0D1129),
// //           appBar: controllerMainapp.getText(() {
// //             backbuttoncontroller.showBackbuttonad(
// //                 context, '/Transport_Addon', '');
// //           },
// //               7.5,
// //               "asset/image/icon/Arrow back ios.png",
// //               Obx(() => Text(
// //                   "${LOAD.value == true ? Game2.value['TITAL'] : Selected.value == true ? abc[2] : abc[1]}")),
// //               "200",
// //               3.8),
// //           body: Stack(
// //             children: [
// //               SingleChildScrollView(
// //                 controller: scrollController,
// //                 physics: const BouncingScrollPhysics(),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Center(
// //                       child: ElevatedButton(
// //                           onPressed: () {
// //                             zip();
// //                             _go();
// //                           },
// //                           child: Text('data')),
// //                     ),
// //
// //                     GestureDetector(
// //                         onTap: () => openFile2(),
// //                         child: controllerBlueContainer.getText(
// //                             93, 12.4, 1.5, "Open", 4)),
// //                     SizedBox(width: ScreenSize.fSize_10()),
// //                     Padding(
// //                       padding: const EdgeInsets.all(10),
// //                       child: Container(
// //                         width: double.infinity,
// //                         height: ScreenSize.horizontalBlockSize! * 55,
// //                         decoration: BoxDecoration(
// //                           borderRadius: BorderRadius.all(Radius.circular(10)),
// //                         ),
// //                         child: Stack(
// //                           children: [
// //                             Obx(
// //                               () => Container(
// //                                 height: double.infinity,
// //                                 width: double.infinity,
// //                                 child: ClipRRect(
// //                                   borderRadius: BorderRadius.circular(20),
// //                                   child: CachedNetworkImage(
// //                                     imageUrl: LOAD.value == true
// //                                         ? Game2.value['IMAGE']
// //                                         : Selected.value == true
// //                                             ? "http://owlsup.ru/main_catalog/${abc[1]}/${abc[3]}/screens/s1.jpg"
// //                                             : "http://owlsup.ru/main_catalog/mods/${abc[0]}/screens/s1.jpg",
// //                                     fit: BoxFit.cover,
// //                                     placeholder: (context, url) => SizedBox(
// //                                         height: ScreenSize.fSize_50(),
// //                                         width: ScreenSize.fSize_50(),
// //                                         child: const Center(
// //                                             child: CircularProgressIndicator(
// //                                           color: Color(0xff78CFCA),
// //                                         ))),
// //                                     errorWidget: (context, url, error) =>
// //                                         const Icon(Icons.error,
// //                                             color: Color(0xFF9293B5)),
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                             Padding(
// //                               padding: const EdgeInsets.all(20),
// //                               child: FutureBuilder(
// //                                 future: dbHelper.getNotesList(),
// //                                 builder: (context, snapshot) {
// //                                   for (int i = 0;
// //                                       i < snapshot.data!.length;
// //                                       i++) {
// //                                     TEXTLIST.value.add(snapshot.data![i].text);
// //                                   }
// //                                   return Obx(
// //                                     () => GestureDetector(
// //                                         onTap: () async {
// //                                           if (TEXTLIST.value
// //                                               .contains(LOAD.value == true
// //                                                   ? Game2.value['TITAL']
// //                                                   : Selected.value == true
// //                                                       ? abc[2]
// //                                                       : abc[1])) {
// //                                             dBhelper!.delet(LOAD.value == true
// //                                                 ? Game2.value['TITAL']
// //                                                 : Selected.value == true
// //                                                     ? abc[2]
// //                                                     : abc[1]);
// //                                           } else {
// //                                             dBhelper!
// //                                                 .insert(NotesModel(
// //                                               text: LOAD.value == true
// //                                                   ? Game2.value['TITAL']
// //                                                   : Selected.value == true
// //                                                       ? abc[2]
// //                                                       : abc[1],
// //                                               image: LOAD.value == true
// //                                                   ? Game2.value['IMAGE']
// //                                                   : Selected.value == true
// //                                                       ? "http://owlsup.ru/main_catalog/${abc[1]}/${abc[3]}/screens/s1.jpg"
// //                                                       : "http://owlsup.ru/main_catalog/mods/${abc[0]}/screens/s1.jpg",
// //                                             ))
// //                                                 .then((value) {
// //                                               print("data added");
// //                                             }).onError((error, stackTrace) {
// //                                               print(
// //                                                   '--------------------------${error.toString()}');
// //                                             });
// //                                           }
// //                                         },
// //                                         child: Column(
// //                                           mainAxisAlignment:
// //                                               MainAxisAlignment.end,
// //                                           children: [
// //                                             Row(
// //                                               mainAxisAlignment:
// //                                                   MainAxisAlignment.end,
// //                                               children: [
// //                                                 Center(
// //                                                   child: Container(
// //                                                     width: ScreenSize
// //                                                             .horizontalBlockSize! *
// //                                                         12,
// //                                                     height: ScreenSize
// //                                                             .horizontalBlockSize! *
// //                                                         12,
// //                                                     decoration: ShapeDecoration(
// //                                                       image: DecorationImage(
// //                                                           image: AssetImage(TEXTLIST
// //                                                                   .value
// //                                                                   .contains(LOAD
// //                                                                               .value ==
// //                                                                           true
// //                                                                       ? Game2
// //                                                                               .value[
// //                                                                           'TITAL']
// //                                                                       : Selected.value ==
// //                                                                               true
// //                                                                           ? abc[
// //                                                                               2]
// //                                                                           : abc[
// //                                                                               1])
// //                                                               ? "asset/image/icon/like.png"
// //                                                               : "asset/image/icon/like_1.png"),
// //                                                           scale: 2.5),
// //                                                       color: Color(0x7702E1FB),
// //                                                       shape: OvalBorder(),
// //                                                     ),
// //                                                   ),
// //                                                 ),
// //                                               ],
// //                                             ),
// //                                           ],
// //                                         )),
// //                                   );
// //                                 },
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                     // SizedBox(height: ScreenSize.fSize_13()),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                       children: [
// //                         controllerlikedownlod.getText(
// //                             "asset/image/icon/file.png",
// //                             6.5,
// //                             '${LOAD.value == true ? Game2.value['VEROSN'] : Selected.value == true ? abc[6] : abc[9]}',
// //                             3.5),
// //                         controllerlikedownlod.getText(
// //                             "asset/image/icon/like.png",
// //                             6.5,
// //                             '${LOAD.value == true ? Game2.value['LIKE'] : Lnum}',
// //                             3.5),
// //                         controllerlikedownlod.getText(
// //                             "asset/image/icon/download.png",
// //                             6.5,
// //                             '${LOAD.value == true ? Game2.value['DOWNLOD'] : Dnum}',
// //                             3.5),
// //                       ],
// //                     ),
// //                     SizedBox(height: ScreenSize.fSize_20()),
// //                     Padding(
// //                       padding: EdgeInsets.only(left: ScreenSize.fSize_15()),
// //                       child: Container(
// //                         width: ScreenSize.fSize_70(),
// //                         height: ScreenSize.fSize_34(),
// //                         decoration: ShapeDecoration(
// //                           color: Color(0xFF020525),
// //                           shape: RoundedRectangleBorder(
// //                             side:
// //                                 BorderSide(width: 1, color: Color(0xFF02E1FB)),
// //                             borderRadius: BorderRadius.circular(17),
// //                           ),
// //                         ),
// //                         child: Center(
// //                           child: controllertext.getText(
// //                               'Tag', FontWeight.w500, 3.8),
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(height: ScreenSize.fSize_15()),
// //                     Row(
// //                       children: [
// //                         SizedBox(width: ScreenSize.horizontalBlockSize! * 3),
// //                         controllerdata.getText(25, "Blocks"),
// //                         SizedBox(width: ScreenSize.horizontalBlockSize! * 3),
// //                         controllerdata.getText(27, "Zombies"),
// //                         SizedBox(width: ScreenSize.horizontalBlockSize! * 3),
// //                         controllerdata.getText(29, "Add-ons"),
// //                       ],
// //                     ),
// //                     SizedBox(height: ScreenSize.fSize_10()),
// //                     Obx(
// //                       () => Padding(
// //                         padding: EdgeInsets.only(left: ScreenSize.fSize_15()),
// //                         child: controllertext.getText(
// //                             """${LOAD.value == true ? Game2.value['DISCRIP'] : Selected.value == true ? abc[5] : abc[8]}""",
// //                             FontWeight.w500,
// //                             3.5),
// //                       ),
// //                     ),
// //                     SizedBox(height: ScreenSize.fSize_20()),
// //                     abc[1] == 'seeds'
// //                         ? Center(
// //                             child: GestureDetector(
// //                                 onTap: () {
// //                                   Clipboard.setData(
// //                                       ClipboardData(text: "${abc[9].key}"));
// //                                   Fluttertoast.showToast(
// //                                     msg: "Copy",
// //                                     toastLength: Toast.LENGTH_SHORT,
// //                                     timeInSecForIosWeb: 3,
// //                                     textColor: Colors.white,
// //                                     gravity: ToastGravity.SNACKBAR,
// //                                     backgroundColor: Color(0xFF174AA7),
// //                                     fontSize: 15,
// //                                   );
// //                                   // doDownload();
// //                                 },
// //                                 child: controllerBlueContainer.getText(
// //                                     93, 12.4, 1.5, "Copy", 4)),
// //                           )
// //                         : Obx(
// //                             () => DONE.value == false
// //                                 ? Stack(
// //                                     children: [
// //                                       GestureDetector(
// //                                         onTap: () {
// //                                           showDialog(
// //                                               context: context,
// //                                               builder: (BuildContext context) {
// //                                                 return Dialog(
// //                                                   backgroundColor:
// //                                                       Colors.transparent,
// //                                                   shape: RoundedRectangleBorder(
// //                                                       borderRadius:
// //                                                           BorderRadius.circular(
// //                                                               20.0)),
// //                                                   //this right here
// //                                                   child: Container(
// //                                                     height: ScreenSize
// //                                                             .horizontalBlockSize! *
// //                                                         45,
// //                                                     width: ScreenSize
// //                                                             .horizontalBlockSize! *
// //                                                         80,
// //                                                     decoration: ShapeDecoration(
// //                                                       color: Color(0xFF020525),
// //                                                       shape:
// //                                                           RoundedRectangleBorder(
// //                                                         borderRadius:
// //                                                             BorderRadius
// //                                                                 .circular(13),
// //                                                       ),
// //                                                       shadows: [
// //                                                         BoxShadow(
// //                                                           color:
// //                                                               Color(0xFF676EB8),
// //                                                           blurRadius: 4,
// //                                                           offset: Offset(0, 0),
// //                                                           spreadRadius: 0,
// //                                                         )
// //                                                       ],
// //                                                     ),
// //                                                     child: Column(
// //                                                       children: [
// //                                                         SizedBox(
// //                                                             height: ScreenSize
// //                                                                     .horizontalBlockSize! *
// //                                                                 5),
// //                                                         Row(
// //                                                           children: [
// //                                                             SizedBox(
// //                                                                 width: ScreenSize
// //                                                                     .fSize_20()),
// //                                                             controllertext
// //                                                                 .getText(
// //                                                                     "Oops",
// //                                                                     FontWeight
// //                                                                         .w500,
// //                                                                     5.5)
// //                                                           ],
// //                                                         ),
// //                                                         SizedBox(
// //                                                             height: ScreenSize
// //                                                                     .horizontalBlockSize! *
// //                                                                 5),
// //                                                         Row(
// //                                                           children: [
// //                                                             SizedBox(
// //                                                                 width: ScreenSize
// //                                                                     .fSize_20()),
// //                                                             controllertext.getText(
// //                                                                 "Not enough 200 Coins!",
// //                                                                 FontWeight.w400,
// //                                                                 4.5)
// //                                                           ],
// //                                                         ),
// //                                                         SizedBox(
// //                                                             height: ScreenSize
// //                                                                     .horizontalBlockSize! *
// //                                                                 9),
// //                                                         GestureDetector(
// //                                                           onTap: () async {
// //                                                             DONE.value = true;
// //                                                             var prefs =
// //                                                                 await SharedPreferences
// //                                                                     .getInstance();
// //                                                             await prefs.setBool(
// //                                                                 "BOOL",
// //                                                                 DONE.value);
// //                                                             Navigator.of(
// //                                                                     context)
// //                                                                 .pop(false);
// //                                                           },
// //                                                           child:
// //                                                               controllerBlueContainer
// //                                                                   .getText(
// //                                                                       28,
// //                                                                       8,
// //                                                                       2,
// //                                                                       "Get Coins",
// //                                                                       3.2),
// //                                                         )
// //                                                       ],
// //                                                     ),
// //                                                   ),
// //                                                 );
// //                                               });
// //                                         },
// //                                         child: Center(
// //                                           child:
// //                                               controllerBlueContainer.getText(
// //                                                   93,
// //                                                   12.4,
// //                                                   2,
// //                                                   "Unlock For 2000 Coins",
// //                                                   4),
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   )
// //                                 : Center(
// //                                     child: Obx(
// //                                       () => Column(children: [
// //                                         downloading.value
// //                                             ? Center(
// //                                                 child: Container(
// //                                                   height: ScreenSize
// //                                                           .horizontalBlockSize! *
// //                                                       12.4,
// //                                                   width: ScreenSize
// //                                                           .horizontalBlockSize! *
// //                                                       94,
// //                                                   child: LinearPercentIndicator(
// //                                                     lineHeight: ScreenSize
// //                                                             .horizontalBlockSize! *
// //                                                         12.4,
// //                                                     width: ScreenSize
// //                                                             .horizontalBlockSize! *
// //                                                         94,
// //                                                     barRadius:
// //                                                         const Radius.circular(
// //                                                             3),
// //                                                     percent: Value.value,
// //                                                     center: Text(
// //                                                         "${progressString.value}",
// //                                                         style:
// //                                                             GoogleFonts.archivo(
// //                                                                 color: Colors
// //                                                                     .white,
// //                                                                 fontWeight:
// //                                                                     FontWeight
// //                                                                         .w600)),
// //                                                     linearStrokeCap:
// //                                                         LinearStrokeCap
// //                                                             .roundAll,
// //                                                     progressColor:
// //                                                         const Color(0xFF174AA7),
// //                                                   ),
// //                                                 ),
// //                                               )
// //                                             : exits.value == false
// //                                                 ? GestureDetector(
// //                                                     onTap: () async {
// //                                                       doDownload();
// //                                                       // zip();
// //                                                     },
// //                                                     child:
// //                                                         controllerBlueContainer
// //                                                             .getText(
// //                                                                 93,
// //                                                                 12.4,
// //                                                                 1.5,
// //                                                                 "DOWNLOAD",
// //                                                                 4))
// //                                                 : GestureDetector(
// //                                                     onTap: () => openFile(),
// //                                                     child:
// //                                                         controllerBlueContainer
// //                                                             .getText(93, 12.4,
// //                                                                 1.5, "Open", 4))
// //                                         // exits == true
// //                                         //     ? GestureDetector(
// //                                         //         onTap: () => openFile(),
// //                                         //         child:
// //                                         //             controllerBlueContainer.getText(
// //                                         //                 93, 12.4, 1.5, "Open", 4))
// //                                         //     : downloading.value
// //                                         //         ? Center(
// //                                         //             child: Container(
// //                                         //               height: ScreenSize
// //                                         //                       .horizontalBlockSize! *
// //                                         //                   12.4,
// //                                         //               width: ScreenSize
// //                                         //                       .horizontalBlockSize! *
// //                                         //                   93,
// //                                         //               child: LinearPercentIndicator(
// //                                         //                 lineHeight: ScreenSize
// //                                         //                         .horizontalBlockSize! *
// //                                         //                     12.4,
// //                                         //                 barRadius:
// //                                         //                     const Radius.circular(3),
// //                                         //                 percent: Value.value,
// //                                         //                 center: Text(
// //                                         //                     "${progressString.value}",
// //                                         //                     style:
// //                                         //                         GoogleFonts.archivo(
// //                                         //                             color:
// //                                         //                                 Colors.white,
// //                                         //                             fontWeight:
// //                                         //                                 FontWeight
// //                                         //                                     .w600)),
// //                                         //                 linearStrokeCap:
// //                                         //                     LinearStrokeCap.roundAll,
// //                                         //                 progressColor:
// //                                         //                     const Color(0xFF174AA7),
// //                                         //               ),
// //                                         //             ),
// //                                         //           )
// //                                         //         : downloadedUrl == ""
// //                                         //             ? GestureDetector(
// //                                         //                 onTap: () => doDownload(),
// //                                         //                 child: controllerBlueContainer
// //                                         //                     .getText(93, 12.4, 1.5,
// //                                         //                         "DOWNLOAD", 4))
// //                                         //             : GestureDetector(
// //                                         //                 onTap: () => openFile(),
// //                                         //                 child: controllerBlueContainer
// //                                         //                     .getText(93, 12.4, 1.5,
// //                                         //                         "Open", 4)),
// //                                       ]),
// //                                     ),
// //                                   ),
// //                           ),
// //                     SizedBox(height: ScreenSize.fSize_20()),
// //                     Container(
// //                       // height: ScreenSize.fSize_50(),
// //                       decoration: ShapeDecoration(
// //                         color: Color(0xFF020525),
// //                         shape: RoundedRectangleBorder(
// //                           side: BorderSide(
// //                             width: 1,
// //                             strokeAlign: BorderSide.strokeAlignOutside,
// //                             color: Color(0xFF9293B5),
// //                           ),
// //                         ),
// //                       ),
// //                       child: Obx(
// //                         () => Column(
// //                           children: [
// //                             SizedBox(
// //                                 height: ScreenSize.horizontalBlockSize! * 4.5),
// //                             Row(
// //                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                               children: [
// //                                 Padding(
// //                                   padding: EdgeInsets.only(
// //                                       left: ScreenSize.fSize_15()),
// //                                   child: Container(
// //                                       width:
// //                                           ScreenSize.horizontalBlockSize! * 60,
// //                                       child: Text(
// //                                         "${LOAD.value == true ? Game2.value['DISCRIP'] : Selected.value == true ? abc[2] : abc[1]} - Description",
// //                                         overflow: TextOverflow.ellipsis,
// //                                         style: GoogleFonts.montserrat(
// //                                             color: Colors.white,
// //                                             fontWeight: FontWeight.w500,
// //                                             fontSize: ScreenSize
// //                                                     .horizontalBlockSize! *
// //                                                 3.6),
// //                                       )),
// //                                 ),
// //                                 SizedBox(width: ScreenSize.fSize_10()),
// //                                 GestureDetector(
// //                                   onTap: () {
// //                                     isShow.value = !isShow.value;
// //                                   },
// //                                   child: Container(
// //                                     width: ScreenSize.horizontalBlockSize! * 28,
// //                                     child: Center(
// //                                       child: Text(
// //                                         "Read ${isShow.value ? "More" : "Less"}",
// //                                         style: GoogleFonts.montserrat(
// //                                             color: Color(0xFF9293B5),
// //                                             fontWeight: FontWeight.w600,
// //                                             fontSize: ScreenSize
// //                                                     .horizontalBlockSize! *
// //                                                 3.8),
// //                                       ),
// //                                     ),
// //                                   ),
// //                                 )
// //                               ],
// //                             ),
// //                             Visibility(
// //                               visible: isShow.value,
// //                               child: Padding(
// //                                 padding: const EdgeInsets.all(8.0),
// //                                 child: Container(
// //                                   width: double.infinity,
// //                                   child: Column(
// //                                     crossAxisAlignment:
// //                                         CrossAxisAlignment.start,
// //                                     children: [
// //                                       Divider(
// //                                         thickness:
// //                                             ScreenSize.horizontalBlockSize! *
// //                                                 0.12,
// //                                         indent: ScreenSize.fSize_6(),
// //                                         endIndent: ScreenSize.fSize_10(),
// //                                         color: Color(0xFF9293B5),
// //                                       ),
// //                                       SizedBox(height: ScreenSize.fSize_6()),
// //                                       Padding(
// //                                         padding: EdgeInsets.only(
// //                                             left: ScreenSize.fSize_4()),
// //                                         child: Text(
// //                                           'IMAGES',
// //                                           style: GoogleFonts.montserrat(
// //                                               color: Color(0xFF9293B5),
// //                                               fontWeight: FontWeight.w600,
// //                                               fontSize: ScreenSize.fSize_13()),
// //                                         ),
// //                                       ),
// //                                       SizedBox(
// //                                           height:
// //                                               ScreenSize.horizontalBlockSize! *
// //                                                   2),
// //                                       Container(
// //                                         height:
// //                                             ScreenSize.horizontalBlockSize! *
// //                                                 17,
// //                                         width: double.infinity,
// //                                         child: ListView.builder(
// //                                           physics: BouncingScrollPhysics(),
// //                                           shrinkWrap: true,
// //                                           itemCount: LOAD.value == true
// //                                               ? CLICK.value.length
// //                                               : Selected.value == true
// //                                                   ? abc[7].length
// //                                                   : abc[10].length,
// //                                           scrollDirection: Axis.horizontal,
// //                                           itemBuilder: (context, index) {
// //                                             return Padding(
// //                                               padding: const EdgeInsets.all(1),
// //                                               child: Row(
// //                                                 children: [
// //                                                   Container(
// //                                                     width: ScreenSize
// //                                                             .horizontalBlockSize! *
// //                                                         22,
// //                                                     decoration: BoxDecoration(
// //                                                         borderRadius:
// //                                                             BorderRadius.all(
// //                                                                 Radius.circular(
// //                                                                     8)),
// //                                                         image: DecorationImage(
// //                                                             image: NetworkImage(
// //                                                                 "http://owlsup.ru/main_catalog/mods/${LOAD.value == true ? Game2.value['ID'] : Selected.value == true ? abc[3] : abc[0]}/screens//s$index.jpg"),
// //                                                             fit: BoxFit.cover)),
// //                                                   ),
// //                                                   SizedBox(
// //                                                       width: ScreenSize
// //                                                               .horizontalBlockSize! *
// //                                                           2),
// //                                                 ],
// //                                               ),
// //                                             );
// //                                           },
// //                                         ),
// //                                       ),
// //                                       SizedBox(
// //                                           height:
// //                                               ScreenSize.horizontalBlockSize! *
// //                                                   2),
// //                                       Padding(
// //                                         padding: EdgeInsets.only(
// //                                             left: ScreenSize.fSize_4()),
// //                                         child: Text(
// //                                           'DISCRIPTION :',
// //                                           style: GoogleFonts.montserrat(
// //                                               color: Color(0xFF9293B5),
// //                                               fontWeight: FontWeight.w600,
// //                                               fontSize: ScreenSize.fSize_13()),
// //                                         ),
// //                                       ),
// //                                       SizedBox(
// //                                           height:
// //                                               ScreenSize.horizontalBlockSize! *
// //                                                   2),
// //                                       Padding(
// //                                         padding: EdgeInsets.only(
// //                                             left: ScreenSize.fSize_4()),
// //                                         child: Text(
// //                                           """${LOAD.value == true ? Game2.value['DISCRIP'] : Selected.value == true ? abc[5] : abc[8]}""",
// //                                           style: GoogleFonts.montserrat(
// //                                               color: Colors.white,
// //                                               fontWeight: FontWeight.w400,
// //                                               fontSize: ScreenSize
// //                                                       .horizontalBlockSize! *
// //                                                   3),
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                             SizedBox(
// //                                 height: ScreenSize.horizontalBlockSize! * 4.5),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(height: ScreenSize.fSize_20()),
// //                     Row(
// //                       children: [
// //                         SizedBox(width: ScreenSize.fSize_10()),
// //                         controllertext.getText("Related", FontWeight.w500, 4.5)
// //                       ],
// //                     ),
// //                     SizedBox(height: ScreenSize.fSize_6()),
// //                     Obx(
// //                       () => LOAD.value == true ? buildUsers() : buildUsers(),
// //                     ),
// //                     SizedBox(
// //                       height: ScreenSize.fSize_80(),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               banner.getBN('/Vampire_Craft')
// //             ],
// //           )),
// //     );
// //   }
// //
// //   Widget buildUsers() {
// //     return Obx(
// //       () => Padding(
// //           padding: const EdgeInsets.all(12),
// //           child: NOT2.value.isEmpty
// //               ? const Center(
// //                   child: CircularProgressIndicator(color: Color(0xff78CFCA)))
// //               : Container(
// //                   height: ScreenSize.horizontalBlockSize! * 55,
// //                   width: double.infinity,
// //                   child: Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: ListView.builder(
// //                       physics: BouncingScrollPhysics(),
// //                       shrinkWrap: true,
// //                       itemCount: NOT2.value[0].mods!.length,
// //                       scrollDirection: Axis.horizontal,
// //                       itemBuilder: (context, index) {
// //                         final Dnum =
// //                             int.parse(NOT2.value[0].mods![index].downloads!);
// //                         final Vnum =
// //                             int.parse(NOT2.value[0].mods![index].views!);
// //                         final Lnum =
// //                             int.parse(NOT2.value[0].mods![index].likes!);
// //                         return GestureDetector(
// //                           onTap: () {
// //                             exits.value == false;
// //                             LOAD.value = true;
// //                             fetchUsers2();
// //                             downlod(index);
// //                             Chek();
// //                             CLICK.value = NOT2.value[0].mods![index].screens!;
// //                             Game2.value = {
// //                               "IMAGE":
// //                                   "http://owlsup.ru/main_catalog/mods/${NOT2.value[0].mods![index].id}/screens/s1.jpg",
// //                               "DOWNLOD": NumberFormat.compact().format(Dnum),
// //                               "LIKE": NumberFormat.compact().format(Vnum),
// //                               "VIEW": NumberFormat.compact().format(Lnum),
// //                               "DISCRIP": NOT2.value[0].mods![index].description,
// //                               "DOWNLODFILE":
// //                                   NOT2.value[0].mods![index].files![0].url,
// //                               "TITAL": NOT2.value[0].mods![index].title,
// //                               "ID": NOT2.value[0].mods![index].id,
// //                               "VEROSN":
// //                                   NOT2.value[0].mods![index].versions![0].code,
// //                               "SCREEN": NOT2.value[0].mods![index].screens
// //                             };
// //                             final position =
// //                                 scrollController.position.minScrollExtent;
// //                             scrollController.animateTo(position,
// //                                 duration: const Duration(milliseconds: 300),
// //                                 curve: Curves.linear);
// //                           },
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(5.5),
// //                             child: Container(
// //                               width: ScreenSize.horizontalBlockSize! * 65,
// //                               decoration: BoxDecoration(
// //                                 borderRadius:
// //                                     BorderRadius.all(Radius.circular(10)),
// //                               ),
// //                               child: Stack(
// //                                 children: [
// //                                   Container(
// //                                     height: double.infinity,
// //                                     width: double.infinity,
// //                                     child: ClipRRect(
// //                                       borderRadius:
// //                                           BorderRadius.all(Radius.circular(10)),
// //                                       child: CachedNetworkImage(
// //                                         imageUrl:
// //                                             "http://owlsup.ru/main_catalog/mods/${NOT2.value[0].mods![index].id}/screens/s1.jpg",
// //                                         fit: BoxFit.cover,
// //                                         placeholder: (context, url) =>
// //                                             Container(
// //                                           height:
// //                                               ScreenSize.horizontalBlockSize! *
// //                                                   45,
// //                                           child: Center(
// //                                             child: SizedBox(
// //                                                 height: ScreenSize.fSize_30(),
// //                                                 width: ScreenSize.fSize_30(),
// //                                                 child: Center(
// //                                                     child:
// //                                                         CircularProgressIndicator(
// //                                                   color:
// //                                                       const Color(0xff78CFCA),
// //                                                   strokeWidth: ScreenSize
// //                                                           .horizontalBlockSize! *
// //                                                       0.8,
// //                                                 ))),
// //                                           ),
// //                                         ),
// //                                         errorWidget: (context, url, error) =>
// //                                             Container(
// //                                                 height: ScreenSize
// //                                                         .horizontalBlockSize! *
// //                                                     45,
// //                                                 child: const Center(
// //                                                     child: Icon(Icons.error))),
// //                                       ),
// //                                     ),
// //                                   ),
// //                                   Column(
// //                                     mainAxisAlignment:
// //                                         MainAxisAlignment.spaceBetween,
// //                                     children: [
// //                                       Row(
// //                                         mainAxisAlignment:
// //                                             MainAxisAlignment.end,
// //                                         children: [
// //                                           Padding(
// //                                             padding: EdgeInsets.only(
// //                                                 top: ScreenSize.fSize_6()),
// //                                             child: Container(
// //                                               width: ScreenSize
// //                                                       .horizontalBlockSize! *
// //                                                   19,
// //                                               height: ScreenSize.fSize_28(),
// //                                               decoration: ShapeDecoration(
// //                                                   color: Color(0xFF020525)
// //                                                       .withOpacity(0.4),
// //                                                   shape: RoundedRectangleBorder(
// //                                                     side: BorderSide(
// //                                                         width: 1,
// //                                                         color:
// //                                                             Color(0xFFFFB700)),
// //                                                     borderRadius:
// //                                                         BorderRadius.circular(
// //                                                             18),
// //                                                   )),
// //                                               child: Row(
// //                                                 mainAxisAlignment:
// //                                                     MainAxisAlignment
// //                                                         .spaceEvenly,
// //                                                 children: [
// //                                                   Image(
// //                                                       image: AssetImage(
// //                                                           "asset/image/coin.png"),
// //                                                       height: ScreenSize
// //                                                               .horizontalBlockSize! *
// //                                                           4),
// //                                                   Text(
// //                                                     '2000',
// //                                                     style: GoogleFonts.montserrat(
// //                                                         fontWeight:
// //                                                             FontWeight.w500,
// //                                                         color: Colors.white,
// //                                                         fontSize: ScreenSize
// //                                                                 .horizontalBlockSize! *
// //                                                             3.2),
// //                                                   )
// //                                                 ],
// //                                               ),
// //                                             ),
// //                                           ),
// //                                           SizedBox(
// //                                             width: ScreenSize.fSize_10(),
// //                                           )
// //                                         ],
// //                                       ),
// //                                       Container(
// //                                         height:
// //                                             ScreenSize.horizontalBlockSize! *
// //                                                 18,
// //                                         width: double.infinity,
// //                                         decoration: BoxDecoration(
// //                                             color: Color(0xff000000)
// //                                                 .withOpacity(0.6),
// //                                             borderRadius: BorderRadius.only(
// //                                                 bottomRight:
// //                                                     Radius.circular(10),
// //                                                 bottomLeft:
// //                                                     Radius.circular(10))),
// //                                         child: Stack(
// //                                           children: [
// //                                             Row(
// //                                               children: [
// //                                                 SizedBox(
// //                                                     width:
// //                                                         ScreenSize.fSize_10()),
// //                                                 Column(
// //                                                   crossAxisAlignment:
// //                                                       CrossAxisAlignment.start,
// //                                                   children: [
// //                                                     SizedBox(
// //                                                         height: ScreenSize
// //                                                             .fSize_10()),
// //                                                     Container(
// //                                                       width: ScreenSize
// //                                                               .horizontalBlockSize! *
// //                                                           60,
// //                                                       child: Text(
// //                                                           '${NOT2.value[0].mods![index].title}',
// //                                                           overflow: TextOverflow
// //                                                               .ellipsis,
// //                                                           style: GoogleFonts
// //                                                               .montserrat(
// //                                                             color: Colors.white,
// //                                                             fontSize: ScreenSize
// //                                                                     .horizontalBlockSize! *
// //                                                                 3.5,
// //                                                             fontWeight:
// //                                                                 FontWeight.w500,
// //                                                           )),
// //                                                     ),
// //                                                     SizedBox(
// //                                                         height: ScreenSize
// //                                                             .fSize_10()),
// //                                                     Row(
// //                                                       children: [
// //                                                         controllerlikedownlod.getText(
// //                                                             "asset/image/icon/like.png",
// //                                                             5.5,
// //                                                             '${NumberFormat.compact().format(Vnum)}',
// //                                                             3.5),
// //                                                         SizedBox(
// //                                                             width: ScreenSize
// //                                                                 .fSize_12()),
// //                                                         controllerlikedownlod.getText(
// //                                                             "asset/image/icon/download.png",
// //                                                             5.5,
// //                                                             '${NumberFormat.compact().format(Dnum)}',
// //                                                             3.5),
// //                                                       ],
// //                                                     )
// //                                                   ],
// //                                                 ),
// //                                               ],
// //                                             ),
// //                                           ],
// //                                         ),
// //                                       )
// //                                     ],
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ),
// //                 )),
// //     );
// //   }
// //
// //   Widget buildUsers2() {
// //     return Obx(
// //       () => Padding(
// //           padding: const EdgeInsets.all(12),
// //           child: NOT2.value.isEmpty
// //               ? const Center(
// //                   child: CircularProgressIndicator(color: Color(0xff78CFCA)))
// //               : Container(
// //                   height: ScreenSize.horizontalBlockSize! * 55,
// //                   width: double.infinity,
// //                   child: Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: ListView.builder(
// //                       physics: BouncingScrollPhysics(),
// //                       shrinkWrap: true,
// //                       itemCount: NOT2.value[0].mods!.length,
// //                       scrollDirection: Axis.horizontal,
// //                       itemBuilder: (context, index) {
// //                         final Dnum =
// //                             int.parse(NOT2.value[0].mods![index].downloads!);
// //                         final Vnum =
// //                             int.parse(NOT2.value[0].mods![index].views!);
// //                         final Lnum =
// //                             int.parse(NOT2.value[0].mods![index].likes!);
// //                         return GestureDetector(
// //                           onTap: () {
// //                             LOAD.value = true;
// //                             fetchUsers2();
// //                             Chek();
// //                             downlod(index);
// //                             CLICK.value = NOT2.value[0].mods![index].screens!;
// //                             Game2.value = {
// //                               "IMAGE": NOT2.value[0].mods![index].id,
// //                               "DOWNLOD": NumberFormat.compact().format(Dnum),
// //                               "LIKE": NumberFormat.compact().format(Vnum),
// //                               "VIEW": NumberFormat.compact().format(Lnum),
// //                               "DISCRIP": NOT2.value[0].mods![index].description,
// //                               "DOWNLODFILE":
// //                                   NOT2.value[0].mods![index].files![0].url,
// //                               "TITAL": NOT2.value[0].mods![index].title,
// //                               "ID": NOT2.value[0].mods![index].id,
// //                               "VEROSN":
// //                                   NOT2.value[0].mods![index].versions![0].code,
// //                               "SCREEN": NOT2.value[0].mods![index].screens
// //                             };
// //                             final position =
// //                                 scrollController.position.minScrollExtent;
// //                             scrollController.animateTo(position,
// //                                 duration: const Duration(milliseconds: 300),
// //                                 curve: Curves.linear);
// //                           },
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(5.5),
// //                             child: Container(
// //                               width: ScreenSize.horizontalBlockSize! * 65,
// //                               decoration: BoxDecoration(
// //                                 borderRadius:
// //                                     BorderRadius.all(Radius.circular(10)),
// //                               ),
// //                               child: Stack(
// //                                 children: [
// //                                   Container(
// //                                     height: double.infinity,
// //                                     width: double.infinity,
// //                                     child: ClipRRect(
// //                                       borderRadius:
// //                                           BorderRadius.all(Radius.circular(10)),
// //                                       child: CachedNetworkImage(
// //                                         imageUrl:
// //                                             "http://owlsup.ru/main_catalog/mods/${NOT2.value[0].mods![index].id}/screens/s1.jpg",
// //                                         fit: BoxFit.cover,
// //                                         placeholder: (context, url) =>
// //                                             Container(
// //                                           height:
// //                                               ScreenSize.horizontalBlockSize! *
// //                                                   45,
// //                                           child: Center(
// //                                             child: SizedBox(
// //                                                 height: ScreenSize.fSize_30(),
// //                                                 width: ScreenSize.fSize_30(),
// //                                                 child: Center(
// //                                                     child:
// //                                                         CircularProgressIndicator(
// //                                                   color:
// //                                                       const Color(0xff78CFCA),
// //                                                   strokeWidth: ScreenSize
// //                                                           .horizontalBlockSize! *
// //                                                       0.8,
// //                                                 ))),
// //                                           ),
// //                                         ),
// //                                         errorWidget: (context, url, error) =>
// //                                             Container(
// //                                                 height: ScreenSize
// //                                                         .horizontalBlockSize! *
// //                                                     45,
// //                                                 child: const Center(
// //                                                     child: Icon(Icons.error))),
// //                                       ),
// //                                     ),
// //                                   ),
// //                                   Column(
// //                                     mainAxisAlignment:
// //                                         MainAxisAlignment.spaceBetween,
// //                                     children: [
// //                                       Row(
// //                                         mainAxisAlignment:
// //                                             MainAxisAlignment.end,
// //                                         children: [
// //                                           Padding(
// //                                             padding: EdgeInsets.only(
// //                                                 top: ScreenSize.fSize_6()),
// //                                             child: Container(
// //                                               width: ScreenSize
// //                                                       .horizontalBlockSize! *
// //                                                   19,
// //                                               height: ScreenSize.fSize_28(),
// //                                               decoration: ShapeDecoration(
// //                                                   color: Color(0xFF020525)
// //                                                       .withOpacity(0.4),
// //                                                   shape: RoundedRectangleBorder(
// //                                                     side: BorderSide(
// //                                                         width: 1,
// //                                                         color:
// //                                                             Color(0xFFFFB700)),
// //                                                     borderRadius:
// //                                                         BorderRadius.circular(
// //                                                             18),
// //                                                   )),
// //                                               child: Row(
// //                                                 mainAxisAlignment:
// //                                                     MainAxisAlignment
// //                                                         .spaceEvenly,
// //                                                 children: [
// //                                                   Image(
// //                                                       image: AssetImage(
// //                                                           "asset/image/coin.png"),
// //                                                       height: ScreenSize
// //                                                               .horizontalBlockSize! *
// //                                                           4),
// //                                                   Text(
// //                                                     '2000',
// //                                                     style: GoogleFonts.montserrat(
// //                                                         fontWeight:
// //                                                             FontWeight.w500,
// //                                                         color: Colors.white,
// //                                                         fontSize: ScreenSize
// //                                                                 .horizontalBlockSize! *
// //                                                             3.2),
// //                                                   )
// //                                                 ],
// //                                               ),
// //                                             ),
// //                                           ),
// //                                           SizedBox(
// //                                             width: ScreenSize.fSize_10(),
// //                                           )
// //                                         ],
// //                                       ),
// //                                       Container(
// //                                         height:
// //                                             ScreenSize.horizontalBlockSize! *
// //                                                 18,
// //                                         width: double.infinity,
// //                                         decoration: BoxDecoration(
// //                                             color: Color(0xff000000)
// //                                                 .withOpacity(0.6),
// //                                             borderRadius: BorderRadius.only(
// //                                                 bottomRight:
// //                                                     Radius.circular(10),
// //                                                 bottomLeft:
// //                                                     Radius.circular(10))),
// //                                         child: Stack(
// //                                           children: [
// //                                             Row(
// //                                               children: [
// //                                                 SizedBox(
// //                                                     width:
// //                                                         ScreenSize.fSize_10()),
// //                                                 Column(
// //                                                   crossAxisAlignment:
// //                                                       CrossAxisAlignment.start,
// //                                                   children: [
// //                                                     SizedBox(
// //                                                         height: ScreenSize
// //                                                             .fSize_10()),
// //                                                     Container(
// //                                                       width: ScreenSize
// //                                                               .horizontalBlockSize! *
// //                                                           60,
// //                                                       child: Text(
// //                                                           '${NOT2.value[0].mods![index].title}',
// //                                                           overflow: TextOverflow
// //                                                               .ellipsis,
// //                                                           style: GoogleFonts
// //                                                               .montserrat(
// //                                                             color: Colors.white,
// //                                                             fontSize: ScreenSize
// //                                                                     .horizontalBlockSize! *
// //                                                                 3.5,
// //                                                             fontWeight:
// //                                                                 FontWeight.w500,
// //                                                           )),
// //                                                     ),
// //                                                     SizedBox(
// //                                                         height: ScreenSize
// //                                                             .fSize_10()),
// //                                                     Row(
// //                                                       children: [
// //                                                         controllerlikedownlod.getText(
// //                                                             "asset/image/icon/like.png",
// //                                                             5.5,
// //                                                             '${NumberFormat.compact().format(Vnum)}',
// //                                                             3.5),
// //                                                         SizedBox(
// //                                                             width: ScreenSize
// //                                                                 .fSize_12()),
// //                                                         controllerlikedownlod.getText(
// //                                                             "asset/image/icon/download.png",
// //                                                             5.5,
// //                                                             '${NumberFormat.compact().format(Dnum)}',
// //                                                             3.5),
// //                                                       ],
// //                                                     )
// //                                                   ],
// //                                                 ),
// //                                               ],
// //                                             ),
// //                                           ],
// //                                         ),
// //                                       )
// //                                     ],
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ),
// //                 )),
// //     );
// //   }
// // }
// //
// // final controllerdata = Get.put(datacontroller());
// //
// // class datacontroller extends GetxController {
// //   getText(width, text) {
// //     return Container(
// //       width: ScreenSize.horizontalBlockSize! * width,
// //       height: 34,
// //       decoration: ShapeDecoration(
// //         color: Color(0xFF020525),
// //         shape: RoundedRectangleBorder(
// //           borderRadius: BorderRadius.circular(17),
// //         ),
// //       ),
// //       child: Center(
// //         child: controllertext.getText(text, FontWeight.w500, 3.2),
// //       ),
// //     );
// //   }
// // }
// //
// // final controllerdownlod = Get.put(controllerDownlod());
// //
// // class controllerDownlod extends GetxController {
// //   getContain(TEXT) {
// //     return Container(
// //         // width: ScreenSize.horizontalBlockSize! * 20,
// //         height: ScreenSize.horizontalBlockSize! * 12,
// //         decoration: BoxDecoration(
// //             borderRadius: BorderRadius.circular(10),
// //             color: const Color(0xff78CFCA),
// //             border: Border.all(color: const Color(0xff78CFCA))),
// //         child: Center(
// //           child: Text(
// //             TEXT,
// //             style: GoogleFonts.archivo(
// //                 color: Colors.white,
// //                 fontSize: ScreenSize.fSize_15(),
// //                 fontWeight: FontWeight.w600),
// //           ),
// //         ));
// //   }
// // }
// //
// // final controllerlikecomentsmall = Get.put(LIKECOMENTSMALL());
// //
// // class LIKECOMENTSMALL extends GetxController {
// //   getText(IMAGE, TEXT) {
// //     return Container(
// //       child: Row(
// //         children: [
// //           Image(image: AssetImage(IMAGE)),
// //           SizedBox(width: ScreenSize.fSize_4()),
// //           controllertext.getText(TEXT, FontWeight.w500, 4)
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // final controllerlikecoment = Get.put(LIKECOMENT());
// // final controllerlikecomentbig = Get.put(LIKECOMENTBIG());
// //
// // class LIKECOMENT extends GetxController {
// //   getText(IMAGE, TEXT) {
// //     return Container(
// //       child: Row(
// //         children: [
// //           Image(image: AssetImage(IMAGE)),
// //           SizedBox(width: ScreenSize.fSize_4()),
// //           controllertext.getText(TEXT, FontWeight.w500, 4)
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // class LIKECOMENTBIG extends GetxController {
// //   getText(IMAGE, TEXT) {
// //     return Container(
// //       child: Row(
// //         children: [
// //           Image(image: AssetImage(IMAGE)),
// //           SizedBox(width: ScreenSize.fSize_4()),
// //           controllertext.getText(TEXT, FontWeight.w500, 4)
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // // var uuid = Uuid();
// // //
// // // void _go() async {
// // //   Map<String, dynamic> a = {
// // //     "format_version": 1,
// // //     "header": {
// // //       "description": "${skin!.title}",
// // //       "name": "${skin!.title}",
// // //       "uuid": "${uuid.v1()}",
// // //       "version": [0, 0, 1],
// // //       "min_engine_version": [1, 2, 0]
// // //     },
// // //     "modules": [
// // //       {
// // //         "description": "${skin!.title}",
// // //         "type": "skin_pack",
// // //         "uuid": "${uuid.v1()}",
// // //         "version": [0, 0, 1]
// // //       }
// // //     ]
// // //   };
// // //
// // //   Map<String, dynamic> b = {
// // //     "skins": [
// // //       {
// // //         "localization_name": "${skin!.title}",
// // //         "geometry": "geometry.humanoid.custom",
// // //         "texture": "${skin!.title}.png",
// // //         "type": "free"
// // //       }
// // //     ],
// // //     "serialize_name": "${skin!.title}",
// // //     "localization_name": "${skin!.title}"
// // //   };
// // //
// // //   final Directory? directory = await getExternalStorageDirectory();
// // //   final File file =
// // //   File('${directory!.path}/MCPE/Skins/file ${skin!.title}/manifest.json');
// // //   final File file1 =
// // //   File('${directory.path}/MCPE/Skins/file ${skin!.title}/skins.json');
// // //   await file.writeAsString(json.encode(a));
// // //   await file1.writeAsString(json.encode(b));
// // //   zip();
// // // }
// // //
// // // Future<void> zip() async {
// // //   Directory? appDocDirectory = await getExternalStorageDirectory();
// // //   var encoder = ZipFileEncoder();
// // //   encoder.create(
// // //       "${appDocDirectory!.path}/MCPE/Skins/" + '${skin!.title}.mcpack');
// // //   encoder.addFile(File(
// // //       '${appDocDirectory.path}/MCPE/Skins/file ${skin!.title}/manifest.json'));
// // //   encoder.addFile(File(
// // //       '${appDocDirectory.path}/MCPE/Skins/file ${skin!.title}/skins.json'));
// // //   encoder.addFile(File(
// // //       '${appDocDirectory.path}/MCPE/Skins/file ${skin!.title}/${skin!.title}.png'));
// // //   encoder.close();
// // // }
// //
// // // var uuid = Uuid();
// // //
// // // void _go() async {
// // //   try {
// // //     Map<String, dynamic> a = {
// // //       "format_version": 1,
// // //       "header": {
// // //         "description": "${abc[2]}",
// // //         "name": "${abc[2]}",
// // //         "uuid": "${uuid.v1()}",
// // //         "version": [0, 0, 1],
// // //         "min_engine_version": [1, 2, 0]
// // //       },
// // //       "modules": [
// // //         {
// // //           "description": "${abc[2]}",
// // //           "type": "skin_pack",
// // //           "uuid": "${uuid.v1()}",
// // //           "version": [0, 0, 1]
// // //         }
// // //       ]
// // //     };
// // //
// // //     Map<String, dynamic> b = {
// // //       "skins": [
// // //         {
// // //           "localization_name": "${abc[2]}",
// // //           "geometry": "geometry.humanoid.custom",
// // //           "texture": "${abc[2]}.png",
// // //           "type": "free"
// // //         }
// // //       ],
// // //       "serialize_name": "${abc[2]}",
// // //       "localization_name": "${abc[2]}"
// // //     };
// // //
// // //     final Directory? directory = await getExternalStorageDirectory();
// // //     // final File manifestFile = File(
// // //     //     '${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/manifest.json');
// // //     // final File skinsFile = File(
// // //     //     '${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/skins.json');
// // //     // await manifestFile.writeAsString(json.encode(a));
// // //     // await skinsFile.writeAsString(json.encode(b));
// // //     await zip();
// // //   } catch (e) {
// // //     print('Error in _go(): $e');
// // //   }
// // // }
// // //
// // // Future<void> zip() async {
// // //   try {
// // //     Directory? appDocDirectory = await getExternalStorageDirectory();
// // //     var encoder = ZipFileEncoder();
// // //     encoder.create(
// // //         "${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/${abc[2]}.mcpack");
// // //     // encoder.addFile(File(
// // //     //     '${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/manifest.json'));
// // //     // encoder.addFile(File(
// // //     //     '${'/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}'}${abc[2]}/skins.json'));
// // //     // encoder.addFile(File(
// // //     //     '${'/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}'}${abc[2]}/${abc[2]}.jpg'));
// // //     encoder.create("${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/${abc[2]}.zip");
// // //
// // //     // await _downloadImage(
// // //     //   LOAD.value == true
// // //     //       ? Game2.value['IMAGE']
// // //     //       : Selected.value == true
// // //     //           ? "http://owlsup.ru/main_catalog/${abc[1]}/${abc[3]}/screens/s1.jpg"
// // //     //           : "http://owlsup.ru/main_catalog/mods/${abc[0]}/screens/s1.jpg",
// // //     //   "${'/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}'}${abc[2]}/${abc[2]}.jpg",
// // //     // );
// // //     encoder.close();
// // //   } catch (e) {
// // //     print('Error in zip(): $e');
// // //   }
// // // }
// // //
// // //
// // // Future<void> _downloadImage(String imageurl, String savePath) async {
// // //   final response = await http.get(Uri.parse(LOAD.value == true
// // //       ? Game2.value['IMAGE']
// // //       : Selected.value == true
// // //       ? "http://owlsup.ru/main_catalog/${abc[1]}/${abc[3]}/screens/s1.jpg"
// // //       : "http://owlsup.ru/main_catalog/mods/${abc[0]}/screens/s1.jpg"));
// // //   if (response.statusCode == 200) {
// // //     File(savePath).writeAsBytesSync(response.bodyBytes);
// // //   } else {
// // //     throw Exception('Failed to download image: ${response.statusCode}');
// // //   }
// // // }
// // //
// // // Future<void> openFile2() async {
// // //   var filePath =
// // //       '${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/${abc[2]}.mcpack';
// // //   // '${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${LOAD.value == true ? Game2.value['TITAL'] : Selected.value == false ? abc[1] : abc[2]}/${LOAD.value == true ? Game2.value['TITAL'] : Selected.value == false ? abc[1] : abc[2]}.mcpack';
// // //   final _result = await OpenFile.open(filePath, type: "*/*");
// // //   print(_result.message);
// // //
// // //   _openResult.value = "type=${_result.type}  message=${_result.message}";
// // // }
// import 'dart:convert';
// import 'dart:io';
// import 'dart:math';
//
// import 'package:archive/archive_io.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:dio/dio.dart';
// import 'package:external_path/external_path.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:uuid/uuid.dart';
//
// import '../Controller/Back controller.dart';
// import '../Controller/Google_Ads.dart';
// import '../DBFile/DbHelper.dart';
// import '../DBFile/notes.dart';
// import '../Media_qury/Media.dart';
// import '../Model_class/class2.dart';
// import '../Widget Controller/Controller.dart';
// import '../model_Class/clkass.dart';
// import 'Screen/Home Screen.dart';
//
// // String imageUrl =
// //     "http://owlsup.ru/main_catalog/maps/1933/files/Zombie_apocalypse.mcworl";
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
//   var CLICK = [].obs;
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
//   var DONE = false.obs;
//
//   @override
//   void initState() {
//     GETDAT();
//     dBhelper = DBhelper();
//     loadData();
//     imageUrl.value = Selected.value == true
//         ? "http://owlsup.ru/main_catalog/${abc[1]}/${abc[3]}/files/${abc[8]}"
//         : LOAD.value == true
//             ? "http://owlsup.ru/main_catalog/mods/${Game2.value['ID']}/files/${Game2.value["DOWNLODFILE"]}"
//             : "http://owlsup.ru/main_catalog/mods/${abc[0]}/files/${abc[6]}";
//
//     fetchUsers2().then((value) {
//       NOT2.value.addAll(value);
//     });
//     super.initState();
//     Chek();
//     print('LLLLLLLLLL${"${imageUrl}"}');
//   }
//
//   GETDAT() async {
//     var prefs = await SharedPreferences.getInstance();
//     DONE.value = (await prefs.getBool("BOOL"))!;
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
//   var uuid = Uuid();
//
//   void _go() async {
//     try {
//       Map<String, dynamic> a = {
//         "format_version": 1,
//         "header": {
//           "description": "${abc[2]}",
//           "name": "${abc[2]}",
//           "uuid": "${uuid.v1()}",
//           "version": [0, 0, 1],
//           "min_engine_version": [1, 2, 0]
//         },
//         "modules": [
//           {
//             "description": "${abc[2]}",
//             "type": "skin_pack",
//             "uuid": "${uuid.v1()}",
//             "version": [0, 0, 1]
//           }
//         ]
//       };
//
//       Map<String, dynamic> b = {
//         "skins": [
//           {
//             "localization_name": "${abc[2]}",
//             "geometry": "geometry.humanoid.custom",
//             "texture": "${abc[2]}.png",
//             "type": "free"
//           }
//         ],
//         "serialize_name": "${abc[2]}",
//         "localization_name": "${abc[2]}"
//       };
//       Map<String, dynamic> c = {
//         "format_version": 1,
//         "header": {
//           "description": "${abc[2]}",
//           "name": "${abc[2]}",
//           "uuid": "${uuid.v1()}",
//           "version": [0, 0, 1],
//           "min_engine_version": [1, 2, 0]
//         },
//         "modules": [
//           {
//             "description": "${abc[2]}",
//             "type": "skin_pack",
//             "uuid": "${uuid.v1()}",
//             "version": [0, 0, 1]
//           }
//         ]
//       };
//
//       await _downloadImage(
//         LOAD.value == true
//             ? Game2.value['IMAGE']
//             : Selected.value == true
//                 ? "http://owlsup.ru/main_catalog/${abc[1]}/${abc[3]}/screens/s1.jpg"
//                 : "http://owlsup.ru/main_catalog/mods/${abc[0]}/screens/s1.jpg",
//         "${'/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}'}${abc[2]}/${abc[2]}.jpg",
//       );
//       final Directory? directory = await getExternalStorageDirectory();
//       final File manifestFile = File(
//           '${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/manifest.json');
//       final File skinsFile = File(
//           '${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/skins.json');
//       final File ImageFile = File(
//           '${'/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}'}${abc[2]}/${abc[2]}.jpg');
//       final File packFile = File(
//           '${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/${abc[2]}.macpack');
//       await manifestFile.writeAsString(json.encode(a));
//       await skinsFile.writeAsString(json.encode(b));
//       // await ImageFile.writeAsString(json.encode(c));
//       await packFile.writeAsString(json.encode(b));
//       await zip();
//     } catch (e) {
//       print('Error in _go(): $e');
//     }
//   }
//
//   Future<void> zip() async {
//     try {
//       Directory? appDocDirectory = await getExternalStorageDirectory();
//       var encoder = ZipFileEncoder();
//       encoder.create(
//           "${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/${abc[2]}.macpack.zip");
//       encoder.addFile(File(
//           '${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/manifest.json'));
//       // encoder.addFile(File(
//       //     '${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/${abc[2]}.macpack'));
//       encoder.addFile(File(
//           '${'/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}'}${abc[2]}/skins.json'));
//       encoder.addFile(File(
//           '${'/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}'}${abc[2]}/${abc[2]}.jpg'));
//       // encoder.create("${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/${abc[2]}.zip");
//
//       await _downloadImage(
//         LOAD.value == true
//             ? Game2.value['IMAGE']
//             : Selected.value == true
//                 ? "http://owlsup.ru/main_catalog/${abc[1]}/${abc[3]}/screens/s1.jpg"
//                 : "http://owlsup.ru/main_catalog/mods/${abc[0]}/screens/s1.jpg",
//         "${'/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}'}${abc[2]}/${abc[2]}.jpg",
//       );
//       encoder.close();
//     } catch (e) {
//       print('Error in zip(): $e');
//     }
//   }
//
//   Future<void> _downloadImage(String imageurl, String savePath) async {
//     final response = await http.get(Uri.parse(LOAD.value == true
//         ? Game2.value['IMAGE']
//         : Selected.value == true
//             ? "http://owlsup.ru/main_catalog/${abc[1]}/${abc[3]}/screens/s1.jpg"
//             : "http://owlsup.ru/main_catalog/mods/${abc[0]}/screens/s1.jpg"));
//     if (response.statusCode == 200) {
//       File(savePath).writeAsBytesSync(response.bodyBytes);
//     } else {
//       throw Exception('Failed to download image: ${response.statusCode}');
//     }
//   }
//
//   Future<void> openFile2() async {
//     var filePath =
//         '${"/storage/emulated/0/Download/Download/${imageUrl.value.split("/").last}"}${abc[2]}/${abc[2]}.macpack.zip';
//     final _result = await OpenFile.open(filePath, type: "*/*");
//     print(_result.message);
//
//     _openResult.value = "type=${_result.type}  message=${_result.message}";
//   }
//
// //=============================================================================================================
//
//   @override
//   Widget build(BuildContext context) {
//     print('--------------------------${abc[1]}');
//     final Dnum =
//         int.parse(Selected.value == true ? abc[4].downloads : abc[2].downloads);
//     // final Vnum = int.parse(Selected.value == true ? 0 : abc[9]);
//     final Lnum =
//         int.parse(Selected.value == true ? abc[4].likes! : abc[2].likes);
//     ScreenSize.sizerInit(context);
//     // final Dnum = int.parse(abc[4].downloads);
//     return WillPopScope(
//       onWillPop: () => backbuttoncontroller.showBackbuttonad(
//           context, '/Transport_Addon', ''),
//       child: Scaffold(
//           backgroundColor: Color(0xFF0D1129),
//           appBar: controllerMainapp.getText(() {
//             backbuttoncontroller.showBackbuttonad(
//                 context, '/Transport_Addon', '');
//           },
//               7.5,
//               "asset/image/icon/Arrow back ios.png",
//               Obx(() => Text(
//                   "${LOAD.value == true ? Game2.value['TITAL'] : Selected.value == true ? abc[2] : abc[1]}")),
//               "200",
//               3.8),
//           body: Stack(
//             children: [
//               SingleChildScrollView(
//                 controller: scrollController,
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Center(
//                     //   child: ElevatedButton(
//                     //       onPressed: () {
//                     //         // zip();
//                     //         // _go();
//                     //         showSnackBar();
//                     //       },
//                     //       child: Text('data')),
//                     // ),
//                     Center(
//                       child: ElevatedButton(
//                           onPressed: () {
//                             zip();
//                             _go();
//                           },
//                           child: Text('data')),
//                     ),
//                     // Center(
//                     //   child: ElevatedButton(
//                     //       onPressed: () {
//                     //         _createAndAddToZip();
//                     //       },
//                     //       child: Text('data')),
//                     // ),
//
//                     GestureDetector(
//                         onTap: () => openFile2(),
//                         child: controllerBlueContainer.getText(
//                             93, 12.4, 1.5, "Open", 4)),
//                     SizedBox(width: ScreenSize.fSize_10()),
//                     Padding(
//                       padding: const EdgeInsets.all(10),
//                       child: Container(
//                         width: double.infinity,
//                         height: ScreenSize.horizontalBlockSize! * 55,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                         ),
//                         child: Stack(
//                           children: [
//                             Obx(
//                               () => Container(
//                                 height: double.infinity,
//                                 width: double.infinity,
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(20),
//                                   child: CachedNetworkImage(
//                                     imageUrl: LOAD.value == true
//                                         ? Game2.value['IMAGE']
//                                         : Selected.value == true
//                                             ? "http://owlsup.ru/main_catalog/${abc[1]}/${abc[3]}/screens/s1.jpg"
//                                             : "http://owlsup.ru/main_catalog/mods/${abc[0]}/screens/s1.jpg",
//                                     fit: BoxFit.cover,
//                                     placeholder: (context, url) => SizedBox(
//                                         height: ScreenSize.fSize_50(),
//                                         width: ScreenSize.fSize_50(),
//                                         child: const Center(
//                                             child: CircularProgressIndicator(
//                                           color: Color(0xff78CFCA),
//                                         ))),
//                                     errorWidget: (context, url, error) =>
//                                         const Icon(Icons.error,
//                                             color: Color(0xFF9293B5)),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(20),
//                               child: FutureBuilder(
//                                 future: dbHelper.getNotesList(),
//                                 builder: (context, snapshot) {
//                                   for (int i = 0;
//                                       i < snapshot.data!.length;
//                                       i++) {
//                                     TEXTLIST.value.add(snapshot.data![i].text);
//                                   }
//                                   return Obx(
//                                     () => GestureDetector(
//                                         onTap: () async {
//                                           if (TEXTLIST.value
//                                               .contains(LOAD.value == true
//                                                   ? Game2.value['TITAL']
//                                                   : Selected.value == true
//                                                       ? abc[2]
//                                                       : abc[1])) {
//                                             dBhelper!.delet(LOAD.value == true
//                                                 ? Game2.value['TITAL']
//                                                 : Selected.value == true
//                                                     ? abc[2]
//                                                     : abc[1]);
//                                           } else {
//                                             dBhelper!
//                                                 .insert(NotesModel(
//                                               text: LOAD.value == true
//                                                   ? Game2.value['TITAL']
//                                                   : Selected.value == true
//                                                       ? abc[2]
//                                                       : abc[1],
//                                               image: LOAD.value == true
//                                                   ? Game2.value['IMAGE']
//                                                   : Selected.value == true
//                                                       ? "http://owlsup.ru/main_catalog/${abc[1]}/${abc[3]}/screens/s1.jpg"
//                                                       : "http://owlsup.ru/main_catalog/mods/${abc[0]}/screens/s1.jpg",
//                                             ))
//                                                 .then((value) {
//                                               print("data added");
//                                             }).onError((error, stackTrace) {
//                                               print(
//                                                   '--------------------------${error.toString()}');
//                                             });
//                                           }
//                                         },
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.end,
//                                           children: [
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.end,
//                                               children: [
//                                                 Center(
//                                                   child: Container(
//                                                     width: ScreenSize
//                                                             .horizontalBlockSize! *
//                                                         12,
//                                                     height: ScreenSize
//                                                             .horizontalBlockSize! *
//                                                         12,
//                                                     decoration: ShapeDecoration(
//                                                       image: DecorationImage(
//                                                           image: AssetImage(TEXTLIST
//                                                                   .value
//                                                                   .contains(LOAD
//                                                                               .value ==
//                                                                           true
//                                                                       ? Game2
//                                                                               .value[
//                                                                           'TITAL']
//                                                                       : Selected.value ==
//                                                                               true
//                                                                           ? abc[
//                                                                               2]
//                                                                           : abc[
//                                                                               1])
//                                                               ? "asset/image/icon/like.png"
//                                                               : "asset/image/icon/like_1.png"),
//                                                           scale: 2.5),
//                                                       color: Color(0x7702E1FB),
//                                                       shape: OvalBorder(),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         )),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     // SizedBox(height: ScreenSize.fSize_13()),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         controllerlikedownlod.getText(
//                             "asset/image/icon/file.png",
//                             6.5,
//                             '${LOAD.value == true ? Game2.value['VEROSN'] : Selected.value == true ? abc[6] : abc[9]}',
//                             3.5),
//                         controllerlikedownlod.getText(
//                             "asset/image/icon/like.png",
//                             6.5,
//                             '${LOAD.value == true ? Game2.value['LIKE'] : Lnum}',
//                             3.5),
//                         controllerlikedownlod.getText(
//                             "asset/image/icon/download.png",
//                             6.5,
//                             '${LOAD.value == true ? Game2.value['DOWNLOD'] : Dnum}',
//                             3.5),
//                       ],
//                     ),
//                     SizedBox(height: ScreenSize.fSize_20()),
//                     Padding(
//                       padding: EdgeInsets.only(left: ScreenSize.fSize_15()),
//                       child: Container(
//                         width: ScreenSize.fSize_70(),
//                         height: ScreenSize.fSize_34(),
//                         decoration: ShapeDecoration(
//                           color: Color(0xFF020525),
//                           shape: RoundedRectangleBorder(
//                             side:
//                                 BorderSide(width: 1, color: Color(0xFF02E1FB)),
//                             borderRadius: BorderRadius.circular(17),
//                           ),
//                         ),
//                         child: Center(
//                           child: controllertext.getText(
//                               'Tag', FontWeight.w500, 3.8),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: ScreenSize.fSize_15()),
//                     Row(
//                       children: [
//                         SizedBox(width: ScreenSize.horizontalBlockSize! * 3),
//                         controllerdata.getText(25, "Blocks"),
//                         SizedBox(width: ScreenSize.horizontalBlockSize! * 3),
//                         controllerdata.getText(27, "Zombies"),
//                         SizedBox(width: ScreenSize.horizontalBlockSize! * 3),
//                         controllerdata.getText(29, "Add-ons"),
//                       ],
//                     ),
//                     SizedBox(height: ScreenSize.fSize_10()),
//                     Obx(
//                       () => Padding(
//                         padding: EdgeInsets.only(left: ScreenSize.fSize_15()),
//                         child: controllertext.getText(
//                             """${LOAD.value == true ? Game2.value['DISCRIP'] : Selected.value == true ? abc[5] : abc[8]}""",
//                             FontWeight.w500,
//                             3.5),
//                       ),
//                     ),
//                     SizedBox(height: ScreenSize.fSize_20()),
//                     abc[1] == 'seeds'
//                         ? Center(
//                             child: GestureDetector(
//                                 onTap: () {
//                                   Clipboard.setData(
//                                       ClipboardData(text: "${abc[9].key}"));
//                                   Fluttertoast.showToast(
//                                     msg: "Copy",
//                                     toastLength: Toast.LENGTH_SHORT,
//                                     timeInSecForIosWeb: 3,
//                                     textColor: Colors.white,
//                                     gravity: ToastGravity.SNACKBAR,
//                                     backgroundColor: Color(0xFF174AA7),
//                                     fontSize: 15,
//                                   );
//                                   // doDownload();
//                                 },
//                                 child: controllerBlueContainer.getText(
//                                     93, 12.4, 1.5, "Copy", 4)),
//                           )
//                         : Obx(
//                             () => DONE.value == false
//                                 ? Stack(
//                                     children: [
//                                       GestureDetector(
//                                         onTap: () {
//                                           showDialog(
//                                               context: context,
//                                               builder: (BuildContext context) {
//                                                 return Dialog(
//                                                   backgroundColor:
//                                                       Colors.transparent,
//                                                   shape: RoundedRectangleBorder(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20.0)),
//                                                   //this right here
//                                                   child: Container(
//                                                     height: ScreenSize
//                                                             .horizontalBlockSize! *
//                                                         45,
//                                                     width: ScreenSize
//                                                             .horizontalBlockSize! *
//                                                         80,
//                                                     decoration: ShapeDecoration(
//                                                       color: Color(0xFF020525),
//                                                       shape:
//                                                           RoundedRectangleBorder(
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(13),
//                                                       ),
//                                                       shadows: [
//                                                         BoxShadow(
//                                                           color:
//                                                               Color(0xFF676EB8),
//                                                           blurRadius: 4,
//                                                           offset: Offset(0, 0),
//                                                           spreadRadius: 0,
//                                                         )
//                                                       ],
//                                                     ),
//                                                     child: Column(
//                                                       children: [
//                                                         SizedBox(
//                                                             height: ScreenSize
//                                                                     .horizontalBlockSize! *
//                                                                 5),
//                                                         Row(
//                                                           children: [
//                                                             SizedBox(
//                                                                 width: ScreenSize
//                                                                     .fSize_20()),
//                                                             controllertext
//                                                                 .getText(
//                                                                     "Oops",
//                                                                     FontWeight
//                                                                         .w500,
//                                                                     5.5)
//                                                           ],
//                                                         ),
//                                                         SizedBox(
//                                                             height: ScreenSize
//                                                                     .horizontalBlockSize! *
//                                                                 5),
//                                                         Row(
//                                                           children: [
//                                                             SizedBox(
//                                                                 width: ScreenSize
//                                                                     .fSize_20()),
//                                                             controllertext.getText(
//                                                                 "Not enough 200 Coins!",
//                                                                 FontWeight.w400,
//                                                                 4.5)
//                                                           ],
//                                                         ),
//                                                         SizedBox(
//                                                             height: ScreenSize
//                                                                     .horizontalBlockSize! *
//                                                                 9),
//                                                         GestureDetector(
//                                                           onTap: () async {
//                                                             DONE.value = true;
//                                                             var prefs =
//                                                                 await SharedPreferences
//                                                                     .getInstance();
//                                                             await prefs.setBool(
//                                                                 "BOOL",
//                                                                 DONE.value);
//                                                             Navigator.of(
//                                                                     context)
//                                                                 .pop(false);
//                                                           },
//                                                           child:
//                                                               controllerBlueContainer
//                                                                   .getText(
//                                                                       28,
//                                                                       8,
//                                                                       2,
//                                                                       "Get Coins",
//                                                                       3.2),
//                                                         )
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 );
//                                               });
//                                         },
//                                         child: Center(
//                                           child:
//                                               controllerBlueContainer.getText(
//                                                   93,
//                                                   12.4,
//                                                   2,
//                                                   "Unlock For 2000 Coins",
//                                                   4),
//                                         ),
//                                       ),
//                                     ],
//                                   )
//                                 : Center(
//                                     child: Obx(
//                                       () => Column(children: [
//                                         downloading.value
//                                             ? Center(
//                                                 child: Container(
//                                                   height: ScreenSize
//                                                           .horizontalBlockSize! *
//                                                       12.4,
//                                                   width: ScreenSize
//                                                           .horizontalBlockSize! *
//                                                       94,
//                                                   child: LinearPercentIndicator(
//                                                     lineHeight: ScreenSize
//                                                             .horizontalBlockSize! *
//                                                         12.4,
//                                                     width: ScreenSize
//                                                             .horizontalBlockSize! *
//                                                         94,
//                                                     barRadius:
//                                                         const Radius.circular(
//                                                             3),
//                                                     percent: Value.value,
//                                                     center: Text(
//                                                         "${progressString.value}",
//                                                         style:
//                                                             GoogleFonts.archivo(
//                                                                 color: Colors
//                                                                     .white,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w600)),
//                                                     linearStrokeCap:
//                                                         LinearStrokeCap
//                                                             .roundAll,
//                                                     progressColor:
//                                                         const Color(0xFF174AA7),
//                                                   ),
//                                                 ),
//                                               )
//                                             : exits.value == false
//                                                 ? GestureDetector(
//                                                     onTap: () async {
//                                                       doDownload();
//                                                       // zip();
//                                                     },
//                                                     child:
//                                                         controllerBlueContainer
//                                                             .getText(
//                                                                 93,
//                                                                 12.4,
//                                                                 1.5,
//                                                                 "DOWNLOAD",
//                                                                 4))
//                                                 : GestureDetector(
//                                                     onTap: () => openFile(),
//                                                     child:
//                                                         controllerBlueContainer
//                                                             .getText(93, 12.4,
//                                                                 1.5, "Open", 4))
//                                         // exits == true
//                                         //     ? GestureDetector(
//                                         //         onTap: () => openFile(),
//                                         //         child:
//                                         //             controllerBlueContainer.getText(
//                                         //                 93, 12.4, 1.5, "Open", 4))
//                                         //     : downloading.value
//                                         //         ? Center(
//                                         //             child: Container(
//                                         //               height: ScreenSize
//                                         //                       .horizontalBlockSize! *
//                                         //                   12.4,
//                                         //               width: ScreenSize
//                                         //                       .horizontalBlockSize! *
//                                         //                   93,
//                                         //               child: LinearPercentIndicator(
//                                         //                 lineHeight: ScreenSize
//                                         //                         .horizontalBlockSize! *
//                                         //                     12.4,
//                                         //                 barRadius:
//                                         //                     const Radius.circular(3),
//                                         //                 percent: Value.value,
//                                         //                 center: Text(
//                                         //                     "${progressString.value}",
//                                         //                     style:
//                                         //                         GoogleFonts.archivo(
//                                         //                             color:
//                                         //                                 Colors.white,
//                                         //                             fontWeight:
//                                         //                                 FontWeight
//                                         //                                     .w600)),
//                                         //                 linearStrokeCap:
//                                         //                     LinearStrokeCap.roundAll,
//                                         //                 progressColor:
//                                         //                     const Color(0xFF174AA7),
//                                         //               ),
//                                         //             ),
//                                         //           )
//                                         //         : downloadedUrl == ""
//                                         //             ? GestureDetector(
//                                         //                 onTap: () => doDownload(),
//                                         //                 child: controllerBlueContainer
//                                         //                     .getText(93, 12.4, 1.5,
//                                         //                         "DOWNLOAD", 4))
//                                         //             : GestureDetector(
//                                         //                 onTap: () => openFile(),
//                                         //                 child: controllerBlueContainer
//                                         //                     .getText(93, 12.4, 1.5,
//                                         //                         "Open", 4)),
//                                       ]),
//                                     ),
//                                   ),
//                           ),
//                     SizedBox(height: ScreenSize.fSize_20()),
//                     Container(
//                       // height: ScreenSize.fSize_50(),
//                       decoration: ShapeDecoration(
//                         color: Color(0xFF020525),
//                         shape: RoundedRectangleBorder(
//                           side: BorderSide(
//                             width: 1,
//                             strokeAlign: BorderSide.strokeAlignOutside,
//                             color: Color(0xFF9293B5),
//                           ),
//                         ),
//                       ),
//                       child: Obx(
//                         () => Column(
//                           children: [
//                             SizedBox(
//                                 height: ScreenSize.horizontalBlockSize! * 4.5),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       left: ScreenSize.fSize_15()),
//                                   child: Container(
//                                       width:
//                                           ScreenSize.horizontalBlockSize! * 60,
//                                       child: Text(
//                                         "${LOAD.value == true ? Game2.value['DISCRIP'] : Selected.value == true ? abc[2] : abc[1]} - Description",
//                                         overflow: TextOverflow.ellipsis,
//                                         style: GoogleFonts.montserrat(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.w500,
//                                             fontSize: ScreenSize
//                                                     .horizontalBlockSize! *
//                                                 3.6),
//                                       )),
//                                 ),
//                                 SizedBox(width: ScreenSize.fSize_10()),
//                                 GestureDetector(
//                                   onTap: () {
//                                     isShow.value = !isShow.value;
//                                   },
//                                   child: Container(
//                                     width: ScreenSize.horizontalBlockSize! * 28,
//                                     child: Center(
//                                       child: Text(
//                                         "Read ${isShow.value ? "More" : "Less"}",
//                                         style: GoogleFonts.montserrat(
//                                             color: Color(0xFF9293B5),
//                                             fontWeight: FontWeight.w600,
//                                             fontSize: ScreenSize
//                                                     .horizontalBlockSize! *
//                                                 3.8),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             Visibility(
//                               visible: isShow.value,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Container(
//                                   width: double.infinity,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Divider(
//                                         thickness:
//                                             ScreenSize.horizontalBlockSize! *
//                                                 0.12,
//                                         indent: ScreenSize.fSize_6(),
//                                         endIndent: ScreenSize.fSize_10(),
//                                         color: Color(0xFF9293B5),
//                                       ),
//                                       SizedBox(height: ScreenSize.fSize_6()),
//                                       Padding(
//                                         padding: EdgeInsets.only(
//                                             left: ScreenSize.fSize_4()),
//                                         child: Text(
//                                           'IMAGES',
//                                           style: GoogleFonts.montserrat(
//                                               color: Color(0xFF9293B5),
//                                               fontWeight: FontWeight.w600,
//                                               fontSize: ScreenSize.fSize_13()),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                           height:
//                                               ScreenSize.horizontalBlockSize! *
//                                                   2),
//                                       Container(
//                                         height:
//                                             ScreenSize.horizontalBlockSize! *
//                                                 17,
//                                         width: double.infinity,
//                                         child: ListView.builder(
//                                           physics: BouncingScrollPhysics(),
//                                           shrinkWrap: true,
//                                           itemCount: LOAD.value == true
//                                               ? CLICK.value.length
//                                               : Selected.value == true
//                                                   ? abc[7].length
//                                                   : abc[10].length,
//                                           scrollDirection: Axis.horizontal,
//                                           itemBuilder: (context, index) {
//                                             return Padding(
//                                               padding: const EdgeInsets.all(1),
//                                               child: Row(
//                                                 children: [
//                                                   Container(
//                                                     width: ScreenSize
//                                                             .horizontalBlockSize! *
//                                                         22,
//                                                     decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius.all(
//                                                                 Radius.circular(
//                                                                     8)),
//                                                         image: DecorationImage(
//                                                             image: NetworkImage(
//                                                                 "http://owlsup.ru/main_catalog/mods/${LOAD.value == true ? Game2.value['ID'] : Selected.value == true ? abc[3] : abc[0]}/screens//s$index.jpg"),
//                                                             fit: BoxFit.cover)),
//                                                   ),
//                                                   SizedBox(
//                                                       width: ScreenSize
//                                                               .horizontalBlockSize! *
//                                                           2),
//                                                 ],
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                       ),
//                                       SizedBox(
//                                           height:
//                                               ScreenSize.horizontalBlockSize! *
//                                                   2),
//                                       Padding(
//                                         padding: EdgeInsets.only(
//                                             left: ScreenSize.fSize_4()),
//                                         child: Text(
//                                           'DISCRIPTION :',
//                                           style: GoogleFonts.montserrat(
//                                               color: Color(0xFF9293B5),
//                                               fontWeight: FontWeight.w600,
//                                               fontSize: ScreenSize.fSize_13()),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                           height:
//                                               ScreenSize.horizontalBlockSize! *
//                                                   2),
//                                       Padding(
//                                         padding: EdgeInsets.only(
//                                             left: ScreenSize.fSize_4()),
//                                         child: Text(
//                                           """${LOAD.value == true ? Game2.value['DISCRIP'] : Selected.value == true ? abc[5] : abc[8]}""",
//                                           style: GoogleFonts.montserrat(
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.w400,
//                                               fontSize: ScreenSize
//                                                       .horizontalBlockSize! *
//                                                   3),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                                 height: ScreenSize.horizontalBlockSize! * 4.5),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: ScreenSize.fSize_20()),
//                     Row(
//                       children: [
//                         SizedBox(width: ScreenSize.fSize_10()),
//                         controllertext.getText("Related", FontWeight.w500, 4.5)
//                       ],
//                     ),
//                     SizedBox(height: ScreenSize.fSize_6()),
//                     Obx(
//                       () => LOAD.value == true ? buildUsers() : buildUsers(),
//                     ),
//                     SizedBox(
//                       height: ScreenSize.fSize_80(),
//                     ),
//                   ],
//                 ),
//               ),
//               banner.getBN('/Vampire_Craft')
//             ],
//           )),
//     );
//   }
//
//   Widget buildUsers() {
//     return Obx(
//       () => Padding(
//           padding: const EdgeInsets.all(12),
//           child: NOT2.value.isEmpty
//               ? const Center(
//                   child: CircularProgressIndicator(color: Color(0xff78CFCA)))
//               : Container(
//                   height: ScreenSize.horizontalBlockSize! * 55,
//                   width: double.infinity,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ListView.builder(
//                       physics: BouncingScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: NOT2.value[0].mods!.length,
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) {
//                         final Dnum =
//                             int.parse(NOT2.value[0].mods![index].downloads!);
//                         final Vnum =
//                             int.parse(NOT2.value[0].mods![index].views!);
//                         final Lnum =
//                             int.parse(NOT2.value[0].mods![index].likes!);
//                         return GestureDetector(
//                           onTap: () {
//                             exits.value == false;
//                             LOAD.value = true;
//                             fetchUsers2();
//                             downlod(index);
//                             Chek();
//                             CLICK.value = NOT2.value[0].mods![index].screens!;
//                             Game2.value = {
//                               "IMAGE":
//                                   "http://owlsup.ru/main_catalog/mods/${NOT2.value[0].mods![index].id}/screens/s1.jpg",
//                               "DOWNLOD": NumberFormat.compact().format(Dnum),
//                               "LIKE": NumberFormat.compact().format(Vnum),
//                               "VIEW": NumberFormat.compact().format(Lnum),
//                               "DISCRIP": NOT2.value[0].mods![index].description,
//                               "DOWNLODFILE":
//                                   NOT2.value[0].mods![index].files![0].url,
//                               "TITAL": NOT2.value[0].mods![index].title,
//                               "ID": NOT2.value[0].mods![index].id,
//                               "VEROSN":
//                                   NOT2.value[0].mods![index].versions![0].code,
//                               "SCREEN": NOT2.value[0].mods![index].screens
//                             };
//                             final position =
//                                 scrollController.position.minScrollExtent;
//                             scrollController.animateTo(position,
//                                 duration: const Duration(milliseconds: 300),
//                                 curve: Curves.linear);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.all(5.5),
//                             child: Container(
//                               width: ScreenSize.horizontalBlockSize! * 65,
//                               decoration: BoxDecoration(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(10)),
//                               ),
//                               child: Stack(
//                                 children: [
//                                   Container(
//                                     height: double.infinity,
//                                     width: double.infinity,
//                                     child: ClipRRect(
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(10)),
//                                       child: CachedNetworkImage(
//                                         imageUrl:
//                                             "http://owlsup.ru/main_catalog/mods/${NOT2.value[0].mods![index].id}/screens/s1.jpg",
//                                         fit: BoxFit.cover,
//                                         placeholder: (context, url) =>
//                                             Container(
//                                           height:
//                                               ScreenSize.horizontalBlockSize! *
//                                                   45,
//                                           child: Center(
//                                             child: SizedBox(
//                                                 height: ScreenSize.fSize_30(),
//                                                 width: ScreenSize.fSize_30(),
//                                                 child: Center(
//                                                     child:
//                                                         CircularProgressIndicator(
//                                                   color:
//                                                       const Color(0xff78CFCA),
//                                                   strokeWidth: ScreenSize
//                                                           .horizontalBlockSize! *
//                                                       0.8,
//                                                 ))),
//                                           ),
//                                         ),
//                                         errorWidget: (context, url, error) =>
//                                             Container(
//                                                 height: ScreenSize
//                                                         .horizontalBlockSize! *
//                                                     45,
//                                                 child: const Center(
//                                                     child: Icon(Icons.error))),
//                                       ),
//                                     ),
//                                   ),
//                                   Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.end,
//                                         children: [
//                                           Padding(
//                                             padding: EdgeInsets.only(
//                                                 top: ScreenSize.fSize_6()),
//                                             child: Container(
//                                               width: ScreenSize
//                                                       .horizontalBlockSize! *
//                                                   19,
//                                               height: ScreenSize.fSize_28(),
//                                               decoration: ShapeDecoration(
//                                                   color: Color(0xFF020525)
//                                                       .withOpacity(0.4),
//                                                   shape: RoundedRectangleBorder(
//                                                     side: BorderSide(
//                                                         width: 1,
//                                                         color:
//                                                             Color(0xFFFFB700)),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             18),
//                                                   )),
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceEvenly,
//                                                 children: [
//                                                   Image(
//                                                       image: AssetImage(
//                                                           "asset/image/coin.png"),
//                                                       height: ScreenSize
//                                                               .horizontalBlockSize! *
//                                                           4),
//                                                   Text(
//                                                     '2000',
//                                                     style: GoogleFonts.montserrat(
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         color: Colors.white,
//                                                         fontSize: ScreenSize
//                                                                 .horizontalBlockSize! *
//                                                             3.2),
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             width: ScreenSize.fSize_10(),
//                                           )
//                                         ],
//                                       ),
//                                       Container(
//                                         height:
//                                             ScreenSize.horizontalBlockSize! *
//                                                 18,
//                                         width: double.infinity,
//                                         decoration: BoxDecoration(
//                                             color: Color(0xff000000)
//                                                 .withOpacity(0.6),
//                                             borderRadius: BorderRadius.only(
//                                                 bottomRight:
//                                                     Radius.circular(10),
//                                                 bottomLeft:
//                                                     Radius.circular(10))),
//                                         child: Stack(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 SizedBox(
//                                                     width:
//                                                         ScreenSize.fSize_10()),
//                                                 Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     SizedBox(
//                                                         height: ScreenSize
//                                                             .fSize_10()),
//                                                     Container(
//                                                       width: ScreenSize
//                                                               .horizontalBlockSize! *
//                                                           60,
//                                                       child: Text(
//                                                           '${NOT2.value[0].mods![index].title}',
//                                                           overflow: TextOverflow
//                                                               .ellipsis,
//                                                           style: GoogleFonts
//                                                               .montserrat(
//                                                             color: Colors.white,
//                                                             fontSize: ScreenSize
//                                                                     .horizontalBlockSize! *
//                                                                 3.5,
//                                                             fontWeight:
//                                                                 FontWeight.w500,
//                                                           )),
//                                                     ),
//                                                     SizedBox(
//                                                         height: ScreenSize
//                                                             .fSize_10()),
//                                                     Row(
//                                                       children: [
//                                                         controllerlikedownlod.getText(
//                                                             "asset/image/icon/like.png",
//                                                             5.5,
//                                                             '${NumberFormat.compact().format(Vnum)}',
//                                                             3.5),
//                                                         SizedBox(
//                                                             width: ScreenSize
//                                                                 .fSize_12()),
//                                                         controllerlikedownlod.getText(
//                                                             "asset/image/icon/download.png",
//                                                             5.5,
//                                                             '${NumberFormat.compact().format(Dnum)}',
//                                                             3.5),
//                                                       ],
//                                                     )
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 )),
//     );
//   }
//
//   Widget buildUsers2() {
//     return Obx(
//       () => Padding(
//           padding: const EdgeInsets.all(12),
//           child: NOT2.value.isEmpty
//               ? const Center(
//                   child: CircularProgressIndicator(color: Color(0xff78CFCA)))
//               : Container(
//                   height: ScreenSize.horizontalBlockSize! * 55,
//                   width: double.infinity,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ListView.builder(
//                       physics: BouncingScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: NOT2.value[0].mods!.length,
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) {
//                         final Dnum =
//                             int.parse(NOT2.value[0].mods![index].downloads!);
//                         final Vnum =
//                             int.parse(NOT2.value[0].mods![index].views!);
//                         final Lnum =
//                             int.parse(NOT2.value[0].mods![index].likes!);
//                         return GestureDetector(
//                           onTap: () {
//                             LOAD.value = true;
//                             fetchUsers2();
//                             Chek();
//                             downlod(index);
//                             CLICK.value = NOT2.value[0].mods![index].screens!;
//                             Game2.value = {
//                               "IMAGE": NOT2.value[0].mods![index].id,
//                               "DOWNLOD": NumberFormat.compact().format(Dnum),
//                               "LIKE": NumberFormat.compact().format(Vnum),
//                               "VIEW": NumberFormat.compact().format(Lnum),
//                               "DISCRIP": NOT2.value[0].mods![index].description,
//                               "DOWNLODFILE":
//                                   NOT2.value[0].mods![index].files![0].url,
//                               "TITAL": NOT2.value[0].mods![index].title,
//                               "ID": NOT2.value[0].mods![index].id,
//                               "VEROSN":
//                                   NOT2.value[0].mods![index].versions![0].code,
//                               "SCREEN": NOT2.value[0].mods![index].screens
//                             };
//                             final position =
//                                 scrollController.position.minScrollExtent;
//                             scrollController.animateTo(position,
//                                 duration: const Duration(milliseconds: 300),
//                                 curve: Curves.linear);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.all(5.5),
//                             child: Container(
//                               width: ScreenSize.horizontalBlockSize! * 65,
//                               decoration: BoxDecoration(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(10)),
//                               ),
//                               child: Stack(
//                                 children: [
//                                   Container(
//                                     height: double.infinity,
//                                     width: double.infinity,
//                                     child: ClipRRect(
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(10)),
//                                       child: CachedNetworkImage(
//                                         imageUrl:
//                                             "http://owlsup.ru/main_catalog/mods/${NOT2.value[0].mods![index].id}/screens/s1.jpg",
//                                         fit: BoxFit.cover,
//                                         placeholder: (context, url) =>
//                                             Container(
//                                           height:
//                                               ScreenSize.horizontalBlockSize! *
//                                                   45,
//                                           child: Center(
//                                             child: SizedBox(
//                                                 height: ScreenSize.fSize_30(),
//                                                 width: ScreenSize.fSize_30(),
//                                                 child: Center(
//                                                     child:
//                                                         CircularProgressIndicator(
//                                                   color:
//                                                       const Color(0xff78CFCA),
//                                                   strokeWidth: ScreenSize
//                                                           .horizontalBlockSize! *
//                                                       0.8,
//                                                 ))),
//                                           ),
//                                         ),
//                                         errorWidget: (context, url, error) =>
//                                             Container(
//                                                 height: ScreenSize
//                                                         .horizontalBlockSize! *
//                                                     45,
//                                                 child: const Center(
//                                                     child: Icon(Icons.error))),
//                                       ),
//                                     ),
//                                   ),
//                                   Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.end,
//                                         children: [
//                                           Padding(
//                                             padding: EdgeInsets.only(
//                                                 top: ScreenSize.fSize_6()),
//                                             child: Container(
//                                               width: ScreenSize
//                                                       .horizontalBlockSize! *
//                                                   19,
//                                               height: ScreenSize.fSize_28(),
//                                               decoration: ShapeDecoration(
//                                                   color: Color(0xFF020525)
//                                                       .withOpacity(0.4),
//                                                   shape: RoundedRectangleBorder(
//                                                     side: BorderSide(
//                                                         width: 1,
//                                                         color:
//                                                             Color(0xFFFFB700)),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             18),
//                                                   )),
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceEvenly,
//                                                 children: [
//                                                   Image(
//                                                       image: AssetImage(
//                                                           "asset/image/coin.png"),
//                                                       height: ScreenSize
//                                                               .horizontalBlockSize! *
//                                                           4),
//                                                   Text(
//                                                     '2000',
//                                                     style: GoogleFonts.montserrat(
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         color: Colors.white,
//                                                         fontSize: ScreenSize
//                                                                 .horizontalBlockSize! *
//                                                             3.2),
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             width: ScreenSize.fSize_10(),
//                                           )
//                                         ],
//                                       ),
//                                       Container(
//                                         height:
//                                             ScreenSize.horizontalBlockSize! *
//                                                 18,
//                                         width: double.infinity,
//                                         decoration: BoxDecoration(
//                                             color: Color(0xff000000)
//                                                 .withOpacity(0.6),
//                                             borderRadius: BorderRadius.only(
//                                                 bottomRight:
//                                                     Radius.circular(10),
//                                                 bottomLeft:
//                                                     Radius.circular(10))),
//                                         child: Stack(
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 SizedBox(
//                                                     width:
//                                                         ScreenSize.fSize_10()),
//                                                 Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     SizedBox(
//                                                         height: ScreenSize
//                                                             .fSize_10()),
//                                                     Container(
//                                                       width: ScreenSize
//                                                               .horizontalBlockSize! *
//                                                           60,
//                                                       child: Text(
//                                                           '${NOT2.value[0].mods![index].title}',
//                                                           overflow: TextOverflow
//                                                               .ellipsis,
//                                                           style: GoogleFonts
//                                                               .montserrat(
//                                                             color: Colors.white,
//                                                             fontSize: ScreenSize
//                                                                     .horizontalBlockSize! *
//                                                                 3.5,
//                                                             fontWeight:
//                                                                 FontWeight.w500,
//                                                           )),
//                                                     ),
//                                                     SizedBox(
//                                                         height: ScreenSize
//                                                             .fSize_10()),
//                                                     Row(
//                                                       children: [
//                                                         controllerlikedownlod.getText(
//                                                             "asset/image/icon/like.png",
//                                                             5.5,
//                                                             '${NumberFormat.compact().format(Vnum)}',
//                                                             3.5),
//                                                         SizedBox(
//                                                             width: ScreenSize
//                                                                 .fSize_12()),
//                                                         controllerlikedownlod.getText(
//                                                             "asset/image/icon/download.png",
//                                                             5.5,
//                                                             '${NumberFormat.compact().format(Dnum)}',
//                                                             3.5),
//                                                       ],
//                                                     )
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 )),
//     );
//   }
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
//           controllertext.getText(TEXT, FontWeight.w500, 4)
//         ],
//       ),
//     );
//   }
// }
//
// final controllerlikecoment = Get.put(LIKECOMENT());
// final controllerlikecomentbig = Get.put(LIKECOMENTBIG());
//
// class LIKECOMENT extends GetxController {
//   getText(IMAGE, TEXT) {
//     return Container(
//       child: Row(
//         children: [
//           Image(image: AssetImage(IMAGE)),
//           SizedBox(width: ScreenSize.fSize_4()),
//           controllertext.getText(TEXT, FontWeight.w500, 4)
//         ],
//       ),
//     );
//   }
// }
//
// class LIKECOMENTBIG extends GetxController {
//   getText(IMAGE, TEXT) {
//     return Container(
//       child: Row(
//         children: [
//           Image(image: AssetImage(IMAGE)),
//           SizedBox(width: ScreenSize.fSize_4()),
//           controllertext.getText(TEXT, FontWeight.w500, 4)
//         ],
//       ),
//     );
//   }
// }
