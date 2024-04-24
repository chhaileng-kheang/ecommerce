import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:custom_qr_generator/custom_qr_generator.dart';
import 'package:custom_qr_generator/options/options.dart';
import 'package:custom_qr_generator/qr_painter.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:image/image.dart' as img;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce/object.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher.dart';
class viewImg extends StatelessWidget {
   viewImg({super.key});

  @override
  Widget build(BuildContext context) {
    double width;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(

          child: Scaffold(
        body: LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
          if(constraints.maxWidth < 800){
            width = MediaQuery.sizeOf(context).width;

            return imgviewer(width, context);
          }else{
            width = 800;
            return Center(
              child: Container(
                  color: Colors.white,
                  child:  imgviewer(width, context)

              ),

            );
          }
        },)
      )
      ),
    );
  }
  final screenshotController = ScreenshotController();
  imgviewer(double width,BuildContext context) {
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1603787081207-362bcef7c144?q=80&w=2565&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1606890657196-d3da9fda15ef?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1713458180041-a6f7a72c9707?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];
    getxData controller = Get.put(getxData());
    return GetBuilder<getxData>(builder: (_){
      return Container(
          width: width,
          height: MediaQuery.sizeOf(context).height,
          color: Colors.black,
          child: Stack(
            children: [
              GestureDetector(
                onTap: (){
                  if(controller.isshow == false){
                    controller.isshow = true;
                  }else{
                    controller.isshow= false;
                  }
                  controller.update();

                },
                child: Screenshot(
                  controller: screenshotController,
                  child: Container(
                    width: width,

                    child: SingleChildScrollView(
                      physics: PageScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:imgList
                            .map((item) => SizedBox(
                                width: width,
                                child: PhotoView(
                                  imageProvider: NetworkImage(
                                    item,
                                  ),
                                  enableRotation: false,
                                  minScale: PhotoViewComputedScale.contained,
                                  maxScale: PhotoViewComputedScale.contained, // Disable zoom out
                                )
                            )

                        ).toList(),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 20,
                  left: 15,
                  child: Visibility(
                    visible: controller.isshow,
                    child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close,color: Colors.white,)),
                  )
              ),
              Positioned(
                  top: 20,
                  right: 15,
                  child: Visibility(
              visible: controller.isshow,
                    child: Icon(Icons.link,color: Colors.white,),
              )
              ),
              Positioned(
                  top: 100,
                  right: 15,
                  child: Visibility(
                    visible: controller.isshowtemp,
                    child: GestureDetector(
                      onTap: () async {
                        await OpenFile.open(path);
                      },
                      child: Container(
                          height: 100,
                          width: 100,
                          child: Image.memory(controller.imageFile!)),
                    )
                  )
              ),
              Positioned(
                  bottom: 120,
                  left: 30,
                  right: 30,
                  child: Visibility(
                    visible: controller.isshow,
                    child: Container(
                      width: width,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: controller.isloading == true ? () {

                            }: ()  async {
                              controller.isloading = true;
                              controller.update();
                          screenshotController.capture().then((value) => {
                            controller.imageFile = value,
                          controller.update(),
                          screenshotController.captureFromWidget(
                            Container(
                              width: 400,
                              color: Colors.white,
                                child: AspectRatio(
                                  aspectRatio: 3/4,
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              child: AspectRatio(aspectRatio: 1/1,
                                                child: Image.memory(controller.imageFile!,fit: BoxFit.cover),
                                                ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 20,top: 20,right: 20),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("ID: 100541242",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 10,color: Colors.black,fontWeight: FontWeight.w400)),),
                                                      Text("Vetana",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold)),),
                                                      Text("Sneaker 001",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400)),),
                                                      Row(
                                                        children: [
                                                          Text("\$ 275.00",style: GoogleFonts.montserrat(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black,textStyle: TextStyle(decoration: TextDecoration.lineThrough,decorationThickness: 1.5,decorationColor: Colors.red))),
                                                          SizedBox(width: 10,),
                                                          Text("\$ 125.00",style: GoogleFonts.montserrat(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.redAccent),),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      CustomPaint(
                                                        // painter: Painter(),
                                                        painter: QrPainter(
                                                            data: 'https://youtube.com',
                                                            options:  QrOptions(
                                                                shapes: QrShapes(
                                                                    darkPixel: QrPixelShapeRoundCorners(cornerFraction: .5),
                                                                    frame:  QrFrameShapeRoundCorners(cornerFraction: .25),
                                                                    ball: QrBallShapeRoundCorners(cornerFraction: .25)
                                                                ),
                                                                colors: QrColors(
                                                                    dark: QrColorLinearGradient(
                                                                        colors: [
                                                                          Color(0xFF444100),
                                                                          Color(0xFF0a2108)
                                                                        ],
                                                                        orientation: GradientOrientation.leftDiagonal
                                                                    )
                                                                )
                                                            )),
                                                        size: const Size(80, 80),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ],
                                      ),
                                      Positioned(
                                        top: 340,
                                        child:   Container(
                                          width: 380,
                                          child: Center(
                                            child: ClipRRect(
                                            borderRadius: BorderRadius.circular(100),
                                            child: Image.asset("asset/logo1.png",width: 60,height: 60,fit: BoxFit.cover,),
                                            ),
                                          ),
                                        ),)
                                    ],
                                  ),
                                ),
                            )).then((value) => {
                          controller.imageFile = value,
                          controller.update(),
                          // Save image to a file (see platform-specific methods below)
                          saveImageToDevice(controller.imageFile!),
                          controller.isloading = false, controller.showcard()
                          })
                          });


                          },
                            child: Container(
                              padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(15, 15, 15, 0.7),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white30,
                                        blurRadius: 0.5,
                                        offset: ui.Offset(0,0),
                                        spreadRadius: 0.5
                                    )
                                  ]
                              ),
                              child: Row(
                                children: [
                                  controller.isloading == false ? Icon(Icons.save_alt,color: Colors.white, size: 24,) : Container(width: 10,height: 10, child: CircularProgressIndicator(color: Colors.white,)),
                                  controller.isloading == false ?  SizedBox(width: 10,) :  SizedBox(width: 0,) ,
                                  Text(controller.isloading == false ? "Save" : "",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white)),)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  )),
              Positioned(
                bottom: 0,
                child: Visibility(
                  visible: controller.isshow,
                  child:  RepaintBoundary(
                    key: containerKey,
                    child: Container(
                      width: width,
                      height: 100,
                      padding: EdgeInsets.only(left: 15,right: 15,top: 5),
                      color: Color.fromRGBO(15, 15, 15, 0.7),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sneaker 001",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold)),),
                              Row(
                                children: [
                                  Text("\$ 275.00",style: GoogleFonts.montserrat(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white,textStyle: TextStyle(decoration: TextDecoration.lineThrough,decorationThickness: 1.5,decorationColor: Colors.red))),
                                  SizedBox(width: 10,),
                                  Text("\$ 125.00",style: GoogleFonts.montserrat(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.redAccent),),
                                ],
                              ),
                              Text("1,695 view",style: GoogleFonts.montserrat(fontSize: 11,fontWeight: FontWeight.w200,color: Colors.white),),
                            ],
                          ),
                          Container(
                            child: Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network("https://images.unsplash.com/photo-1605326152964-56fb991b95ff?q=80&w=2160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",width: 50,height: 50,fit: BoxFit.cover,),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              )
            ],
          )
      );

    });
  }
  final GlobalKey containerKey = GlobalKey();
  Future<Uint8List?> captureWidgetAsImage(GlobalKey key) async {
    try {
      RenderRepaintBoundary boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0); // Adjust pixelRatio as needed
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData!.buffer.asUint8List();
    } catch (e) {
      print("Error capturing widget as image: $e");
      return null;
    }
  }

  void saveImage() async {
    Uint8List? imageBytes = await captureWidgetAsImage(containerKey);
    if (imageBytes != null) {
      await saveImageToDevice(imageBytes);
    }
  }
   Future<void> saveImageToDevice(Uint8List imageBytes) async {
     int sdkInt = 0 ;
     var androidInfo = await DeviceInfoPlugin().androidInfo;

     sdkInt = androidInfo.version.sdkInt;

     if(Platform.isAndroid) {

       if (sdkInt < 33) {
         print("android 12");
         var photo = await Permission.manageExternalStorage.status;
         if (photo.isGranted) {

           SaveImageforPer(imageBytes);
         } else if (photo.isPermanentlyDenied) {
           openAppSettings();
         } else {
           await Permission.manageExternalStorage.request();

           SaveImageforPer(imageBytes);
         }
       }else{
         print("android 13");
         var photo = await Permission
             .photos.status;
         if (photo.isGranted) {
           SaveImageforPer(imageBytes);
         } else if (photo.isPermanentlyDenied) {
           openAppSettings();
         } else {
           await Permission.photos.request();
           SaveImageforPer(imageBytes);
         }
       }
     }
  }
  String path = "";
  Future<void> SaveImageforPer(Uint8List imageBytes) async{
    final directory = await getDownloadsDirectory();
    final imagePath = '${directory!.path}/captured_image.png';
    path = imagePath;
    File(imagePath).writeAsBytesSync(imageBytes);

    // Save the image to the gallery
    final result = await ImageGallerySaver.saveFile(imagePath);
    if (result['isSuccess']) {
      print('Image saved to gallery');
    } else {
      print('Failed to save image: ${result['error']}');
    }
    print('Image saved to: $imagePath');
  }

}
