import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masterofmaincraft/Controller/Back%20controller.dart';
import 'package:masterofmaincraft/Controller/Google_Ads.dart';
import 'package:masterofmaincraft/Media_Qury/Media.dart';
import 'package:masterofmaincraft/Widget%20Controller/Controller.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  var AMOUNT = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF12202F),
      appBar: AppBar(
        backgroundColor: Color(0xFF12202F),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            backbuttoncontroller.showBackbuttonad(context, '/Help', '');
          },
          child: Center(
            child: Image(
                image: AssetImage("asset/image/icon/Arrow back ios.png"),
                width: ScreenSize.horizontalBlockSize! * 8),
          ),
        ),
        title: Text("Help"),
        titleTextStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: ScreenSize.horizontalBlockSize! * 5),
      ),
      body: Stack(
        children: [
          Obx(
            () => Column(
              children: [
                SizedBox(height: ScreenSize.horizontalBlockSize! * 7),
                Container(
                  width: double.infinity,
                  height: ScreenSize.horizontalBlockSize! * 16,
                  decoration: BoxDecoration(color: Color(0xFF020525)),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: TEXT.value.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: GestureDetector(
                                  onTap: () {
                                    AMOUNT.value = index;
                                  },
                                  child: Text(
                                    '${TEXT.value[index]}',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF9293B5),
                                        fontSize:
                                            ScreenSize.horizontalBlockSize! *
                                                4.1),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: ScreenSize.horizontalBlockSize! * 18,
                              height: 4,
                              decoration: BoxDecoration(
                                  color: AMOUNT.value == index
                                      ? Color(0xFFD9D9D9)
                                      : Colors.transparent),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: ScreenSize.horizontalBlockSize! * 7),
                Container(
                  height: ScreenSize.horizontalBlockSize! * 135,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        AMOUNT.value == 0
                            ? Column(
                                children: [
                                  Firstcontroller.getText(
                                      "1.\tDownload a Mod",
                                      "Transport Add-on",
                                      "asset/image/Rectangle.png",
                                      "Download"),
                                  SizedBox(
                                      height:
                                          ScreenSize.horizontalBlockSize! * 5),
                                  controllersecond.getText(
                                      """2.  Allow the app to access photos, multimedia, and files on your device"""),
                                  SizedBox(
                                      height:
                                          ScreenSize.horizontalBlockSize! * 5),
                                  controllerthird.getText(
                                      """3. Once the download is complete, tap Open and navigate to Minecraft PE""",
                                      "Transport Add-on",
                                      "asset/image/Rectangle.png",
                                      "Delete",
                                      "Open"),
                                  SizedBox(
                                      height:
                                          ScreenSize.horizontalBlockSize! * 5),
                                  controllerfor.getText(
                                      """4.  Tap Play in Minecraft PE, then go to the worlds tab and tap Edit next to the selected map""",
                                      "asset/image/list-of-the-world-on-ios 1.png"),
                                  SizedBox(
                                      height:
                                          ScreenSize.horizontalBlockSize! * 5),
                                  controllerfive.getText(
                                      """5. Tap Play in Minecraft PE, then go to the worlds tab and tap Edit next to the selected map""",
                                      "asset/image/addonsettings 1.png"),
                                  SizedBox(
                                      height:
                                          ScreenSize.horizontalBlockSize! * 5),
                                  controllerhelptext.getText(
                                      """6. Select the mode you downloaded and tap Activate"""),
                                  SizedBox(height: ScreenSize.fSize_100()),
                                ],
                              )
                            : AMOUNT.value == 1
                                ? Center(
                                    child: Column(children: [
                                    controllersix.getText(
                                        """Make Sure that you allow External file storage in Minecraft settings!""",
                                        "asset/image/Screenshot_20211027-103440_Minecraft-1024x461 1.png"),
                                    SizedBox(
                                        height:
                                            ScreenSize.horizontalBlockSize! *
                                                5),
                                    Firstcontroller.getText(
                                        "1.\tDownload a Mod",
                                        "Transport Add-on",
                                        "asset/image/maps_img.png",
                                        "Download"),
                                    SizedBox(
                                        height:
                                            ScreenSize.horizontalBlockSize! *
                                                5),
                                    controllersecond.getText(
                                        """2.  Allow the app to access photos, multimedia, and files on your device"""),
                                    SizedBox(
                                        height:
                                            ScreenSize.horizontalBlockSize! *
                                                5),
                                    controllerthird.getText(
                                        """3. Once the download is complete, tap Open and navigate to Minecraft PE""",
                                        "Transport Add-on",
                                        "asset/image/maps_img.png",
                                        "Delete",
                                        "Open"),
                                    SizedBox(
                                        height:
                                            ScreenSize.horizontalBlockSize! *
                                                5),
                                    controllerhelptext
                                        .getText("4. Tap Play in Minecraft PE"),
                                    SizedBox(
                                        height:
                                            ScreenSize.horizontalBlockSize! *
                                                5),
                                    controllerfor.getText(
                                        """5.  Select the map you downloaded in the Worlds section""",
                                        "asset/image/list-of-the-world-on-ios 1.png"),
                                    SizedBox(
                                        height:
                                            ScreenSize.horizontalBlockSize! *
                                                5),
                                    controllerhelptext.getText(
                                        """6. Once the resource packs load and the world is generated, the map is ready!"""),
                                    SizedBox(height: ScreenSize.fSize_80()),
                                  ]))
                                : AMOUNT.value == 2
                                    ? Center(
                                        child: Column(children: [
                                        Firstcontroller.getText(
                                            "1.\tDownload a Mod",
                                            "Transport Add-on",
                                            "asset/image/Group 45.png",
                                            "Download"),
                                        SizedBox(
                                            height: ScreenSize
                                                    .horizontalBlockSize! *
                                                5),
                                        controllersecond.getText(
                                            """2.  Allow the app to access photos, multimedia, and files on your device"""),
                                        SizedBox(
                                            height: ScreenSize
                                                    .horizontalBlockSize! *
                                                5),
                                        controllerthird.getText(
                                            """3. Once the download is complete, tap Open and navigate to Minecraft PE""",
                                            "Transport Add-on",
                                            "asset/image/Group 45.png",
                                            "Delete",
                                            "Open"),
                                        SizedBox(
                                            height: ScreenSize
                                                    .horizontalBlockSize! *
                                                5),
                                        controllerfor.getText(
                                            """4.  Tap Play in Minecraft PE, then go to the worlds tab and tap Edit next to the selected map""",
                                            "asset/image/list-of-the-world-on-ios 1.png"),
                                        SizedBox(
                                            height: ScreenSize
                                                    .horizontalBlockSize! *
                                                5),
                                        controllerfive.getText(
                                            """5. Tap Play in Minecraft PE, then go to the worlds tab and tap Edit next to the selected map""",
                                            "asset/image/addonsettings 1.png"),
                                        SizedBox(
                                            height: ScreenSize
                                                    .horizontalBlockSize! *
                                                5),
                                        controllerhelptext.getText(
                                            """6. Select the mode you downloaded and tap Activate"""),
                                        SizedBox(height: ScreenSize.fSize_80()),
                                      ]))
                                    : AMOUNT.value == 3
                                        ? Center(
                                            child: Column(children: [
                                            Firstcontroller.getText(
                                                "1.\tDownload a Mod",
                                                "Transport Add-on",
                                                "asset/image/Group 45.png",
                                                "Download"),
                                            SizedBox(
                                                height: ScreenSize
                                                        .horizontalBlockSize! *
                                                    5),
                                            controllersecond.getText(
                                                """2.  Allow the app to access photos, multimedia, and files on your device"""),
                                            SizedBox(
                                                height: ScreenSize
                                                        .horizontalBlockSize! *
                                                    5),
                                            controllerthird.getText(
                                                """3. Once the download is complete, tap Open and navigate to Minecraft PE""",
                                                "Transport Add-on",
                                                "asset/image/Group 45.png",
                                                "Delete",
                                                "Open"),
                                            SizedBox(
                                                height: ScreenSize
                                                        .horizontalBlockSize! *
                                                    5),
                                            controllerfor.getText(
                                                """4.  Tap Play in Minecraft PE, then go to the worlds tab and tap Edit next to the selected map""",
                                                "asset/image/list-of-the-world-on-ios 1.png"),
                                            SizedBox(
                                                height: ScreenSize
                                                        .horizontalBlockSize! *
                                                    5),
                                            controllerfive.getText(
                                                """5. Tap Play in Minecraft PE, then go to the worlds tab and tap Edit next to the selected map""",
                                                "asset/image/addonsettings 1.png"),
                                            SizedBox(
                                                height: ScreenSize
                                                        .horizontalBlockSize! *
                                                    5),
                                            controllerhelptext.getText(
                                                """6. Select the mode you downloaded and tap Activate"""),
                                            SizedBox(
                                                height: ScreenSize.fSize_80()),
                                          ]))
                                        : Center(
                                            child: Column(children: [
                                            SizedBox(
                                                height: ScreenSize
                                                        .horizontalBlockSize! *
                                                    0.5),
                                            Container(
                                              decoration: ShapeDecoration(
                                                color: Color(0xFF020525),
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                    width: 1,
                                                    strokeAlign: BorderSide
                                                        .strokeAlignOutside,
                                                    color: Color(0xFF9293B5),
                                                  ),
                                                ),
                                              ),
                                              child: Column(children: [
                                                SizedBox(
                                                    height: ScreenSize
                                                            .horizontalBlockSize! *
                                                        4),
                                                controllerhelptext.getText(
                                                    """1. Download a skin to the gallery or Minecraft PE"""),
                                                SizedBox(
                                                    height: ScreenSize
                                                            .horizontalBlockSize! *
                                                        2),
                                                Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                        height: ScreenSize
                                                                .horizontalBlockSize! *
                                                            62,
                                                        width: double.infinity,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Image(
                                                          image: AssetImage(
                                                              "asset/image/Group_366-transformed.png")),
                                                    ),
                                                    Image(
                                                        image: AssetImage(
                                                            'asset/image/Group 345.png')),
                                                  ],
                                                ),
                                                SizedBox(
                                                    height: ScreenSize
                                                            .horizontalBlockSize! *
                                                        2),
                                              ]),
                                            ),
                                            SizedBox(
                                                height: ScreenSize
                                                        .horizontalBlockSize! *
                                                    5),
                                            Row(
                                              children: [
                                                SizedBox(
                                                    width: ScreenSize
                                                            .horizontalBlockSize! *
                                                        4),
                                                controllertext.getText(
                                                    "If you chose to save a skin to the gallery",
                                                    FontWeight.w600,
                                                    4),
                                              ],
                                            ),
                                            SizedBox(
                                                height: ScreenSize
                                                        .horizontalBlockSize! *
                                                    5),
                                            controllerfor.getText(
                                                """2.  Open Minecraft PE and go to the Profile section""",
                                                "asset/image/minecraft-1-19-80 2.png"),
                                            SizedBox(
                                                height: ScreenSize
                                                        .horizontalBlockSize! *
                                                    5),
                                            controllerfor.getText(
                                                """3.  Tap the character or the Edit icon""",
                                                "asset/image/aid2925660-v4-728px-Change-Your-Skin-in-Minecraft-PE-Step-3-Version-6 1.png"),
                                            SizedBox(
                                                height: ScreenSize
                                                        .horizontalBlockSize! *
                                                    5),
                                            controllerhelptext.getText(
                                                """4. Go to the Classic Skins section and select Owned"""),
                                            SizedBox(
                                                height: ScreenSize
                                                        .horizontalBlockSize! *
                                                    5),
                                            controllerfor.getText(
                                                """5. Tap the Import icon and select your new skin""",
                                                "asset/image/aid2925660-v4-728px-Change-Your-Skin-in-Minecraft-PE-Step-5-Version-6 2.png"),
                                            SizedBox(
                                                height: ScreenSize
                                                        .horizontalBlockSize! *
                                                    5),
                                            Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                controllerfor.getText(
                                                    """6. Select the skin in the gallery, then tap the icon in Minecraft PE""",
                                                    "asset/image/Group 45 (1).png"),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: ScreenSize
                                                              .horizontalBlockSize! *
                                                          25,
                                                      left: ScreenSize
                                                              .horizontalBlockSize! *
                                                          9),
                                                  child: Row(
                                                    children: [
                                                      Image(
                                                          image: AssetImage(
                                                              "asset/image/Group_358-removebg-preview.png"),
                                                          height: ScreenSize
                                                                  .horizontalBlockSize! *
                                                              15),
                                                      SizedBox(
                                                          width: ScreenSize
                                                                  .horizontalBlockSize! *
                                                              5),
                                                      Image(
                                                          image: AssetImage(
                                                              "asset/image/Group_359-removebg-preview.png"),
                                                          height: ScreenSize
                                                                  .horizontalBlockSize! *
                                                              15),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                                height: ScreenSize
                                                        .horizontalBlockSize! *
                                                    5),
                                            controllerhelptext.getText(
                                                """7.  Leave this section. The new skin will be saved automatically"""),
                                            SizedBox(
                                                height: ScreenSize
                                                        .horizontalBlockSize! *
                                                    5),
                                            controllerfor.getText(
                                                """2.  Open Minecraft PE and go to the Profile section""",
                                                "asset/image/minecraft-1-19-80 2.png"),
                                            SizedBox(
                                                height: ScreenSize
                                                        .horizontalBlockSize! *
                                                    5),
                                            controllerfor.getText(
                                                """3.  Tap the character or the Edit icon""",
                                                "asset/image/aid2925660-v4-728px-Change-Your-Skin-in-Minecraft-PE-Step-3-Version-6 1.png"),
                                            SizedBox(
                                                height: ScreenSize
                                                        .horizontalBlockSize! *
                                                    5),
                                            controllerhelptext.getText(
                                                """4. Go to the Classic Skins section and select Owned"""),
                                            SizedBox(
                                                height: ScreenSize
                                                        .horizontalBlockSize! *
                                                    5),
                                            controllerfor.getText(
                                                """5. Tap the Import icon and select your new skin""",
                                                "asset/image/image 5.png"),
                                            SizedBox(
                                                height: ScreenSize.fSize_80()),
                                          ])),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          banner.getBN('/Help')
        ],
      ),
    );
  }

  var TEXT = [
    "Mods",
    "Maps",
    "Textures",
    "Shaders",
    "Skins",
  ].obs;
}
