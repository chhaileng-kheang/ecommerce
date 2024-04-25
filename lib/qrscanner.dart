import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
class qrCam extends StatefulWidget {
  const qrCam({super.key});

  @override
  State<qrCam> createState() => _qrCamState();
}

class _qrCamState extends State<qrCam> {



  @override
  Widget build(BuildContext context) {
    double width;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(
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
      ),
    );
  }
}

mainscreen(double width,BuildContext context, int g){
return  Column(
    children: [
      Expanded(
        child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: width,
            child: QRScannerScreen()),
      )
    ],
  );
}

class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  late QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late String data = "aa";

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            _buildQrView(context),
            Positioned(
              top: 20,
              left: 20,
              child: IconButton(onPressed: (){
                Navigator.pop(context);

              },icon: Icon(Icons.close,color: Colors.white,),)
            )
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      overlay: QrScannerOverlayShape(
        borderColor: Colors.white.withOpacity(1), // Adjust opacity or use a darker shade
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: 300,
      ),
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // Handle scanned QR code data here
      setState(() {
        data = scanData.code!;
        if(data.contains("evagoo")){
          Get.toNamed("/product?id=10199201");
        }
      });

    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
