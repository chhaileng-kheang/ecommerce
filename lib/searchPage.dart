import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  String androidVersion = 'Unknown';
  int sdkInt = 0 ;
  Future<void> checkAndroidVersion() async {
    var androidInfo = await DeviceInfoPlugin().androidInfo;

    sdkInt = androidInfo.version.sdkInt;
    print(sdkInt);
    // Android 9 (SDK 28), Xiaomi Redmi Note 7
  }
  @override
  Widget build(BuildContext context) {
    double width;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          body: LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
            if(constraints.maxWidth < 800){
              width = MediaQuery.sizeOf(context).width;
              return mainscreen(width, context,2);
            }else{
              width = 800;
              return Center(
                child: Container(
                  color: const Color.fromRGBO(255, 255, 255, 1.0),
                  width: MediaQuery.sizeOf(context).width,
                  child: mainscreen(width, context,3),

                ),

              );
            }
          },)

        ),
      ),
    );
  }


 mainscreen(double width, BuildContext context, int i) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        children: [
          Header(width),
        ],
      ),
    );

  }

  Header(double width) {
    return Container(
        height: 50,
        margin: const EdgeInsets.only(left: 20,right: 5,top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                    child: const Icon(Icons.arrow_back_ios))),
            const SizedBox(width: 10,),
            SearchBars(width*0.85)
          ],

        )
    );
  }

  SearchBars(double width){
    return   Container(
      margin: const EdgeInsets.only(top: 5),
      width: width*0.9,
      height: 40,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(234, 234, 234, 1.0),
          borderRadius: BorderRadius.circular(5)
      ),
      child: InkWell(
        onTap: (){},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width*0.67 ,
              height: 40,
              child: TextField(
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  decoration: const InputDecoration(
                    enabled: true,
                    hintText: "Search",
                    contentPadding: EdgeInsets.only(left: 10,right: 10,top: 5),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.black,
                  )
              ),
            ),
            Hero(
              tag: "search",
              child: Container(
                  margin: const EdgeInsets.only(right: 0),
                  child: IconButton(onPressed: () async{
                    if(Platform.isAndroid) {

                      if (sdkInt < 33) {
                        print("android 12");
                        var photo = await Permission.camera.status;
                        if (photo.isGranted) {
                          Get.toNamed("/qrscanner");
                        } else if (photo.isPermanentlyDenied) {
                          openAppSettings();
                        } else {
                          await Permission.camera.request();
                          Get.toNamed("/qrscanner");
                        }
                      }else{
                        print("android 13");
                        var photo = await Permission
                            .camera.status;
                        if (photo.isGranted) {
                          Get.toNamed("/qrscanner");
                        } else if (photo.isPermanentlyDenied) {
                          openAppSettings();
                        } else {
                          await Permission.camera.request();
                          Get.toNamed("/qrscanner");
                        }
                      }
                    }

                    },
                      icon: const Icon(Icons.fit_screen_outlined))),
            )
          ],
        ),
      ),
    );
  }
}
