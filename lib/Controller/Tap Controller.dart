// ignore_for_file: sized_box_for_whitespace, invalid_use_of_protected_member, use_build_context_synchronously

import 'dart:developer';

import 'package:facebook_audience_network/ad/ad_interstitial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';
import '../Media_Qury/Media.dart';

bool isInterstitialAdLoaded = false;

final ButtonController controller = Get.put(ButtonController());

class ButtonController extends GetxController {
  Future<void> _launchURL(String url) async {
    late Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  Rx buttoncounter = 1.obs;

  showbuttonad(BuildContext context, String page, String name, var arg) async {
    if (MainCraft.value["COUNTER"] == buttoncounter.value) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: Center(
              child: AlertDialog(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: ScreenSize.fSize_34(),
                        width: ScreenSize.fSize_34(),
                        child: const CircularProgressIndicator()),
                    Text("Ad is loading...",
                        style: TextStyle(fontSize: ScreenSize.fSize_18())),
                  ],
                ),
              ),
            ),
          );
        },
      );
      if (MainCraft.value[name]["INTER_AD_TYPE"] == 'ADMOB') {
        InterstitialAd.load(
          adUnitId: MainCraft.value[name]["INTER_ADMOB"],
          // adUnitId: "/6499/example/interstitial",
          request: const AdManagerAdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
            ad.show();
            Navigator.pop(context);
            page != 'stop' ? Get.toNamed(page, arguments: arg) : null;
            buttoncounter.value = 1;
          }, onAdFailedToLoad: (error) {
            InterstitialAd.load(
              adUnitId: MainCraft.value["interstitial"],
              // adUnitId: "/6499/example/interstitial",
              request: const AdManagerAdRequest(),
              adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
                ad.show();
                Navigator.pop(context);
                page != 'stop' ? Get.toNamed(page) : null;
                buttoncounter.value = 1;
              }, onAdFailedToLoad: (error) {
                Navigator.pop(context);
                page != 'stop' ? Get.toNamed(page, arguments: arg) : null;

                buttoncounter.value = 1;
              }),
            );
          }),
        );
      }

      if (MainCraft.value[name]["INTER_AD_TYPE"] == 'FB') {
        FacebookInterstitialAd.loadInterstitialAd(
          placementId: MainCraft.value["INTER_FB"],
          listener: (result, value) async {
            log('Ad Load');
            if (result == InterstitialAdResult.LOADED) {
              await FacebookInterstitialAd.showInterstitialAd();
              Navigator.pop(context);
              page != 'stop' ? Get.toNamed(page, arguments: arg) : null;

              buttoncounter.value = 1;
            }
            if (result == InterstitialAdResult.ERROR) {
              Navigator.pop(context);
              page != 'stop' ? Get.toNamed(page, arguments: arg) : null;

              buttoncounter.value = 1;
            }
          },
        );
      }
      if (MainCraft.value[name]["INTER_AD_TYPE"] == "URL") {
        _launchURL(MainCraft.value[name]["URL"]);
        Future.delayed(
          const Duration(seconds: 2),
          () {
            Navigator.pop(context);
            page != 'stop' ? Get.toNamed(page, arguments: arg) : null;

            buttoncounter.value = 1;
          },
        );
      }
    } else {
      page != 'stop' ? Get.toNamed(page, arguments: arg) : null;

      buttoncounter.value++;
    }
  }
}
