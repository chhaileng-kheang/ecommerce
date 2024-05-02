import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce/changePassword.dart';
import 'package:ecomerce/leftmenu.dart';
import 'package:ecomerce/merchanttab.dart';
import 'package:ecomerce/classobject/object.dart';
import 'package:ecomerce/qrscanner.dart';
import 'package:ecomerce/searchPage.dart';
import 'package:ecomerce/classobject/staticdata.dart';
import 'package:ecomerce/storelist.dart';
import 'package:ecomerce/whitelist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import 'customWidget/classwidget.dart';
import 'home.dart';
class mobile extends StatelessWidget {
  mobile({super.key});



  final controller = Get.put(ProductController());



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: GetBuilder<ProductController>(
          builder: (_){
           return Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                  items:  <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(controller.home),
                      label: controller.home_title,
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
                  onTap: (index) {
                    if(index == 0){

                     if(controller.home == Icons.home){
                       print("selected home");
                       if(  controller.Scroll_controller.position.pixels >=1000){
                         controller.home = Icons.keyboard_double_arrow_up_outlined;
                         controller.home_title = "Top";
                       }
                     }else{
                       controller.Scroll_controller.animateTo( //go to top of scroll
                           0,  //scroll offset to go
                           duration: Duration(milliseconds: 500), //duration of scroll
                           curve:Curves.fastOutSlowIn //scroll type
                       );
                       controller.home_title = "Home";
                       controller.update();
                     }
                    }else{
                      controller.home = Icons.home;
                      controller.home_title = "Home";
                    }
                    return Get.find<ProductController>().changePage(index);

                  },
                ),
                backgroundColor: Color.fromRGBO(234, 234, 234, 1.0),
                body: LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
                  if(constraints.maxWidth < 800){
                    width = MediaQuery.sizeOf(context).width;
                    return IndexedStack(
                      index: Get.find<ProductController>().currentIndex.value,
                      children: [
                        mainscreen(width, context, 2, controller),
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
                            index: Get.find<ProductController>().currentIndex.value,
                            children: [
                              mainscreen(width, context, 3, controller),
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


