import 'dart:async';

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
  String code = "";
  Color b_color = Colors.white;
  bool buttonEnabled = true;
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
  void disableButton() {
      buttonEnabled = false;


    // Set a timer for 3 minutes
    Timer(Duration(minutes: 1), () {

        buttonEnabled = true;
    });
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