import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'classobject/staticdata.dart';
class imageManagerHorizontal extends StatefulWidget {
  const imageManagerHorizontal({super.key});

  @override
  State<imageManagerHorizontal> createState() => _imageManagerHorizontalState();
}

class _imageManagerHorizontalState extends State<imageManagerHorizontal> {
  String androidVersion = 'Unknown';
  int sdkInt = 0 ;
  List<XFile> multipleImages =Data.multipleImage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAndroidVersion();
  }

  @override
  Future<void> checkAndroidVersion() async {
    var androidInfo = await DeviceInfoPlugin().androidInfo;

    sdkInt = androidInfo.version.sdkInt;
    print(sdkInt);
    // Android 9 (SDK 28), Xiaomi Redmi Note 7
  }
  @override
  void dispose() {
    // TODO: implement dispose
    multipleImages.clear();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double width;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
              if(constraints.maxWidth < 800){
                width = MediaQuery.sizeOf(context).width;
                if(constraints.maxWidth<350) {
                  return mainscreen(width, context, 1);
                }else{
                  return mainscreen(width, context, 2);
                }
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
            }
            )
        )
    );
  }
  thumbnail(double width,File imgs){
    return  Container(
      width: width*0.9,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(234, 234, 234, 1.0),
          borderRadius: BorderRadius.circular(10)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: AspectRatio(
          aspectRatio: 4/3,
          child: Image.file(imgs,fit: BoxFit.cover,),
        ),
      ),
    );
  }
  Future<void> _pickImageFromGallery_cover(int index) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      multipleImages[index] = pickedFile!;
    });
  }
 mainscreen(double width, BuildContext context, int g) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height:MediaQuery.sizeOf(context).height,
      child: Column(
        children: [
          Header(width),
          Expanded(
            child: Container(
              width: width*0.9,
              height:MediaQuery.sizeOf(context).height,
              child: SingleChildScrollView(
                child: Column(
                  children: multipleImages.asMap().entries.map((entry) {
                    int index = entry.key;   // This is the index of the current item
                    var e = entry.value;     // This is the current item

                    return GestureDetector(
                      onTap: () async {
                        // Now you have access to the index inside the onTap callback
                        if(Platform.isAndroid) {
                          if (sdkInt < 33) {
                            print("android 12");
                            var photo = await Permission.manageExternalStorage.status;
                            if (photo.isGranted) {
                              _pickImageFromGallery_cover(index);
                            } else if (photo.isPermanentlyDenied) {
                              openAppSettings();
                            } else {
                              await Permission.manageExternalStorage.request();
                              _pickImageFromGallery_cover(index);
                            }
                          }else{
                            print("android 13");
                            var photo = await Permission
                                .photos.status;
                            if (photo.isGranted) {
                              _pickImageFromGallery_cover(index);
                            } else if (photo.isPermanentlyDenied) {
                              openAppSettings();
                            } else {
                              await Permission.photos.request();
                              _pickImageFromGallery_cover(index);
                            }
                          }

                        }
                      },
                      child: Container(
                        child: thumbnail(width,File(e.path)),
                      ),
                    );
                  }).toList()

                ),
              ),
            ),
          ),
        ],
      ),

    );
 }
  Header(double width) {
    return Container(
        height: 50,
        margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: (){

                },
                child: Icon(Icons.arrow_back_ios,size: 28,color: Color.fromRGBO(255, 75, 75, 1.0),)),
            Text("Manage Images",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
            Text("",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
          ],
        )
    );
  }
}
