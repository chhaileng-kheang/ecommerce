import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class uploadImage extends StatefulWidget {
  const uploadImage({super.key});

  @override
  State<uploadImage> createState() => _uploadImageState();
}

class _uploadImageState extends State<uploadImage> {
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

  Future<void> checkAndroidVersion() async {
    var androidInfo = await DeviceInfoPlugin().androidInfo;

    sdkInt = androidInfo.version.sdkInt;
    print(sdkInt);
    // Android 9 (SDK 28), Xiaomi Redmi Note 7
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

  mainscreen(double width, BuildContext context, int g) {

    return Container(
      child: Column(
        children: [
          Header(width),
          Container(
            height: 400,
            child: Stack(
              children: [
                Container(
                  width: width*0.9,
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
                        child: cover == null ? Text("") : Image.file(cover!,fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  child: Container(
                    width: width*0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: Container(
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: InkWell(
                              onTap: () async {
                                if(Platform.isAndroid) {

                                  if (sdkInt < 33) {
                                    print("android 12");
                                    var photo = await Permission.manageExternalStorage.status;
                                    if (photo.isGranted) {
                                      _pickImageFromGallery();
                                    } else if (photo.isPermanentlyDenied) {
                                      openAppSettings();
                                    } else {
                                      await Permission.manageExternalStorage.request();
                                      _pickImageFromGallery();
                                    }
                                  }else{
                                    print("android 13");
                                    var photo = await Permission
                                        .photos.status;
                                    if (photo.isGranted) {
                                      _pickImageFromGallery();
                                    } else if (photo.isPermanentlyDenied) {
                                      openAppSettings();
                                    } else {
                                      await Permission.photos.request();
                                      _pickImageFromGallery();
                                    }
                                  }
                                }
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: _image == null ? Container(

                                  margin: EdgeInsets.only(top: 0,left: 0,right: 0),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomRight,
                                          stops: [
                                            0.1,
                                            0.9
                                          ],
                                          colors: [
                                            Colors.black.withOpacity(.8),
                                            Colors.white.withOpacity(.3)
                                          ]),
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(500), bottomRight: Radius.circular(500))
                                  ),
                                  child: Container(
                                      margin: EdgeInsets.only(top: 150),
                                      child: Center(child: Icon(Icons.camera_alt_outlined,color: Colors.white,))),
                                ) : Image.file(_image!,fit: BoxFit.cover,),
                              ),
                            ),
                          ),
                        ),
                      ],

                    ),
                  )
                ),
                Positioned(
                    right: 10,top: 10,
                    child: Container(
                      padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
                            color: Colors.black38,
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: Offset(1,1)
                          )]
                        ),
                        child: Icon(Icons.edit_rounded)))
              ],
            ),
          ),
          InkWell(
            onTap: (){

            },
            child: Container(
              width:  width*0.9,
              padding: EdgeInsets.only(left: 25,right: 25,top: 15,bottom: 15),
              margin: EdgeInsets.only(left: 5,top: 5),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Center(
                child: Text(
                  "Next",
                  style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white)),
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
            Text("Upload Images",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
            Text("",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
          ],
        )
    );
  }
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile!.path);
    });
  }
  Future<void> _pickImageFromGallery_cover() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      cover = File(pickedFile!.path);
    });
  }
}
