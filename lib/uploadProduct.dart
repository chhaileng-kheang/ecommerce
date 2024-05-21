import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:ecomerce/customWidget/widgetSize.dart';
import 'package:ecomerce/classobject/staticdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
class uploadProduct extends StatefulWidget {
  uploadProduct({super.key});
  late double size = 10;
  late double size2 = 10;
  late bool vi = true;
  late bool hiz = false;
  late double thumbnail = 10;
  late double thumbnail1 = 10;
  late bool isImageDES = false;
  @override
  State<uploadProduct> createState() => _uploadProductState();
}

class _uploadProductState extends State<uploadProduct> {
  int sdkInt = 0 ;
  Future<void> checkAndroidVersion() async {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    sdkInt = androidInfo.version.sdkInt;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAndroidVersion();
  }
  bool status = false;
  var status2 = false;
  List<XFile> multipleImage= [];
  File? ImgFile,ImgDes;
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

  Header(double width) {
    return Container(
        height: 50,
        margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios_sharp,size: 28,color: Color.fromRGBO(255, 75, 75, 1.0),)),
            Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text("Upload",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),)),
            InkWell(
              onTap: (){
                Get.toNamed("/login");
              },
              child: Container(
                padding: const EdgeInsets.only(left: 15,bottom: 8,top: 8,right: 15),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Text("Post",style: GoogleFonts.montserrat(textStyle : const TextStyle(
                  color: Colors.white

                )),),
              )
            )
          ],
        )
    );
  }
  mainscreen(double width, BuildContext context, int i) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Header(width),
        const SizedBox(height: 20,),
        Expanded(child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      WidgetSize(
                        onChange: (Size size){
                          setState(() {
                            widget.size2 = size.width.toDouble();
                          });
                        },
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              widget.vi = true;
                              widget.hiz = false;
                            });

                          },
                          child: const Text("3:4 (vertical)"),
                        ),
                      ),
                      Visibility(
                        visible: widget.vi == true ? true : false ,
                        child: Container(
                          margin: const EdgeInsets.only(top: 5),
                          width: widget.size,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 15,),
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    width: 5, height: 20,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                    ),

                  ),
                  const SizedBox(width: 15,),
                  Column(
                    children: [
                      WidgetSize(
                        onChange: (Size size){
                          setState(() {
                            widget.size = size.width.toDouble();
                          });


                        },
                        child: InkWell(
                          onTap: (){

                            setState(() {
                              widget.vi = false;
                              widget.hiz = true;

                            });

                          },
                          child: const Text("4:3 (horizontal)"),
                        ),
                      ),
                      Visibility(
                        visible: widget.hiz == true ? true : false ,
                        child: Container(
                          margin: const EdgeInsets.only(top: 5),
                          width: widget.size,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              if(widget.vi == true)...[

                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: width * 0.9,

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WidgetSize(onChange: (Size size){
                              widget.thumbnail = size.width.toDouble();
                            },
                                child: GestureDetector(
                                  onTap: () async {
                                    if(Platform.isAndroid)  {

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
                                  child: Container(
                                    child: ImgFile == null
                                        ? WidgetSize(
                                      onChange: (size){
                                        widget.thumbnail1 = size.height.toDouble();
                                      },
                                          child: Container(
                                            width: width*0.6,
                                            decoration: BoxDecoration(
                                          color: const Color.fromRGBO(234,234,234,1),
                                          borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: const AspectRatio(
                                          aspectRatio: 3/4,
                                          child: Center(child: Icon(Icons.image_outlined,size: 36,)),),
                                          ),
                                        )
                                        : WidgetSize(
                                           onChange: (size){
                                             widget.thumbnail1 = size.height.toDouble();
                                             },
                                          child: SizedBox(
                                            width: width*0.6,
                                            child: AspectRatio(
                                          aspectRatio: 3/4,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.file(ImgFile!, fit: BoxFit.cover,),
                                          ),
                                            ),
                                          ),
                                        ),
                                  ),
                                )

                            ),
                            multipleImage.length <= 0 ?
                            Expanded(
                              child: GestureDetector(
                                onTap: () async{
                                  if(Platform.isAndroid) {
                                    if (sdkInt < 33) {
                                      var photo = await Permission.manageExternalStorage.status;
                                      if (photo.isGranted) {
                                        _pickMultipleImage();
                                      } else if (photo.isPermanentlyDenied) {
                                        openAppSettings();
                                      } else {
                                        await Permission.manageExternalStorage.request();
                                        _pickMultipleImage();
                                      }
                                    }else{
                                      var photo = await Permission
                                          .photos.status;
                                      if (photo.isGranted) {
                                        _pickMultipleImage();
                                      } else if (photo.isPermanentlyDenied) {
                                        openAppSettings();
                                      } else {
                                        await Permission.photos.request();
                                        _pickMultipleImage();
                                      }
                                    }
                                  }
                                },
                                child: Container(
                                  width: width*0.28,
                                  height:  widget.thumbnail1,
                                  margin: const EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(234,234,234,1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Icon(Icons.add,size: 26,),
                                  ),
                                ),
                              ),
                            ):
                            Expanded(
                              child: Container(
                                height:  widget.thumbnail1,
                                margin: const EdgeInsets.only(left: 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: multipleImage.asMap().entries.map((entry) {
                                            int index = entry.key;   // This is the index of the current item
                                            var e = entry.value;
                                            return   Stack(
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    // Now you have access to the index inside the onTap callback
                                                    if(Platform.isAndroid) {
                                                      if (sdkInt < 33) {
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
                                                    margin: EdgeInsets.only(bottom:width*0.02),
                                                    width: width*0.28,
                                                    child: AspectRatio(
                                                      aspectRatio: 3/4,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(10),
                                                        child: Image.file(File(e.path), fit: BoxFit.cover,),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                    top: 2,left: 2,
                                                    child: GestureDetector(
                                                      onTap: (){
                                                        setState(() {
                                                          multipleImage.removeAt(index);
                                                        });
                                                      },
                                                      child: Container(
                                                          padding: const EdgeInsets.all(2),
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(100),
                                                            color: Colors.white.withOpacity(0.6),
                                                          ),
                                                          child: const Icon(Icons.close)
                                                      ),
                                                    )
                                                )
                                              ],
                                            );
                                          }).toList()
                                      ),
                                      multipleImage.length < 5 ?
                                      GestureDetector(
                                        onTap: () async{
                                          if(Platform.isAndroid) {

                                            if (sdkInt < 33) {
                                              var photo = await Permission.manageExternalStorage.status;
                                              if (photo.isGranted) {
                                                _pickMultipleImage();
                                              } else if (photo.isPermanentlyDenied) {
                                                openAppSettings();
                                              } else {
                                                await Permission.manageExternalStorage.request();
                                                _pickMultipleImage();
                                              }
                                            }else{
                                              var photo = await Permission
                                                  .photos.status;
                                              if (photo.isGranted) {
                                                _pickMultipleImage();
                                              } else if (photo.isPermanentlyDenied) {
                                                openAppSettings();
                                              } else {
                                                await Permission.photos.request();
                                                _pickMultipleImage();
                                              }
                                            }
                                          }
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(top: 5, bottom: 5),
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(234,234,234,1),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: const Icon(Icons.add,color: Colors.black,size: 26,),
                                        ),
                                      ) : const SizedBox(height: 0,)
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(left: 10,top: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black38,
                                    offset: Offset(1,1),
                                    spreadRadius: 1,
                                    blurRadius: 1
                                )]
                          ),
                          child: const Icon(Icons.edit_rounded),
                        ),
                      ],
                    ),
                  ),
                )

              ]else...[
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: width * 0.9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WidgetSize(onChange: (Size size){
                              widget.thumbnail = size.width.toDouble();
                            },
                              child: GestureDetector(
                                onTap: () async {
                                  if(Platform.isAndroid)  {

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
                                child: Container(
                                  child: ImgFile == null
                                      ? Container(
                                    width: width*0.9,
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(234,234,234,1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const AspectRatio(
                                      aspectRatio: 4/3,
                                      child: Center(child: Icon(Icons.image_outlined,size: 36,)),
                                    ),
                                  )
                                      : SizedBox(
                                    width: width*0.9,
                                    child: AspectRatio(
                                      aspectRatio: 4/3,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(ImgFile!, fit: BoxFit.cover,),
                                      ),
                                    ),
                                  ),
                                ),
                              )

                            ),
                           multipleImage.length <= 0 ?
                           GestureDetector(
                             onTap: () async{
                               if(Platform.isAndroid) {

                                 if (sdkInt < 33) {
                                   var photo = await Permission.manageExternalStorage.status;
                                   if (photo.isGranted) {
                                     _pickMultipleImage();
                                   } else if (photo.isPermanentlyDenied) {
                                     openAppSettings();
                                   } else {
                                     await Permission.manageExternalStorage.request();
                                     _pickMultipleImage();
                                   }
                                 }else{
                                   var photo = await Permission
                                       .photos.status;
                                   if (photo.isGranted) {
                                     _pickMultipleImage();
                                   } else if (photo.isPermanentlyDenied) {
                                     openAppSettings();
                                   } else {
                                     await Permission.photos.request();
                                     _pickMultipleImage();
                                   }
                                 }
                               }
                             },
                             child: Container(
                               width: width*0.9,
                               height: 100,
                               margin: const EdgeInsets.only(top: 10),
                               decoration: BoxDecoration(
                                 color: const Color.fromRGBO(234,234,234,1),
                                 borderRadius: BorderRadius.circular(10),
                               ),
                               child: const Center(
                                 child: Icon(Icons.add,size: 26,),
                               ),
                             ),
                           ):
                           Container(
                             margin: const EdgeInsets.only(top: 10),
                             child: SingleChildScrollView(
                               scrollDirection: Axis.horizontal,
                               child: Row(
                                 children: [
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: multipleImage.asMap().entries.map((entry) {
                                       int index = entry.key;   // This is the index of the current item
                                       var e = entry.value;
                                       return   Stack(
                                         children: [
                                           GestureDetector(
                                             onTap: () async {
                                               // Now you have access to the index inside the onTap callback
                                               if(Platform.isAndroid) {
                                                 if (sdkInt < 33) {
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
                                               margin: EdgeInsets.only(right:width*0.01),
                                               width: width*0.3,
                                               child: AspectRatio(
                                                 aspectRatio: 4/3,
                                                 child: ClipRRect(
                                                   borderRadius: BorderRadius.circular(10),
                                                   child: Image.file(File(e.path), fit: BoxFit.cover,),
                                                 ),
                                               ),
                                             ),
                                           ),
                                           Positioned(
                                             top: 2,left: 2,
                                               child: GestureDetector(
                                                 onTap: (){
                                                   setState(() {
                                                     multipleImage.removeAt(index);
                                                   });
                                                 },
                                                 child: Container(
                                                   padding: const EdgeInsets.all(2),
                                                   decoration: BoxDecoration(
                                                     borderRadius: BorderRadius.circular(100),
                                                     color: Colors.white.withOpacity(0.6),
                                                   ),
                                                 child: const Icon(Icons.close)
                                                                                              ),
                                               )
                                           )
                                         ],
                                       );
                                     }).toList()
                                   ),
                                   multipleImage.length < 5 ?
                                   GestureDetector(
                                     onTap: () async{
                                       if(Platform.isAndroid) {

                                         if (sdkInt < 33) {
                                           var photo = await Permission.manageExternalStorage.status;
                                           if (photo.isGranted) {
                                             _pickMultipleImage();
                                           } else if (photo.isPermanentlyDenied) {
                                             openAppSettings();
                                           } else {
                                             await Permission.manageExternalStorage.request();
                                             _pickMultipleImage();
                                           }
                                         }else{
                                           var photo = await Permission
                                               .photos.status;
                                           if (photo.isGranted) {
                                             _pickMultipleImage();
                                           } else if (photo.isPermanentlyDenied) {
                                             openAppSettings();
                                           } else {
                                             await Permission.photos.request();
                                             _pickMultipleImage();
                                           }
                                         }
                                       }
                                     },
                                     child: Container(
                                       margin: const EdgeInsets.only(left: 10),
                                       padding: const EdgeInsets.all(20),
                                       decoration: BoxDecoration(
                                         color: const Color.fromRGBO(234,234,234,1),
                                         borderRadius: BorderRadius.circular(10),
                                       ),
                                       child: const Icon(Icons.add,color: Colors.black,size: 26,),
                                     ),
                                   ) : const SizedBox(height: 0,)
                                 ],
                               ),
                             ),
                           )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(left: 10,top: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black38,
                                    offset: Offset(1,1),
                                    spreadRadius: 1,
                                    blurRadius: 1
                                )]
                          ),
                          child: const Icon(Icons.edit_rounded),
                        ),
                      ],
                    ),
                  ),
                )
              ],
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: width*0.9,
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [BoxShadow(
                        color: Colors.black38,
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                        offset: Offset(0,0)
                    )],
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: width*0.8,
                      child: TextField(
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          decoration: const InputDecoration(
                            enabled: true,
                            hintText: "Product title",
                            contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                            border: InputBorder.none,
                            prefixIconColor: Colors.black,
                          )
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: width*0.9,
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [BoxShadow(
                        color: Colors.black38,
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                        offset: Offset(0,0)
                    )],
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  children: [
                    SizedBox(
                        width: width*0.4,
                        child:   Autocomplete<String>(
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            if (textEditingValue.text == '') {
                              return Data.category;
                            }
                            return Data.category.where((element) {
                              return element.contains(textEditingValue.text.toLowerCase());
                            }
                            );
                          },
                          fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                            return TextFormField(
                              controller: textEditingController,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                                  border: InputBorder.none,
                                  prefixIconColor: Colors.black,
                                  hintText: 'Category',
                                  hintStyle: GoogleFonts.montserrat(
                                      fontSize: 14
                                  )
                              ),
                              focusNode: focusNode,
                              onFieldSubmitted: (String value) {
                                onFieldSubmitted();

                              },
                            );
                          },
                          onSelected: (String selection) {

                          },
                        )
                    ),

                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: width*0.9,
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [BoxShadow(
                        color: Colors.black38,
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                        offset: Offset(0,0)
                    )],
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width*0.6,
                      child: TextField(
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          decoration:  InputDecoration(
                            enabled: status2,
                            hintText: status2 ? "Price" : "Price Hidden",
                            contentPadding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                            border: InputBorder.none,
                            prefixIconColor: Colors.black,
                          )
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: FlutterSwitch(
                        width: 50.0,
                        height: 30.0,
                        valueFontSize: 25.0,
                        toggleSize: 25.0,
                        value: status2,
                        activeColor: Colors.black,
                        inactiveColor: Colors.black12,
                        inactiveToggleColor: Colors.black,
                        activeToggleColor: Colors.white,
                        borderRadius: 30.0,
                        showOnOff: false,
                        onToggle: (val) {
                          setState(() {
                            status2 = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: width*0.9,
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [BoxShadow(
                        color: Colors.black38,
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                        offset: Offset(0,0)
                    )],
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width*0.6,
                      child: TextField(
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          decoration: InputDecoration(
                            enabled: status,
                            hintText: status ? "Discount Price" : "Not Discount",
                            contentPadding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                            border: InputBorder.none,
                            prefixIconColor: Colors.black,
                          )
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: FlutterSwitch(
                        width: 50.0,
                        height: 30.0,
                        valueFontSize: 25.0,
                        toggleSize: 25.0,
                        value: status,
                        activeColor: Colors.black,
                        inactiveColor: Colors.black12,
                        inactiveToggleColor: Colors.black,
                        activeToggleColor: Colors.white,
                        borderRadius: 30.0,
                        showOnOff: false,
                        onToggle: (val) {
                          setState(() {
                            status = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: width*0.9,
                margin: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 15,right: 15,bottom: 8,top: 8),
                      decoration: BoxDecoration(
                        color: widget.isImageDES == false ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: WidgetSize(
                        onChange: (Size size){
                          setState(() {
                            widget.size2 = size.width.toDouble();
                          });


                        },
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              widget.isImageDES = false;
                            });

                          },
                          child: Text("Text Description",style: GoogleFonts.montserrat(textStyle : TextStyle(
                            color: widget.isImageDES != false ? Colors.black : Colors.white,
                            fontSize: 10
                          )),),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15,),
                    Container(
                      margin: const EdgeInsets.only(top: 2),
                      width: 5, height: 30,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)
                      ),

                    ),
                    const SizedBox(width: 15,),
                    Container(
                      padding: const EdgeInsets.only(left: 15,right: 15,bottom: 8,top: 8),
                      decoration: BoxDecoration(
                          color: widget.isImageDES != false ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: WidgetSize(
                        onChange: (Size size){
                          setState(() {
                            widget.size2 = size.width.toDouble();
                          });


                        },
                        child: InkWell(
                          onTap: (){
                            setState(() {

                              widget.isImageDES = true;
                            });

                          },
                          child: Text("Image Description",style: GoogleFonts.montserrat(textStyle : TextStyle(
                              color: widget.isImageDES == false ? Colors.black : Colors.white,
                            fontSize: 10
                          )),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if(widget.isImageDES == false)...[
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: width*0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [BoxShadow(
                          color: Colors.black38,
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                          offset: Offset(0,0)
                      )],
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: width*0.89,
                        margin: const EdgeInsets.only(top: 15),
                        child: TextField(
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            maxLines: 15,
                            decoration: const InputDecoration(
                              enabled: true,
                              hintText: "Description",
                              contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                              border: InputBorder.none,
                              prefixIconColor: Colors.black,
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ]else...[
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: width*0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [BoxShadow(
                          color: Colors.black38,
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                          offset: Offset(0,0)
                      )],
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: width*0.89,
                        margin: const EdgeInsets.only(top: 15),
                        child: TextField(
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            maxLines: 4,
                            decoration: const InputDecoration(
                              enabled: true,
                              hintText: "Short Description",
                              contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                              border: InputBorder.none,
                              prefixIconColor: Colors.black,
                            )
                        ),
                      ),
                    ],
                  ),
                ),
               ImgDes == null ? GestureDetector(
                  onTap: () async{
                    if(Platform.isAndroid) {

                      if (sdkInt < 33) {
                        var photo = await Permission.manageExternalStorage.status;
                        if (photo.isGranted) {
                          _pickImageFromDes();
                        } else if (photo.isPermanentlyDenied) {
                          openAppSettings();
                        } else {
                          await Permission.manageExternalStorage.request();
                          _pickImageFromDes();
                        }
                      }else{
                        var photo = await Permission
                            .photos.status;
                        if (photo.isGranted) {
                          _pickImageFromDes();
                        } else if (photo.isPermanentlyDenied) {
                          openAppSettings();
                        } else {
                          await Permission.photos.request();
                          _pickImageFromDes();
                        }
                      }
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 5),
                    width: width*0.9,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(234,234,234,1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.add,color: Colors.black,size: 26,),
                  ),
                ) :  Container(
                 width: width*0.9,
                 margin: const EdgeInsets.only(top: 15),
                 child: ClipRRect(
                     borderRadius: BorderRadius.circular(10),
                     child: Image.file(ImgDes!,fit: BoxFit.fitWidth,)),
               )

              ],
              const SizedBox(height: 150,)
            ],
          ),
        ) )
      ],

    );

  }
  Future<void> _pickImageFromGallery_cover(int index) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if(!multipleImage.contains(pickedFile)) {
        multipleImage[index] = pickedFile!;
      }
    });
  }
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      ImgFile = File(pickedFile!.path);
    });
  }
  Future<void> _pickImageFromDes() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      ImgDes = File(pickedFile!.path);
    });
  }
  Future<void> _pickMultipleImage() async{

    final List<XFile> selectedImages = await ImagePicker().pickMultiImage(limit: 5);
    if (selectedImages.isNotEmpty) {
      for(int i = 0 ; i < selectedImages.length ; i++) {
        if (multipleImage.length < 5) {
          if(!multipleImage.contains(selectedImages[i])) {
            multipleImage.add(selectedImages[i]);
          }else{
            showSimpleSnackbar(context, "Some Image is exist");
          }
        }else{
          showSimpleSnackbar(context, "Image available only 5 Item");
          break;
        }
      }
    }
    setState((){

    });
  }
  void showSimpleSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),  // Adjust the duration as needed
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
