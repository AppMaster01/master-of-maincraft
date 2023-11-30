import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masterofmaincraft/Media_Qury/Media.dart';

var BOOL = false;
final controllertext = Get.put(textcontroller());
final controllertextblack = Get.put(blacktextcontroller());
final controllermainuysplus = Get.put(plusmainuscontroller());
final controllerBlueContainer = Get.put(containerbluecontroller());
final controllerContainer = Get.put(containercontroller());
final controllerMainapp = Get.put(MainAppbarcontroller());
final controllercoin = Get.put(coincontroller());
final controllerlikedownlod = Get.put(imagelikecontroller());
final controllerappbar = Get.put(Appbar());

class Appbar extends GetxController {
  getPiker(ontap, text) {
    return AppBar(
      title: Text(text),
      titleTextStyle: GoogleFonts.prozaLibre(
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: ScreenSize.fSize_18()),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: ontap,
        child: Center(
            child: Image(
          image: AssetImage("asset/image/icon/Arrow back ios.png"),
          height: ScreenSize.horizontalBlockSize! * 8,
          color: Colors.black,
        )),
      ),
    );
  }
}

class imagelikecontroller extends GetxController {
  getText(image, IMAGEsize, text, TextSize) {
    return Row(
      children: [
        Image(
            image: AssetImage(image),
            height: ScreenSize.horizontalBlockSize! * IMAGEsize),
        SizedBox(width: ScreenSize.fSize_8()),
        controllertext.getText(text, FontWeight.w500, TextSize)
      ],
    );
  }
}

class textcontroller extends GetxController {
  getText(text, fontWeight, fontSize) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          color: Colors.white,
          fontWeight: fontWeight,
          fontSize: ScreenSize.horizontalBlockSize! * fontSize),
    );
  }
}

class blacktextcontroller extends GetxController {
  getText(text, fontWeight, fontSize) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
          color: Color(0xFF12202F),
          fontWeight: fontWeight,
          fontSize: ScreenSize.horizontalBlockSize! * fontSize),
    );
  }
}

class plusmainuscontroller extends GetxController {
  getText(ontap, image) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: ScreenSize.fSize_20(),
        width: ScreenSize.fSize_20(),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Center(
              child: Image(
            image: AssetImage(image),
            color: Colors.white,
          )),
        ),
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(100))),
      ),
    );
  }
}

class coincontroller extends GetxController {
  getText(width, height, coinsize, coin) {
    return Container(
      width: ScreenSize.horizontalBlockSize! * width,
      height: ScreenSize.horizontalBlockSize! * height,
      decoration: ShapeDecoration(
        color: Color(0xFF020525).withOpacity(0.6),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFFFB700)),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
              image: AssetImage("asset/image/coin.png"),
              height: ScreenSize.horizontalBlockSize! * coinsize),
          Text(
            coin,
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: ScreenSize.horizontalBlockSize! * 3.7),
          )
        ],
      ),
    );
  }
}

