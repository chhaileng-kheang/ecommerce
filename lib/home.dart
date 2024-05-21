import 'dart:async';

import 'package:ecomerce/leftmenu.dart';
import 'package:ecomerce/searchPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'classobject/object.dart';
import 'customWidget/classwidget.dart';
import 'mobile.dart';

class homePaage extends StatelessWidget {
   homePaage({super.key,required this.controller, required this.scaffoldKey});

   final GlobalKey<ScaffoldState> scaffoldKey;
   final ProductController controller;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          key: scaffoldKey,
            drawer: NavDrawer(),
            backgroundColor: Color.fromRGBO(234, 234, 234, 1.0),
            body: LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
              if(constraints.maxWidth < 800){
                controller.width = MediaQuery.sizeOf(context).width;
                if(constraints.maxWidth<350) {
                  return mainscreen(controller.width, context, 1,controller);
                }else{
                  return mainscreen(controller.width, context, 2,controller);
                }
              }else{
                controller.width = 800;
                return Center(
                  child: Container(
                    color: const Color.fromRGBO(255, 255, 255, 1.0),
                    width: MediaQuery.sizeOf(context).width,
                    child: mainscreen(controller.width, context,3,controller),

                  ),

                );
              }
            }
            )
        )
    );
  }
   mainscreen(double width, BuildContext context, int Grid, ProductController controller) {

     return GetBuilder<ProductController>(
         builder: (_) {
           return SizedBox(
             width: MediaQuery
                 .sizeOf(context)
                 .width,
             height: MediaQuery
                 .sizeOf(context)
                 .height,
             child: Column(
               children: [
                 Headerss(MediaQuery.sizeOf(context).width,context,scaffoldKey),
                 Expanded(
                   child: Container(
                     width: width,
                     height: MediaQuery
                         .sizeOf(context)
                         .height-107,
                     child: Stack(
                       children: [
                         Container(
                           width: MediaQuery.sizeOf(context).width,
                           height: MediaQuery.sizeOf(context).height,
                           child: LiquidPullToRefresh(
                             onRefresh: _refresh,
                             color: Colors.white,
                             height: 100,
                             backgroundColor: Colors.black,
                             showChildOpacityTransition: false,
                             animSpeedFactor: 5,
                             springAnimationDurationInMilliseconds: 500,
                             child: NotificationListener<ScrollNotification>(
                               onNotification: (scrollState){
                                 if (scrollState is ScrollUpdateNotification) {
                                   if(!kIsWeb){
                                   if(controller.Scroll_controller.position.pixels >=2000){
                                     controller.changeHome();
                                   }else{
                                     controller.changeToHome();
                                   }
                                   if(scrollState.scrollDelta! > 0 && controller.i >= 1){
                                     controller.pushdata();
                                       if(controller.Scroll_controller.offset > 0){
                                         if(controller.i == 1) {
                                           controller.ispush = true;
                                           controller.i++;
                                         }
                                       }

                                       if(controller.Scroll_controller.position.pixels == controller.Scroll_controller.position.maxScrollExtent){
                                       controller.isloadingTrue();

                                       }

                                   }
                                 } else{
                                     if(controller.Product.length <=55){
                                       controller.ispush = true;
                                     }else{
                                       controller.ispush = false;
                                       controller.update();

                                     }
                                   }
                                 }
                                 return false;
                               },
                               child: Center(
                                 child: Container(
                                   width: width*0.9,
                                   child: ListView(
                                     controller: controller.Scroll_controller,
                                     children: [
                                       SizedBox(height: 8),
                                       RegisterMerchant(width, context),
                                       SizedBox(height: 12),
                                       !kIsWeb
                                           ? Container(
                                         width: width * 0.9,
                                         margin: EdgeInsets.only(bottom: 10),
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           children: [
                                             GestureDetector(
                                               onTap: (){
                                                 Get.toNamed("/uploadproduct");
                                               },
                                               child: Container(
                                                 width: width * 0.5,

                                                 margin: EdgeInsets.only(right: 10),
                                                 height: 40,
                                                 padding: EdgeInsets.only(left: 10),
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(5),
                                                   color: Colors.white,
                                                 ),
                                                 child: Row(
                                                   mainAxisAlignment: MainAxisAlignment.start,
                                                   crossAxisAlignment: CrossAxisAlignment.center,
                                                   children: [
                                                     Icon(Icons.storefront,color: Colors.black,),
                                                     SizedBox(width: 10,),
                                                     Text(
                                                       "Post Product...",
                                                       style: GoogleFonts.montserrat(
                                                         textStyle: const TextStyle(
                                                           fontSize: 12,
                                                           color: Colors.black,
                                                           fontWeight: FontWeight.w400,
                                                         ),
                                                       ),
                                                     ),
                                                   ],
                                                 ),
                                               ),
                                             ),
                                             GestureDetector(
                                               onTap: (){
                                                 Get.toNamed("/subscription");
                                               },
                                               child: Container(

                                                 margin: EdgeInsets.only(right: 10),
                                                 width: 40,
                                                 height: 40,
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(5),
                                                   color: Colors.white,
                                                 ),
                                                 child: Icon(Icons.workspace_premium_sharp, color: Colors.black),
                                               ),
                                             ),
                                             GestureDetector(
                                               onTap: (){
                                                 Get.toNamed("/delivery");
                                               },
                                               child: Container(

                                                 margin: EdgeInsets.only(right: 10),
                                                 width: 40,
                                                 height: 40,
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(5),
                                                   color: Colors.white,
                                                 ),
                                                 child: Icon(Icons.delivery_dining),
                                               ),
                                             ),
                                           ],
                                         ),
                                       )
                                           : SizedBox(height: 0),

                                       SizedBox(
                                         width: width * 0.9,
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             Container(
                                               margin: const EdgeInsets.only(top: 15,left: 3),
                                               child: Text(
                                                 "Sponsor",
                                                 style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w400),
                                               ),
                                             ),
                                             Container(
                                               margin: const EdgeInsets.only(top: 15, right: 10),
                                               child: Tooltip(
                                                 showDuration: Duration(seconds: 5),
                                                 margin: EdgeInsets.only(left: 10, right: 10),
                                                 triggerMode: TooltipTriggerMode.tap,
                                                 message: "មានតែសមាជិក Premium Plus ប៉ុណ្ណោះ ដែលលោតផលិតផល នៅលើ Sponsor",
                                                 child: Icon(Icons.info_outline),
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                       SizedBox(height: 5,),
                                       TrippleSponsor(width, context),
                                       SizedBox(height: 10,),
                                       BannerSponsorEx(width, "https://i.ibb.co/0BwmgQ5/Untitled-3.png"),
                                       // banner 2 : https://i.ibb.co/YkPqdLk/Untitled-4.png
                                       SizedBox(height: 10,),
                                       StreamBuilder<List<ProductObj>>(
                                         stream: controller.productsStream(),
                                         builder: (context, snapshot) {
                                           return bodyGid(width, context, Grid, false, false, controller.Product);
                                         },
                                       ),
                                       !kIsWeb
                                           ? controller.isloading == true
                                           ? Container(
                                         margin: EdgeInsets.only(top: 10, bottom: 10),
                                         height: 60,
                                         width: width * 0.9,
                                         decoration: BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: BorderRadius.circular(8),
                                         ),
                                         child: Shimmer.fromColors(
                                           highlightColor: Colors.white,
                                           baseColor: Colors.grey.withOpacity(0.3),
                                           child: Container(
                                             margin: EdgeInsets.only(left: 20, right: 20),
                                             child: Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                               children: [
                                                 Container(
                                                   width: width * 0.30,
                                                   height: 20,
                                                   decoration: BoxDecoration(
                                                     color: Colors.grey,
                                                     borderRadius: BorderRadius.circular(100),
                                                   ),
                                                 ),
                                                 Container(
                                                   width: width * 0.30,
                                                   height: 20,
                                                   decoration: BoxDecoration(
                                                     color: Colors.grey,
                                                     borderRadius: BorderRadius.circular(100),
                                                   ),
                                                 ),
                                               ],
                                             ),
                                           ),
                                         ),
                                       )
                                           : Container(height: 80)
                                           : Container(
                                             margin: EdgeInsets.only(top: 10, bottom: 10),
                                             height: controller.Product.length <= 50 ? 60 : 100,
                                             width: width * 0.9,
                                             decoration: BoxDecoration(
                                               color: Colors.white,
                                               borderRadius: BorderRadius.circular(8),
                                                  ), child: Row(
                                               mainAxisAlignment: MainAxisAlignment.center,
                                               children: [
                                                 controller.Product.length < 50 ? Text("Loading...") : Column(
                                                   children: [
                                                     SizedBox(height: 15),
                                                     Text(
                                                       "Get APP To Enjoy Full Experience",
                                                       style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.bold)),
                                                     ),
                                                     Container(
                                                       margin: EdgeInsets.only(top: 10),
                                                       padding: EdgeInsets.all(10),
                                                       decoration: BoxDecoration(
                                                         color: Colors.green,
                                                         borderRadius: BorderRadius.circular(10),
                                                       ),
                                                       child: Text(
                                                         "Download Now",
                                                         style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                                       ),
                                                     ),
                                                   ],
                                                 ),
                                               ],
                                             ),
                                           ),
                                       kIsWeb && controller.Product.length > 50
                                           ? Container(
                                         height: 100,
                                         width: width * 0.9,
                                         child: Center(
                                           child: Column(
                                             children: [
                                               Text(
                                                 "- See More Massive Products In Mobile Application -",
                                                 style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: Colors.black)),
                                               ),
                                               SizedBox(height: 10),
                                               Text(
                                                 "- Available : Play Store | App Store -",
                                                 style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
                                               ),
                                             ],
                                           ),
                                         ),
                                       )
                                           : SizedBox(height: 0),

                                     ],

                                   ),
                                 ),
                               ),
                             )

                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               ],
             ),

           );
         }
     );
   }

}

