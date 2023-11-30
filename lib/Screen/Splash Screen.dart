// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../Controller/My Controller.dart';
import '../Media_Qury/Media.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  MyAppController myAppController = Get.put(MyAppController());

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
    return Scaffold(
        backgroundColor: Color(0xFF0D1129),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("asset/image/Banner Img.png"))),
          child: Column(
            children: [
              SizedBox(height: ScreenSize.horizontalBlockSize! * 60),
              GradientText(
                'MINECRAFT',
                style: TextStyle(
                    fontFamily: "MainFont",
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenSize.horizontalBlockSize! * 10),
                colors: [
                  Color(0xff5A6BFF),
                  Color(0xff37D79D),
                  Color(0xffB739F2),
                ],
              ),
              SizedBox(height: ScreenSize.fSize_10()),
              Text(
                'Master Of Minecraft',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "MainFont",
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: ScreenSize.horizontalBlockSize! * 4),
              ),
            ],
          ),
        ));
  }
}