class MainAppbarcontroller extends GetxController {
  getText(ontap, imagesize, image, text, coin, Tsize) {
    return AppBar(
      backgroundColor: Color(0xFF0D1129),
      elevation: 0,
      toolbarHeight: ScreenSize.horizontalBlockSize! * 23,
      leading: Center(
        child: GestureDetector(
          onTap: ontap,
          child: Image(
              image: AssetImage(image),
              width: ScreenSize.horizontalBlockSize! * imagesize),
        ),
      ),
      title: text,
      titleTextStyle: TextStyle(
          fontFamily: "MainFont",
          fontSize: ScreenSize.horizontalBlockSize! * Tsize),
      actions: [
        Center(
          child: Container(
            width: ScreenSize.horizontalBlockSize! * 21,
            height: ScreenSize.fSize_30(),
            decoration: ShapeDecoration(
              color: Color(0xFF020525),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFFFB700)),
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
                  coin,
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
    );
  }
}

class containerbluecontroller extends GetxController {
  getText(width, height, radius, text, TextSize) {
    return Container(
      width: ScreenSize.horizontalBlockSize! * width,
      height: ScreenSize.horizontalBlockSize! * height,
      decoration: ShapeDecoration(
        color: Color(0xFF174AA7),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(ScreenSize.horizontalBlockSize! * radius),
        ),
      ),
      child: Center(
        child: controllertext.getText(text, FontWeight.w500, TextSize),
      ),
    );
  }
}

class containercontroller extends GetxController {
  getText(width, height, image, coin, Maintext, ontap, Child, like, downlod,
      Downlodontap) {
    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        // image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFF9293B5),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                placeholder: (context, url) => SizedBox(
                    height: ScreenSize.fSize_50(),
                    width: ScreenSize.fSize_50(),
                    child: const Center(
                        child: CircularProgressIndicator(
                      color: Color(0xff78CFCA),
                    ))),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error, color: Color(0xFF9293B5)),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: ScreenSize.horizontalBlockSize! * 22,
                    height: ScreenSize.fSize_34(),
                    decoration: ShapeDecoration(
                      color: Color(0xFF020525).withOpacity(0.6),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFFFB700)),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                            image: AssetImage("asset/image/coin.png"),
                            height: ScreenSize.horizontalBlockSize! * 5),
                        Text(
                          '${coin}',
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: ScreenSize.horizontalBlockSize! * 3.7),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: ScreenSize.fSize_10(),
                  )
                ],
              ),
              SizedBox(height: ScreenSize.horizontalBlockSize! * 20),
              Container(
                height: ScreenSize.fSize_80(),
                decoration: BoxDecoration(
                    color: Color(0xff000000).withOpacity(0.6),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // SizedBox(width: ScreenSize.fSize_13()),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: ScreenSize.fSize_10()),
                        Container(
                            width: ScreenSize.horizontalBlockSize! * 50,
                            child: Text(
                              Maintext,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize:
                                      ScreenSize.horizontalBlockSize! * 4.1),
                            )),
                        SizedBox(height: ScreenSize.fSize_10()),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: ontap,
                              child: Child,
                            ),
                            SizedBox(width: ScreenSize.fSize_6()),
                            controllertext.getText(
                                "${like}", FontWeight.w500, 3.7),
                            SizedBox(width: ScreenSize.fSize_28()),
                            Center(
                              child: Image(
                                  image: AssetImage('asset/image/download.png'),
                                  height:
                                      ScreenSize.horizontalBlockSize! * 6.5),
                            ),
                            SizedBox(width: ScreenSize.fSize_10()),
                            controllertext.getText(
                                "${downlod}", FontWeight.w500, 3.7),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: Downlodontap,
                      child: controllerBlueContainer.getText(
                          32, 10, 2, "Download", 3.5),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

//================================================================================================
final Firstcontroller = Get.put(firstcontroller());

class firstcontroller extends GetxController {
  getText(text, text1, image, text3) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xFF020525),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFF9293B5),
          ),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: ScreenSize.horizontalBlockSize! * 4),
          controllerhelptext.getText(text),
          SizedBox(height: ScreenSize.horizontalBlockSize! * 2),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                color: Color(0xFF0D1129),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.horizontalBlockSize! * 4),
                  Row(
                    children: [
                      SizedBox(width: ScreenSize.horizontalBlockSize! * 3),
                      Image(
                          image:
                              AssetImage('asset/image/icon/Arrow back ios.png'),
                          width: ScreenSize.horizontalBlockSize! * 5),
                      SizedBox(width: ScreenSize.horizontalBlockSize! * 3),
                      controllertext.getText(text1, FontWeight.w400, 4),
                    ],
                  ),
                  SizedBox(height: ScreenSize.horizontalBlockSize! * 5),
                  Image(image: AssetImage(image)),
                  SizedBox(height: ScreenSize.horizontalBlockSize! * 4.5),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      controllerBlueContainer.getText(85, 10, 2, text3, 3.5),
                      Container(
                        width: ScreenSize.horizontalBlockSize! * 32,
                        height: ScreenSize.horizontalBlockSize! * 8,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFFD80101)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenSize.horizontalBlockSize! * 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//================================================================
final controllersecond = Get.put(secondcontroller());

class secondcontroller extends GetxController {
  getText(text) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xFF020525),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFF9293B5),
          ),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: ScreenSize.horizontalBlockSize! * 4),
          controllerhelptext.getText(text),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                color: Color(0xFF0D1129),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.horizontalBlockSize! * 3),
                  Image(
                    image: AssetImage("asset/image/icon/FolderNotch.png"),
                    width: ScreenSize.horizontalBlockSize! * 8,
                  ),
                  SizedBox(height: ScreenSize.horizontalBlockSize! * 5),
                  Container(
                    width: ScreenSize.horizontalBlockSize! * 72,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Allow ',
                            style: GoogleFonts.montserrat(
                                fontSize: ScreenSize.horizontalBlockSize! * 3.5,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                          TextSpan(
                            text: 'Minecraft',
                            style: GoogleFonts.montserrat(
                                fontSize: ScreenSize.horizontalBlockSize! * 3.5,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text:
                                ' to access photos, media, and files on your device',
                            style: GoogleFonts.montserrat(
                                fontSize: ScreenSize.horizontalBlockSize! * 3.5,
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: ScreenSize.horizontalBlockSize! * 5),
                  Container(
                    width: ScreenSize.horizontalBlockSize! * 32,
                    height: ScreenSize.horizontalBlockSize! * 8,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFD70000)),
                      ),
                    ),
                    child: Center(
                      child:
                          controllertext.getText('Allow', FontWeight.w300, 3),
                    ),
                  ),
                  SizedBox(height: ScreenSize.horizontalBlockSize! * 5),
                  controllertext.getText('Deny', FontWeight.w300, 3),
                  SizedBox(height: ScreenSize.horizontalBlockSize! * 3),
                ],
              ),
            ),
          ),
          SizedBox(height: ScreenSize.horizontalBlockSize! * 3),
        ],
      ),
    );
  }
}
//================================================================

