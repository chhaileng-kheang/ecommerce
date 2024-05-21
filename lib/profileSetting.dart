import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
class profileSetting extends StatefulWidget {
  const profileSetting({super.key});

  @override
  State<profileSetting> createState() => _profileSettingState();
}

class _profileSettingState extends State<profileSetting> {
  String androidVersion = 'Unknown';

  int sdkInt = 0 ;

  Future<void> checkAndroidVersion() async {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    sdkInt = androidInfo.version.sdkInt;
  }
  File? _image,cover;

  @override
  void initState() {
    super.initState();
    checkAndroidVersion();
  }
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile!.path);
    });
  }
  Future<void> _pickImageFromGallery_cover() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      cover = File(pickedFile!.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    late double width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
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
    );
  }

  mainscreen(double width, BuildContext context, int g) {
   return Column(
      children: [
        Header(width),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
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
                              child: cover == null ? const Text("") : Image.file(cover!,fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 150,
                          child: SizedBox(
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
                                    margin: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(100)
                                    ),
                                    child: InkWell(
                                      onTap: () async {
                                        if(Platform.isAndroid) {

                                          if (sdkInt < 33) {
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

                                          margin: const EdgeInsets.only(top: 0,left: 0,right: 0),
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.bottomRight,
                                                  stops: const [
                                                    0.1,
                                                    0.9
                                                  ],
                                                  colors: [
                                                    Colors.black.withOpacity(.8),
                                                    Colors.white.withOpacity(.3)
                                                  ]),
                                              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(500), bottomRight: Radius.circular(500))
                                          ),
                                          child: Container(
                                              margin: const EdgeInsets.only(top: 150),
                                              child: const Center(child: Icon(Icons.camera_alt_outlined,color: Colors.white,))),
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
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 1,
                                      spreadRadius: 1,
                                      offset: Offset(1,1)
                                  )]
                              ),
                              child: const Icon(Icons.edit_rounded)))
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10,bottom: 5),
                  child: Text("Store_Name",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 2,bottom: 10),
                  child: Text("Membership : Free",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.red,fontWeight: FontWeight.w400,fontSize: 12)),),
                ),
                InkWell(
                  onTap: (){
                    Get.toNamed("/editinfo");
                  },
                  child: Container(
                    width: width*0.9,
                    margin: const EdgeInsets.only(top: 12),
                    padding: const EdgeInsets.only(left: 10,right: 10,bottom: 8,top: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0,0),
                            blurRadius: 0.5,
                            spreadRadius: 0.5
                        )]
                    ),
                    child: Text(
                      "Edit Store Information",
                      style: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed("/emailchange");
                  },
                  child: Container(
                    width: width*0.9,
                    margin: const EdgeInsets.only(top: 12),
                    padding: const EdgeInsets.only(left: 10,right: 10,bottom: 8,top: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0,0),
                              blurRadius: 0.5,
                              spreadRadius: 0.5
                          )]
                    ),
                    child: Text(
                      "Change Email",
                      style: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.toNamed("/changepassword");
                  },
                  child: Container(
                    width: width*0.9,
                    margin: const EdgeInsets.only(top: 12),
                    padding: const EdgeInsets.only(left: 10,right: 10,bottom: 8,top: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0,0),
                              blurRadius: 0.5,
                              spreadRadius: 0.5
                          )]
                    ),
                    child: Text(
                      "Change Password",
                      style: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
                Container(
                  width: width*0.9,
                  margin: const EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.only(left: 10,right: 10,bottom: 8,top: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0,0),
                            blurRadius: 0.5,
                            spreadRadius: 0.5
                        )]
                  ),
                  child: Text(
                    "Premium Subscription",
                    style: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400,color: Colors.red)),
                  ),
                ),
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    width:  width*0.9,
                    padding: const EdgeInsets.only(left: 25,right: 25,top: 8,bottom: 8),
                    margin: const EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(
                      child: Text(
                        "Sign Out",
                        style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

      ],
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
                 Get.back();
                },
                child: const Icon(Icons.arrow_back_ios,size: 28,color: Color.fromRGBO(255, 75, 75, 1.0),)),
            Text("Setting",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
            Text("",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
          ],
        )
    );
  }
}


