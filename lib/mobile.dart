import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce/changePassword.dart';
import 'package:ecomerce/homePage.dart';
import 'package:ecomerce/leftmenu.dart';
import 'package:ecomerce/merchanttab.dart';
import 'package:ecomerce/classobject/object.dart';
import 'package:ecomerce/qrscanner.dart';
import 'package:ecomerce/searchPage.dart';
import 'package:ecomerce/classobject/staticdata.dart';
import 'package:ecomerce/storelist.dart';
import 'package:ecomerce/whitelist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'customWidget/classwidget.dart';
class mobile extends StatelessWidget {
  mobile({super.key});
  @override

  Widget build(BuildContext context) {
    double width;
    var controller = Get.put(MyController());
    return SafeArea(

      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: GetBuilder<MyController>(
          builder: (_){
           return Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.store),
                      label: 'Store',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Whitelist',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ] ,
                  currentIndex: controller.currentIndex.value,
                  unselectedItemColor: Colors.black,
                  selectedFontSize: 10,
                  unselectedFontSize: 10,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.amber[800],
                  onTap: (index) => Get.find<MyController>().changePage(index),
                ),
                backgroundColor: Color.fromRGBO(234, 234, 234, 1.0),
                body: LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
                  if(constraints.maxWidth < 800){
                    width = MediaQuery.sizeOf(context).width;
                    return IndexedStack(
                      index: Get.find<MyController>().currentIndex.value,
                      children: [
                        homepage(width: width,grid: 2,),
                        storeList(),
                        whitelist(),
                        merchantTab(),

                      ],
                    );
                  }else{
                    width = 800;
                    return Center(
                      child: Container(
                          color: const Color.fromRGBO(255, 255, 255, 1.0),
                          width: MediaQuery.sizeOf(context).width,
                          child:  IndexedStack(
                            index: Get.find<MyController>().currentIndex.value,
                            children: [
                              homepage(width: width,grid: 3,),
                              storeList(),
                              whitelist(),
                              merchantTab(),

                            ],
                          )

                      ),

                    );
                  }
                },)
            );
          },

        )
      ),
    );
  }


}
class MyController extends GetxController {
  var currentIndex = 0.obs;

  void changePage(int index) { currentIndex.value = index;
  update();
  }
}