final controllerthird = Get.put(thirdcontroller());

class thirdcontroller extends GetxController {
  getText(text, text1, image, text3, text4) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xFF020525),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFF9293B5),
          ),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: ScreenSize.horizontalBlockSize! * 4),
          controllerhelptext.getText(text),
          SizedBox(height: ScreenSize.horizontalBlockSize! * 2),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              decoration: ShapeDecoration(
                color: Color(0xFF0D1129),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.horizontalBlockSize! * 4),
                  Row(
                    children: [
                      SizedBox(width: ScreenSize.horizontalBlockSize! * 3),
                      Image(
                          image:
                              AssetImage('asset/image/icon/Arrow back ios.png'),
                          width: ScreenSize.horizontalBlockSize! * 5),
                      SizedBox(width: ScreenSize.horizontalBlockSize! * 3),
                      controllertext.getText(text1, FontWeight.w400, 4),
                    ],
                  ),
                  SizedBox(height: ScreenSize.horizontalBlockSize! * 5),
                  Image(image: AssetImage(image)),
                  SizedBox(height: ScreenSize.horizontalBlockSize! * 4.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      controllerBlueContainer.getText(40, 10, 2, text3, 3.5),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          controllerBlueContainer.getText(
                              40, 10, 2, text4, 3.5),
                          Container(
                            width: ScreenSize.horizontalBlockSize! * 32,
                            height: ScreenSize.horizontalBlockSize! * 8,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0xFFD80101)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenSize.horizontalBlockSize! * 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//================================================================

final controllerfor = Get.put(forcontroller());

class forcontroller extends GetxController {
  getText(text, image) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xFF020525),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFF9293B5),
          ),
        ),
      ),
      child: Column(children: [
        SizedBox(height: ScreenSize.horizontalBlockSize! * 4.5),
        controllerhelptext.getText(text),
        SizedBox(height: ScreenSize.horizontalBlockSize! * 2.5),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(image: AssetImage(image)),
        ),
        SizedBox(height: ScreenSize.horizontalBlockSize! * 2),
      ]),
    );
  }
}
//================================================================

final controllerfive = Get.put(fivecontroller());

class fivecontroller extends GetxController {
  getText(text, image) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xFF020525),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFF9293B5),
          ),
        ),
      ),
      child: Column(children: [
        SizedBox(height: ScreenSize.horizontalBlockSize! * 4),
        controllerhelptext.getText(text),
        SizedBox(height: ScreenSize.horizontalBlockSize! * 2),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(image: AssetImage(image)),
        ),
        SizedBox(height: ScreenSize.horizontalBlockSize! * 2),
      ]),
    );
  }
}

//================================================================
final controllersix = Get.put(sixcontroller());

class sixcontroller extends GetxController {
  getText(text, image) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xFF020525),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFF9293B5),
          ),
        ),
      ),
      child: Column(children: [
        SizedBox(height: ScreenSize.horizontalBlockSize! * 4),
        controllerhelptext.getText(text),
        SizedBox(height: ScreenSize.horizontalBlockSize! * 2),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(image: AssetImage(image)),
        ),
        SizedBox(height: ScreenSize.horizontalBlockSize! * 2),
        controllerBlueContainer.getText(85, 10, 2, "Watch Video", 3.5),
        SizedBox(height: ScreenSize.horizontalBlockSize! * 4),
      ]),
    );
  }
}
//================================================================

final controllerhelptext = Get.put(helptextcontroller());

class helptextcontroller extends GetxController {
  getText(text) {
    return Row(
      children: [
        SizedBox(width: ScreenSize.horizontalBlockSize! * 4),
        Container(
          width: ScreenSize.horizontalBlockSize! * 90,
          child: controllertext.getText(text, FontWeight.w300, 3.8),
        ),
      ],
    );
  }
}
//
