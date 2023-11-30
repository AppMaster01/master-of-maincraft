// ignore_for_file: invalid_use_of_protected_member, avoid_print, sized_box_for_whitespace, non_constant_identifier_names

import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Media_Qury/Media.dart';
import '../main.dart';

final native = Get.put(NativeAds());
final banner = Get.put(BannerAds());

void initState() {
  FacebookAudienceNetwork.init();
}

class NativeAds extends GetxController {
  Future<void> _launchURL(String url) async {
    late Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  Widget getNT(context, String name, String Factoryid) {
    late NativeAd nativeAd;
    var isLoaded = false.obs;
    if (MainCraft.value[name]["N_AD_TYPE"] == "ADMOB") {
      nativeAd = NativeAd(
        request: const AdManagerAdRequest(),
        adUnitId: MainCraft.value[name]["N_ADMOB"],
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            nativeAd.load();
            isLoaded.value = true;
            print("Native ad Loaded");
          },
          onAdFailedToLoad: (ad, error) {
            print("Native ad Failed to Load");
          },
          onAdImpression: (ad) {
            print('native onAdImpression ');
          },
        ),
        // factoryId: 'listTileMedium',
        factoryId: Factoryid,
      );
      nativeAd.load();
    }
    // ScreenSize.fSize_150()
    return MainCraft.value[name]["N_AD_TYPE"] == "ADMOB"
        ? Obx(() => isLoaded.value
            ? Factoryid == "listTile"
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: ScreenSize.horizontalBlockSize! *
                                  MainCraft.value['Smallheight'],
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
                              child: Center(
                                child: AdWidget(
                                  ad: nativeAd,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(12),
                    child: Stack(
                      children: [
                        Container(
                          width: ScreenSize.horizontalBlockSize! *
                              MainCraft.value['width'],
                          height: ScreenSize.horizontalBlockSize! *
                              MainCraft.value["Mdiumheight"],
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
                          child: Center(
                            child: AdWidget(
                              ad: nativeAd,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
            : Factoryid == "listTileMedium"
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: ScreenSize.horizontalBlockSize! *
                          MainCraft.value['width'],
                      height: ScreenSize.horizontalBlockSize! *
                          MainCraft.value["Mdiumheight"],
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
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xff009A73),
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: ScreenSize.horizontalBlockSize! *
                          MainCraft.value['width'],
                      height: ScreenSize.horizontalBlockSize! *
                          MainCraft.value["Mdiumheight"],
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
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xff009A73),
                        ),
                      ),
                    ),
                  ))
        : MainCraft.value[name]["N_AD_TYPE"] == "FB"
            ? Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                    width: ScreenSize.horizontalBlockSize! *
                        MainCraft.value['width'],
                    height: Factoryid == "listTile"
                        ? ScreenSize.horizontalBlockSize! *
                            MainCraft.value['Smallheight']
                        : ScreenSize.fSize_240(),
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
                    child: FacebookNativeAd(
                      placementId: MainCraft.value["N_FB"],
                      adType: NativeAdType.NATIVE_AD,
                      width: ScreenSize.horizontalBlockSize! *
                          MainCraft.value['width'],
                      height: Factoryid == "listTile"
                          ? ScreenSize.horizontalBlockSize! *
                              MainCraft.value['Smallheight']
                          : ScreenSize.horizontalBlockSize! *
                              MainCraft.value["Mdiumheight"],
                      backgroundColor: Colors.white,
                      titleColor: Colors.black,
                      descriptionColor: Colors.black,
                      buttonColor: const Color(0xFFF6FFFF),
                      buttonTitleColor: Colors.black,
                      listener: (result, value) {
                        print("Native Ad: $result --> $value");
                      },
                      keepExpandedWhileLoading: true,
                      expandAnimationDuraion: 1000,
                    )),
              )
            : GestureDetector(
                onTap: () {
                  _launchURL(MainCraft.value[name]["URL"]);
                },
                child: Stack(
                  children: [
                    Container(
                      width: ScreenSize.horizontalBlockSize! *
                          MainCraft.value['width'],
                      height: Factoryid == "listTile"
                          ? ScreenSize.horizontalBlockSize! *
                              MainCraft.value['Smallheight']
                          : ScreenSize.horizontalBlockSize! *
                              MainCraft.value["Mdiumheight"],
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
                    ),
                    Positioned(
                      top: ScreenSize.fSize_12(),
                      left: ScreenSize.fSize_12(),
                      child: Container(
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
                        height: ScreenSize.fSize_15(),
                        width: ScreenSize.fSize_25(),
                        child: Center(
                          child: Text('Ad',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenSize.fSize_10())),
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}

//======================================FACEBOOK BANNER===================================================
int counter = 1;

class BannerAds extends GetxController {
  BannerAd? bannerAd;
  var bannerLoaded = false.obs;

  Widget getBN(String name) {
    if (MainCraft.value[name]["B_AD_TYPE"] == "ADMOB") {
      bannerAd = BannerAd(
        size: AdSize.fluid,
        adUnitId: MainCraft.value[name]["B_ADMOB"],
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            bannerAd!.load();
            bannerLoaded.value = true;
            print("Banner ad Loaded${counter++}");
          },
          onAdFailedToLoad: (ad, error) {
            // print('banner onAdFailedToLoad ${counter++}');
          },
          onAdImpression: (ad) {
            print('banner onAdImpression ');
          },
        ),
        request: const AdRequest(),
      );
      bannerAd!.load();
    }
    return MainCraft.value[name]["B_AD_TYPE"] == "ADMOB"
        ? Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 50,
              child: AdWidget(
                ad: bannerAd!,
              ),
            ),
          )
        : Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              child: FacebookBannerAd(
                placementId: MainCraft.value["B_FB"],
                bannerSize: BannerSize.STANDARD,
                listener: (result, value) {},
              ),
            ),
          );
  }
}
