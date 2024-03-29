import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
class imageManagerHorizontal extends StatefulWidget {
  const imageManagerHorizontal({super.key});

  @override
  State<imageManagerHorizontal> createState() => _imageManagerHorizontalState();
}

class _imageManagerHorizontalState extends State<imageManagerHorizontal> {
  String androidVersion = 'Unknown';
  int sdkInt = 0 ;
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  File? _image,cover;
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
  thumbnail(double width){
    return  Container(
      width: width*0.9,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(234, 234, 234, 1.0),
          borderRadius: BorderRadius.circular(10)
      ),
      child: InkWell(
        onTap: () async{
          if(Platform.isAndroid) {

            if (sdkInt < 33) {
              print("android 12");
              var photo = await Permission.manageExternalStorage.status;
              if (photo.isGranted) {
                _pickImageFromGallery_cover();
              } else if (photo.isPermanentlyDenied) {
                openAppSettings();
              } else {
                await Permission.manageExternalStorage.request();
                _pickImageFromGallery_cover();
              }
            }else{
              print("android 13");
              var photo = await Permission
                  .photos.status;
              if (photo.isGranted) {
                _pickImageFromGallery_cover();
              } else if (photo.isPermanentlyDenied) {
                openAppSettings();
              } else {
                await Permission.photos.request();
                _pickImageFromGallery_cover();
              }
            }
          }
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: AspectRatio(
            aspectRatio: 4/3,
            child: cover == null ? Image.network("https://i.pinimg.com/736x/9d/23/ed/9d23eda27be19fc4d2d907d62d5d5e8b.jpg",fit: BoxFit.cover,) : Image.file(cover!,fit: BoxFit.cover,),
          ),
        ),
      ),
    );
  }
  Future<void> _pickImageFromGallery_cover() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      cover = File(pickedFile!.path);
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
                  children: [
                    thumbnail(width),

                    thumbnail(width),

                    thumbnail(width),
                  ],
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
