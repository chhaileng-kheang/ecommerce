import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:ecomerce/classobject/staticdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductObj{
  String product_title;
  String img;
  String price;
  String id;
  String category;
  String discount;
  String disbool;
  String derection;
  ProductObj({required this.product_title,required this.id,required this.img,required this.price,required this.category,required this.discount,required this.disbool,required this.derection});
}
class getxData extends GetxController{
  bool isshow = true;
  bool isshowtemp = false;
  String code = "";
  Color b_color = Colors.white;
  String imgpath = "";
  Widget? dynamicContainer;
  bool buttonEnabled = true;
  bool ispush = false;
  Uint8List? imageFile = Uint8List.fromList([11]);
  int showingElement = 0;
  bool isloading = false;
  double x = 0;
  double y = 0;

  String path = "";
    int countdown = 60;
  late Timer timer;
  void colorChanged(){
    if(b_color == Colors.black){
      b_color = Colors.white;
    }else{
      b_color = Colors.black;
    }
    update();
  }
  bool status = false;
  int selectedIndex = 0;
  bool isExpanded = false;
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(Data.ip +'/eiivanapiserver/category.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'accesstoken_auth': '0cB!d*oKx291-D8%D&Ji+a2I!KcqSJn\$-#ns2j2%lmowH2H1NjdK3*jd2n3sd3xHS291e+uj2^!dfcfh-*hjd\$8#dhbhc-)uAh+!@lJ7-#LzV4jx%1k!k1ow-#ns2j2%9e+ujf\$8#df='
        });

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> categoryList = jsonData['data'][0]['category'];
      Data.category = categoryList.map((category) => category.toString()).toList();
      update();
    } else {
      throw Exception('Failed to load data');
    }
  }
  void disableButton() {
      buttonEnabled = false;


    // Set a timer for 3 minutes
    Timer(Duration(minutes: 1), () {

        buttonEnabled = true;
    });

  }
  void showcard() {
    isshowtemp = true;
    // Set a timer for 3 minutes
    Timer(Duration(seconds: 5), () {

      isshowtemp = false;
      update();
    });
    update();
  }
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {

        if (countdown > 0) {
          countdown--;
          update();
        } else {
          timer.cancel();
        }
        update();
      });
    update();
  }

  String formatTime(int seconds) {
    int minutes = (seconds / 60).truncate();
    int remainingSeconds = seconds % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }
}