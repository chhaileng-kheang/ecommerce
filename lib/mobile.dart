import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce/changePassword.dart';
import 'package:ecomerce/leftmenu.dart';
import 'package:ecomerce/merchanttab.dart';
import 'package:ecomerce/object.dart';
import 'package:ecomerce/searchPage.dart';
import 'package:ecomerce/staticdata.dart';
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
class mobile extends StatelessWidget {
  const mobile({super.key});
  @override
  Widget build(BuildContext context) {



    double width;
    List<dynamic> _pages;
    var controller = Get.put(dataX());
    return SafeArea(

      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: GetBuilder<dataX>(
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
                  currentIndex: controller.selectedIndex,
                  unselectedItemColor: Colors.black,
                  selectedFontSize: 10,
                  unselectedFontSize: 10,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.amber[800],
                  onTap: (index){
                    controller.onItemTapped(index);
                  },
                ),
                drawer: NavDrawer(),
                backgroundColor: Color.fromRGBO(234, 234, 234, 1.0),
                body: LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
                  if(constraints.maxWidth < 800){
                    width = MediaQuery.sizeOf(context).width;
                    _pages = <Widget>[
                      mainscreen(width, context,2,controller),
                      storeList(),
                      whitelist(),
                      merchantTab(),

                    ];
                    return _pages.elementAt(controller.selectedIndex);
                  }else{
                    width = 800;
                    _pages = <Widget>[
                      mainscreen(width, context,2,controller),
                      storeList(),
                      whitelist(),
                      merchantTab(),

                    ];
                    return Center(
                      child: Container(
                          color: const Color.fromRGBO(255, 255, 255, 1.0),
                          width: MediaQuery.sizeOf(context).width,
                          child:  _pages.elementAt(controller.selectedIndex)

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


  mainscreen(double width, BuildContext context, int Grid, dataX controller) {
    return GetBuilder<dataX>(builder: (_){
      return SizedBox(
        width: MediaQuery
            .sizeOf(context)
            .width,
        height: MediaQuery
            .sizeOf(context)
            .height,
        child: Stack(
          children: [

            Container(
              margin: EdgeInsets.only(top: 49),
              width: MediaQuery
                  .sizeOf(context)
                  .width,
              height: MediaQuery
                  .sizeOf(context)
                  .height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    storepath(width, context),
                    SizedBox(height: 8,),
                    RegisterMerchant(width, context),
                    SizedBox(height: 5,),
                    BannerSponsorEx(width),
                    SizedBox(
                      width: width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(top: 12),
                              child: Text("Sponsor", style: GoogleFonts
                                  .montserrat(
                                  fontSize: 16, fontWeight: FontWeight.w400),)),
                          Container(
                              margin: const EdgeInsets.only(top: 12, right: 10),
                              child: Tooltip(
                                  showDuration: Duration(seconds: 5),
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  triggerMode: TooltipTriggerMode.tap,
                                  message: "មានតែសមាជិក Premium Plus ប៉ុណ្ណោះ ដែលលោតផលិតផល នៅលើ Sponsor",
                                  child: Icon(Icons.info_outline))),

                        ],
                      ),
                    ),
                    TrippleSponsor(width, context),
                    BannerSponsor(width),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: width * 0.9,
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("Show Hidden Price",
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: Tooltip(
                                        showDuration: Duration(seconds: 5),
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10),
                                        triggerMode: TooltipTriggerMode.tap,
                                        message: "ប្រើសម្រាប់ បើកឬបិទ ផលិតផលដែលមិនបង្អាញតម្លៃ",
                                        child: Icon(Icons.info_outline))),
                              ],
                            ),
                            FlutterSwitch(
                              width: 50.0,
                              height: 30.0,
                              valueFontSize: 25.0,
                              toggleSize: 25.0,
                              value: controller.status,
                              activeColor: Colors.black,
                              inactiveColor: Colors.black12,
                              inactiveToggleColor: Colors.black,
                              activeToggleColor: Colors.white,
                              borderRadius: 30.0,
                              showOnOff: false,
                              onToggle: (val) {

                                controller.status = val;
                                controller.update();

                              },
                            ),

                          ],
                        ),
                      ),
                    ),
                    bodyGid(width, context, Grid),
                    const SizedBox(height: 60,)
                  ],
                ),
              ),
            ),
            Header(width),
            Positioned(
              top: controller.isExpanded == false ? 15 : 10,
              left: controller.isExpanded == false ? 15 : 10,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 250),
                padding: EdgeInsets.only(top: controller.isExpanded == false ? 0 : 10,
                    left: controller.isExpanded == false ? 0 : 5),
                height: controller.isExpanded == false ? 30 : MediaQuery
                    .sizeOf(context)
                    .height * 0.7,
                width: controller.isExpanded == false ? 30 : width * 0.9,
                decoration: controller.isExpanded == true ? BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 0),
                          blurRadius: 1,
                          spreadRadius: 1
                      )
                    ],
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10))
                ) : BoxDecoration(
                  color: Colors.white,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      child: InkWell(
                          onTap: () {
                            //_key.currentState!.openDrawer();

                           controller.expandClick();

                          },
                          child: Icon(
                            controller.isExpanded == false ? Icons.menu : Icons.close,
                            size: 28, color: Color.fromRGBO(255, 75, 75, 1.0),)),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            Text("Category", maxLines: 1,),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              height: 5,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              height: MediaQuery
                                  .sizeOf(context)
                                  .height * 0.5,
                              margin: EdgeInsets.only(
                                  left: 20, top: 10, right: 20),
                              child: ListView(
                                children: [
                                  GestureDetector(
                                    onTap: () {

                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.black, width: 1),
                                      ),
                                      child: Text("sneaker"),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {

                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.black, width: 1),
                                      ),
                                      child: Text("clothing"),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {

                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.black, width: 1),
                                      ),
                                      child: Text("man's clothing"),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {

                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.black, width: 1),
                                      ),
                                      child: Text("women's clothing"),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {

                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.black, width: 1),
                                      ),
                                      child: Text("baby gear"),
                                    ),
                                  ),


                                ],
                              ),
                            )

                          ],
                        ),
                      ),)
                  ],
                ),
              ),
            ),
          ],
        ),

      );

    });
  }

  Header(double width) {
    return Container(
        height: 50,
        color: Colors.white,
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 40,),
            Text("App-Name", style: GoogleFonts.montserrat(
                textStyle: const TextStyle(color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16)),),
            GestureDetector(
                onTap: () {
                  Get.toNamed("/login");
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Icon(Icons.search)
                )
            )
          ],
        )
    );
  }

  SearchBars(double width, BuildContext context) {
    return Hero(
      tag: 'search',
      child: InkWell(
        onTap: () {
          Get.toNamed("/profilesetting");
        },
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          width: width * 0.9,
          height: 35,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            children: [
              SizedBox(
                width: width * 0.8,
                height: 35,
                child: TextField(
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    decoration: const InputDecoration(
                      enabled: false,
                      hintText: "Search",
                      contentPadding: EdgeInsets.only(
                          left: 10, right: 10, top: 0),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.black,
                    )
                ),
              ),
              Text("ALL",
                style: GoogleFonts.montserrat(textStyle: const TextStyle(
                    fontSize: 14
                ),
                ),)
            ],
          ),
        ),
      ),
    );
  }

  TrippleSponsor(double width, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: width * 0.9,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SponsorCard(width, context,
                "https://images.unsplash.com/photo-1521223890158-f9f7c3d5d504?q=80&w=1492&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
            SponsorCard(width, context,
                "https://plus.unsplash.com/premium_photo-1675186049409-f9f8f60ebb5e?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
            SponsorCard(width, context,
                "https://images.stylight.net/image/upload/t_web_post_500x667/q_auto,f_auto/post-3515bce73e333a3a5bb3d9127bdc6d0c35c88a9cffed7da8425a7148.webp"),
            SponsorCard(width, context,
                "https://www.dhresource.com/webp/m/0x0/f2/albu/g19/M00/5F/C5/rBVap2DIXmGAaCmOAAGt0CgPIok342.jpg"),
            SponsorCard(width, context,
                "https://images.unsplash.com/photo-1434389677669-e08b4cac3105?q=80&w=2610&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
            SponsorCard(width, context,
                "https://images.unsplash.com/photo-1560769629-975ec94e6a86?q=80&w=2564&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
          ],
        ),
      ),
    );
  }

  SponsorCard(double width, BuildContext context, String img) {
    return SizedBox(
      width: width / 2.24,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        elevation: 1,
        color: Colors.white,
        shadowColor: Colors.black,
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 3 / 4,
              child: SizedBox(
                width: width / 2,

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(img, fit: BoxFit.cover, width: MediaQuery
                      .sizeOf(context)
                      .width,),
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 3 / 4,
              child: Container(
                width: width / 2.35,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      stops: [
                        0.3,
                        0.7
                      ],
                      colors: [
                        Colors.black.withOpacity(.9),
                        Colors.black.withOpacity(.3)
                      ]),
                  borderRadius: BorderRadius.circular(5.0),
                ),

              ),
            ),
            Positioned(
                left: 10,
                bottom: 17,
                child: Text("\$ 110", style: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),)
            ),
            Positioned(
              left: 10, bottom: 5,
              child: Text("\$ 125", style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.red,
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 1.5,
                      decorationColor: Colors.red)),),
            ),
            Positioned(
              bottom: 0, right: 0,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 5, top: 5),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 75, 75, 1.0),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5))
                ),
                child: Row(
                  children: [
                    Text("-" + "10" + "%", style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 12)),

                  ],
                ),
              ),)
          ],
        ),
      ),
    );
  }

  BannerSponsor(double width) {
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: width * 0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: AspectRatio(
          aspectRatio: 4 / 1,
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              viewportFraction: 1,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
            items: imgList
                .map((item) =>
                Container(
                  child: Center(
                      child: Image.network(
                        item,
                        fit: BoxFit.fitWidth,
                        width: width,
                      )),
                ))
                .toList(),
          ),
        ),
      ),
    );
  }

  BannerSponsorEx(double width) {
    return Container(
      width: width * 0.9,
      margin: EdgeInsets.only(top: 5, bottom: 2),
      child: AspectRatio(aspectRatio: 4 / 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              "https://i.ibb.co/0BwmgQ5/Untitled-3.png",
              fit: BoxFit.fitWidth,
              width: width,
            ),
          )
      ),
    );
  }

  bodyGid(double width, BuildContext context, int Grid) {
    final List<ProductObj> Product = [
      ProductObj(product_title: "product A", id: "id", img: "https://images.unsplash.com/photo-1576487503401-173ffc7c669c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODB8fHNuZWFrZXJ8ZW58MHx8MHx8fDA%3D", price: "100", category: "category", discount: "5", disbool: "false",derection: "v"),
      ProductObj(product_title: "product B", id: "id", img:  "https://images.unsplash.com/photo-1589578228447-e1a4e481c6c8?q=80&w=2664&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "140", category: "category", discount: "35", disbool: "",derection: "h"),
      ProductObj(product_title: "product C", id: "id", img:"https://images.unsplash.com/photo-1607861716497-e65ab29fc7ac?q=80&w=2564&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "80", category: "category", discount: "10", disbool: "disbool",derection: "v"),
      ProductObj(product_title: "product D", id: "id", img:   "https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?q=80&w=2572&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "78", category: "category", discount: "0", disbool: "disbool",derection: "h"),
      ProductObj(product_title: "product E", id: "id", img:   "https://images.unsplash.com/photo-1548036328-c9fa89d128fa?q=80&w=2669&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",price: "214", category: "category", discount: "9", disbool: "disbool",derection: "h"),
      ProductObj(product_title: "product F", id: "id", img: "https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?q=80&w=2650&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "69", category: "category", discount: "0", disbool: "disbool",derection: "h"),

    ];
    return Container(
      width: width * 0.9 + 8,
      margin: const EdgeInsets.only(top: 5),
      child: StaggeredGrid.count(
        crossAxisCount: Grid,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        children: Product.map((ProductObj pro) {
          return Container(
            child: ProductCard(
                context,
                pro.img,
                pro.product_title,
                pro.price,
                pro.id,
                pro.category,
                pro.discount,
                width,
                pro.derection),
          );
        }

        ).toList(),

      ),
    );
  }

  ProductCard(BuildContext context, String img, String title, String price,
      String id, String category, String discount, double width, String dire) {
    double discountprice = double.parse(price) -
        (double.parse(price) * (double.parse(discount) / 100));
    return GestureDetector(
      onTap: () {
        Get.toNamed("/product?store=12345&product=28222");
      },
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: width >= 800 ? 1 : 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Stack(
          children: [
            Column(
              children: [
                ConstrainedBox(
                  constraints: new BoxConstraints(
                      maxHeight: 300
                  ),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5)),
                      child: AspectRatio(
                        aspectRatio: dire == "v" ? 3 / 4 : 4 / 3,
                        child: FadeInImage(
                            placeholder: AssetImage('asset/aas.png'),
                            fadeInDuration: Duration(milliseconds: 50),
                            image: NetworkImage(img),
                            fit: BoxFit.cover,
                            width: MediaQuery
                                .sizeOf(context)
                                .width
                        ),
                      )
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(title, style: const TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12)),),
                Container(
                  margin: const EdgeInsets.only(
                      left: 5, right: 5, bottom: 5, top: 10),
                  child: discount != "0" ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Text("\$" + price, style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 1.5,
                              decorationColor: Colors.red))),

                    ],
                  )
                      :
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("\$" + price, style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 16))),

                    ],
                  ),
                )
              ],
            ),
            discount != "0" ? Positioned(
              bottom: 0, right: 0,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 5, top: 5),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 75, 75, 1.0),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5))
                ),
                child: Row(
                  children: [
                    Text("-" + discount.toString() + "%",
                        style: const TextStyle(color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 12)),
                    const SizedBox(width: 5,),
                    Text("\$" + discountprice.toString(),
                        style: const TextStyle(color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 14)),

                  ],
                ),
              ),)
                : const Text("")
          ],
        ),
      ),
    );
  }

  RegisterMerchant(double width, BuildContext context) {
    return Container(
      width: width * 0.9,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0XFFE9FFFD),
      ),
      margin: EdgeInsets.only(top: 5, bottom: 2),
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(height: 120,
                child: Lottie.asset("asset/Animation - 1712806927475.json",animate: false)
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Register As Merchant", style: GoogleFonts.montserrat(
                    textStyle: TextStyle(fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),),
                Text("For Free", style: GoogleFonts.montserrat(
                    textStyle: TextStyle(fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold))),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFF001F48),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("Register", textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(textStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }

  storepath(double width, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      color: Colors.white,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 20,),
                store(
                    "https://plus.unsplash.com/premium_photo-1690263583138-155eca49f57d?q=80&w=2660&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                store(
                    "https://plus.unsplash.com/premium_photo-1684407617236-c60dc693293a?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                store(
                    "https://images.unsplash.com/photo-1564510715156-793609f9e8b5?q=80&w=2671&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                store(
                    "https://images.unsplash.com/photo-1565958011703-44f9829ba187?q=80&w=2565&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                store(
                    "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?q=80&w=2580&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                store(
                    "https://plus.unsplash.com/premium_photo-1677451335829-c863209d463b?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                store(
                    "https://plus.unsplash.com/premium_photo-1690263583138-155eca49f57d?q=80&w=2660&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                store(
                    "https://plus.unsplash.com/premium_photo-1684407617236-c60dc693293a?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),

              ],
            ),
          ),
        ],
      ),
    );
  }

  store(String img) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 70,
      width: 70,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.black,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.network(img,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class dataX extends GetxController{
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
  void onItemTapped(int index) {
      selectedIndex = index;
      update();
   }

  void expandClick() {
    if (isExpanded == true) {
        isExpanded = false;
      update();
    } else {
      isExpanded = true;
      }
    update();
  }
}