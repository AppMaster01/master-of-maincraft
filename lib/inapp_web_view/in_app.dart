// ignore_for_file: camel_case_types, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';


import '../Controller/Back controller.dart';
import '../Media_Qury/Media.dart';
import '../Widget Controller/Controller.dart';

class In_App_Privacy extends StatefulWidget {
  const In_App_Privacy({Key? key}) : super(key: key);

  @override
  State<In_App_Privacy> createState() => _In_App_PrivacyState();
}

class _In_App_PrivacyState extends State<In_App_Privacy> {
  final _process = 0.0.obs;
  late InAppWebViewController webView;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/In_App_Privacy', ''),
      child: Scaffold(
        appBar: controllerappbar.getPiker(() {
          backbuttoncontroller.showBackbuttonad(context, '/In_App_Privacy', '');
        }, 'youtube '),
        body: Obx(
          () => Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse('youtube.com')),
                onWebViewCreated: (InAppWebViewController controller) {
                  webView = controller;
                },
                onProgressChanged:
                    (InAppWebViewController controller, int process) {
                  _process.value = (process / 100);
                },
              ),
              if (_process.value < 1)
                Center(
                  child: Container(
                    height: ScreenSize.fSize_100(),
                    width: ScreenSize.fSize_100(),
                    child: Column(
                      children: [
                        Container(
                          height: ScreenSize.fSize_40(),
                          width: ScreenSize.fSize_40(),
                          child: CircularProgressIndicator(
                            strokeWidth: ScreenSize.fSize_4(),
                            value: _process.value,
                          ),
                        ),
                        SizedBox(
                          height: ScreenSize.fSize_10(),
                        ),
                        Text('Loading...',
                            style: TextStyle(fontSize: ScreenSize.fSize_18())),
                      ],
                    ),
                  ),
                )
              else
                SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
