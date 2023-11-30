import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masterofmaincraft/Controller/Back%20controller.dart';

import '../Controller/Google_Ads.dart';
import '../Controller/Tap Controller.dart';
import '../Media_Qury/Media.dart';
import '../Widget Controller/Controller.dart';
import 'Home Screen.dart';

var AllData = {}.obs;

class Add_on extends StatefulWidget {
  const Add_on({super.key});

  @override
  State<Add_on> createState() => _Add_onState();
}

class _Add_onState extends State<Add_on> {
  var abc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    abc = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/Add_on', ''),
      child: Scaffold(
        backgroundColor: Color(0xFF0D1129),
        appBar: controllerMainapp.getText(() {
          backbuttoncontroller.showBackbuttonad(context, '/Add_on', '');
        }, 7.5, "asset/image/icon/Arrow back ios.png", Text("Add-Ons"), "200",
            4.5),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Obx(
                () => Column(
                  children: [
                    Text("${Selected.value}",
                        style: TextStyle(color: Colors.transparent)),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: abc[0] == 0
                          ? abc[2].length
                          : abc[0] == 1
                              ? abc[3].length
                              : abc[0] == 2
                                  ? abc[4].length
                                  : abc[0] == 3
                                      ? abc[5].length
                                      : abc[0] == 4
                                          ? abc[6].length
                                          : abc[7].length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          mainAxisSpacing: 5),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            var NAMETEXT = abc[0] == 0
                                ? "${abc[2][index].title}"
                                : abc[0] == 1
                                    ? "${abc[3][index].title}"
                                    : abc[0] == 2
                                        ? "${abc[4][index].title}"
                                        : abc[0] == 3
                                            ? "${abc[5][index].title}"
                                            : abc[0] == 4
                                                ? "${abc[6][index].title}"
                                                : "${abc[7][index].title}";
                            var IMAGE = abc[0] == 0
                                ? "${abc[2][index].id}"
                                : abc[0] == 1
                                    ? "${abc[3][index].id}"
                                    : abc[0] == 2
                                        ? "${abc[4][index].id}"
                                        : abc[0] == 3
                                            ? "${abc[5][index].id}"
                                            : abc[0] == 4
                                                ? "${abc[6][index].id}"
                                                : "${abc[7][index].id}";
                            var Like = abc[0] == 0
                                ? abc[2][index]
                                : abc[0] == 1
                                    ? abc[3][index]
                                    : abc[0] == 2
                                        ? abc[4][index]
                                        : abc[0] == 3
                                            ? abc[5][index]
                                            : abc[0] == 4
                                                ? abc[6][index]
                                                : abc[7][index];
                            var DISCRIP = abc[0] == 0
                                ? abc[2][index].description
                                : abc[0] == 1
                                    ? abc[3][index].description
                                    : abc[0] == 2
                                        ? abc[4][index].description
                                        : abc[0] == 3
                                            ? abc[5][index].description
                                            : abc[0] == 4
                                                ? abc[6][index].description
                                                : abc[7][index].description;
                            var Versoin = abc[0] == 0
                                ? abc[2][index].versions![0].code
                                : abc[0] == 1
                                    ? abc[3][index].versions![0].code
                                    : abc[0] == 2
                                        ? abc[4][index].versions![0].code
                                        : abc[0] == 3
                                            ? abc[5][index].versions![0].code
                                            : abc[0] == 4
                                                ? abc[6][index]
                                                    .versions![0]
                                                    .code
                                                : 0;
                            var Screen = abc[0] == 0
                                ? abc[2][index].screens
                                : abc[0] == 1
                                    ? abc[3][index].screens
                                    : abc[0] == 2
                                        ? abc[4][index].screens
                                        : abc[0] == 3
                                            ? abc[5][index].screens
                                            : abc[0] == 4
                                                ? abc[6][index].screens
                                                : abc[2][index].screens;
                            var URL =
                                "${abc[0] == 1 ? abc[3][index].files![0].url : abc[0] == 2 ? abc[4][index].files![0].url : abc[0] == 3 ? abc[5][index].files![0].url : abc[0] == 4 ? abc[6][index].files![0].url : abc[7][index].files![0].url}";
                            Selected.value = true;
                            controller.showbuttonad(
                                context, '/Transport_Addon', '/Add_on', [
                              index,
                              abc[1],
                              NAMETEXT,
                              IMAGE,
                              Like,
                              DISCRIP,
                              Versoin,
                              Screen,
                              URL,
                              abc[0]
                            ]);
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  // image: DecorationImage(
                                  //     image: NetworkImage(
                                  //         "http://owlsup.ru/main_catalog/${abc[1]}/${abc[0] == 0 ? "${abc[2][index].id}" : abc[0] == 1 ? "${abc[3][index].id}" : abc[0] == 2 ? "${abc[4][index].id}" : abc[0] == 3 ? "${abc[5][index].id}" : abc[0] == 4 ? "${abc[6][index].id}" : "${abc[7][index].id}"}/screens/s1.jpg"
                                  //         // "http://owlsup.ru/main_catalog/${abc[1]}/${abc[0] == 5 ? abc[3][index].id : abc[2][index].id}/screens/s1.jpg"
                                  //         ),
                                  //     fit: BoxFit.cover)
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: CachedNetworkImage(
                                          imageUrl: abc[0] == 5
                                              ? "http://owlsup.ru/main_catalog/skins/${abc[7][index].id}/skin.png"
                                              : "http://owlsup.ru/main_catalog/${abc[1]}/${abc[0] == 0 ? "${abc[2][index].id}" : abc[0] == 1 ? "${abc[3][index].id}" : abc[0] == 2 ? "${abc[4][index].id}" : abc[0] == 3 ? "${abc[5][index].id}" : abc[0] == 4 ? "${abc[6][index].id}" : "${abc[7][index].id}"}/screens/s1.jpg",
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              SizedBox(
                                                  height: ScreenSize.fSize_50(),
                                                  width: ScreenSize.fSize_50(),
                                                  child: const Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                    color: Color(0xff78CFCA),
                                                  ))),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error,
                                                  color: Color(0xFF9293B5)),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            controllercoin.getText(
                                                22, 7, 4.5, '2000'),
                                            SizedBox(
                                              width: ScreenSize.fSize_10(),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                            height: ScreenSize
                                                    .horizontalBlockSize! *
                                                20),
                                        Container(
                                          height:
                                              ScreenSize.horizontalBlockSize! *
                                                  10,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: Color(0xff000000)
                                                  .withOpacity(0.6),
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(8),
                                                  bottomRight:
                                                      Radius.circular(8))),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                  width: ScreenSize.fSize_10()),
                                              Container(
                                                  width: ScreenSize
                                                          .horizontalBlockSize! *
                                                      40,
                                                  child: Text(
                                                    abc[0] == 0
                                                        ? "${abc[2][index].title}"
                                                        : abc[0] == 1
                                                            ? "${abc[3][index].title}"
                                                            : abc[0] == 2
                                                                ? "${abc[4][index].title}"
                                                                : abc[0] == 3
                                                                    ? "${abc[5][index].title}"
                                                                    : abc[0] ==
                                                                            4
                                                                        ? "${abc[6][index].title}"
                                                                        : "${abc[7][index].title}"
                                                                            .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.montserrat(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: ScreenSize
                                                                .horizontalBlockSize! *
                                                            3.4),
                                                  ))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        );
                      },
                    ),
                    SizedBox(
                      height: ScreenSize.fSize_80(),
                    )
                  ],
                ),
              ),
            ),
            banner.getBN('/Add_on')
          ],
        ),
      ),
    );
  }
}