Future<void> _refresh() {
  return Future.delayed(Duration(seconds: 2));
}

class ProductController extends GetxController{
  bool status = false;
  bool ispush = true;
  bool visbbtn = false;
  Brightness brightness = Brightness.dark;
  Color navBG = Colors.white;
  int i = 1;
  double width =0;
  ScrollController Scroll_controller = ScrollController();
  IconData home = Icons.home;
  StreamSubscription<List<ProductObj>>? subscription;
  final String check = generateRandomCodePars("1234567890", 1);
  var currentIndex = 0.obs;

  String home_title = "Home";

  bool isloading = false;

  void changePage(int index) {
    currentIndex.value = index;
  update();
  }
  List<ProductObj> Product = [
    ProductObj(product_title: "product A", id: "id", img:"https://images.unsplash.com/photo-1576487503401-173ffc7c669c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODB8fHNuZWFrZXJ8ZW58MHx8MHx8fDA%3D", price: "100", category: "category", discount: "5", disbool: "false",derection: "v"),
    ProductObj(product_title: "product B", id: "id", img:"https://images.unsplash.com/photo-1589578228447-e1a4e481c6c8?q=80&w=2664&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "140", category: "category", discount: "35", disbool: "",derection: "h"),
    ProductObj(product_title: "product C", id: "id", img:"https://images.unsplash.com/photo-1607861716497-e65ab29fc7ac?q=80&w=2564&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "80", category: "category", discount: "10", disbool: "disbool",derection: "v"),
    ProductObj(product_title: "product D", id: "id", img:"https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?q=80&w=2572&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "78", category: "category", discount: "0", disbool: "disbool",derection: "h"),
    ProductObj(product_title: "product E", id: "id", img:"https://images.unsplash.com/photo-1548036328-c9fa89d128fa?q=80&w=2669&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",price: "214", category: "category", discount: "9", disbool: "disbool",derection: "h"),
    ProductObj(product_title: "product F", id: "id", img:"https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?q=80&w=2650&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "69", category: "category", discount: "0", disbool: "disbool",derection: "h"),
    ProductObj(product_title: "product A", id: "id", img:"https://images.unsplash.com/photo-1576487503401-173ffc7c669c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODB8fHNuZWFrZXJ8ZW58MHx8MHx8fDA%3D", price: "100", category: "category", discount: "5", disbool: "false",derection: "v"),
    ProductObj(product_title: "product B", id: "id", img:"https://images.unsplash.com/photo-1589578228447-e1a4e481c6c8?q=80&w=2664&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "140", category: "category", discount: "35", disbool: "",derection: "h"),
    ProductObj(product_title: "product C", id: "id", img:"https://images.unsplash.com/photo-1607861716497-e65ab29fc7ac?q=80&w=2564&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "80", category: "category", discount: "10", disbool: "disbool",derection: "v"),
    ProductObj(product_title: "product D", id: "id", img:"https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?q=80&w=2572&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "78", category: "category", discount: "0", disbool: "disbool",derection: "h"),
    ProductObj(product_title: "product E", id: "id", img:"https://images.unsplash.com/photo-1548036328-c9fa89d128fa?q=80&w=2669&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",price: "214", category: "category", discount: "9", disbool: "disbool",derection: "h"),
    ProductObj(product_title: "product F", id: "id", img:"https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?q=80&w=2650&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "69", category: "category", discount: "0", disbool: "disbool",derection: "h"),

  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startProductsStream();

  }
  @override
  void onClose() {
    // TODO: implement onClose
    subscription!.cancel();
    super.onClose();
  }
  void startProductsStream() {
    subscription = productsStream().listen((product) {
      // Handle incoming products

      if(ispush) {
        product.add(
            ProductObj(
                product_title: "product A",
                id: "id",
                img: "https://images.unsplash.com/photo-1576487503401-173ffc7c669c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODB8fHNuZWFrZXJ8ZW58MHx8MHx8fDA%3D",
                price: "100",
                category: "category",
                discount: "5",
                disbool: "false",
                derection: "v"));
        product.add(
            ProductObj(
                product_title: "product B",
                id: "id",
                img: "https://images.unsplash.com/photo-1589578228447-e1a4e481c6c8?q=80&w=2664&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                price: "140",
                category: "category",
                discount: "35",
                disbool: "",
                derection: "h")
        );
        product.add(
            ProductObj(
                product_title: "product C",
                id: "id",
                img:"https://images.unsplash.com/photo-1607861716497-e65ab29fc7ac?q=80&w=2564&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                price: "80",
                category: "category",
                discount: "10",
                disbool: "disbool",
                derection: "v")
        );
        product.add(
            ProductObj(
                product_title: "product D",
                id: "id",
                img:   "https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?q=80&w=2572&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                price: "78",
                category: "category",
                discount: "0",
                disbool: "disbool",
                derection: "h"));
        ispush = false;
        i = 1;
        isloading = false;
      }

    });
  }
  Stream<List<ProductObj>> productsStream() async* {
    while (true) {
      await Future.delayed(Duration(milliseconds: 2000));
      yield Product;
    }
  }
  bool isloadingTrue(){
    isloading = true;
    update();
    return isloading;
  }
  bool pushdata() {
    ispush = true;
    return ispush;
  }
  bool pushdatafalse() {
    ispush = true;
    return ispush;
  }
  void changeHome(){
    if(home == Icons.home) {
      home = Icons.keyboard_double_arrow_up_sharp;
      home_title = "Top";
      update();
    }
  }
  void changeToHome(){
    if(home == Icons.keyboard_double_arrow_up_sharp) {
      home = Icons.home;
      home_title = "Home";
      update();
    }
  }

  void goUp() {
    Scroll_controller
        .animateTo( //go to top of scroll
        0, //scroll offset to go
        duration: Duration(milliseconds: 500),
        //duration of scroll
        curve: Curves.fastOutSlowIn //scroll type
    );
    changeToHome();
    update();
  }

}