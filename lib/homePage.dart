import 'dart:convert';
import 'package:ecomerce/classwidget.dart';
import 'package:ecomerce/leftmenu.dart';
import 'package:ecomerce/mobile.dart';
import 'package:ecomerce/object.dart';
import 'package:ecomerce/searchPage.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:ecomerce/staticdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:lottie/lottie.dart';
class homepage extends StatefulWidget {
  homepage({super.key, required this.width,required this.grid});
  final double width;
  final int grid;

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  String check = generateRandomCodePars("1234567890", 1);
  final controller = Get.put(getxData());
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: NavDrawer(),
        backgroundColor: Color.fromRGBO(234, 234, 234, 1.0),
        body: mainscreen(widget.width, context, widget.grid, controller),
      ),
    );
  }

  mainscreen(double width, BuildContext context, int Grid, getxData controller) {

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
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  storepath(width, context),
                  SizedBox(height: 8,),
                  check == "1" || check == "2" || check == "3" ? RegisterMerchant(width, context) : SizedBox(height: 0,),
                  SizedBox(height: 5,),
                  BannerSponsorEx(width,"https://i.ibb.co/0BwmgQ5/Untitled-3.png"),
                  // FutureBuilder(future: getImageInfo(Image.network("https://i.ibb.co/0BwmgQ5/Untitled-3.png")) , builder: (context,snapshot){
                  //   if (snapshot.connectionState == ConnectionState.waiting) {
                  //     // Return a placeholder widget while waiting for the future to complete
                  //     return Container(
                  //       child: Text(""),
                  //
                  //     );
                  //   } else
                  //   if (snapshot.hasError) {
                  //     // Return an error widget if the future encounters an error
                  //     return Text('Error: ${snapshot.error}');
                  //   } else {
                  //     // Return the ProductCard widget with the obtained ImageInfo
                  //     return  BannerSponsorEx(width,"https://i.ibb.co/0BwmgQ5/Untitled-3.png");
                  //   }
                  // }),
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
                  // banner 2 : https://i.ibb.co/YkPqdLk/Untitled-4.png
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
                  bodyGid(width, context, Grid,false,false),
                  const SizedBox(height: 60,)
                ],
              ),
            ),
          ),
          Header(width,context),
        ],
      ),

    );
  }

  uploadAndSub(double width) {
    return Container(
      width: width*0.9,
      margin: EdgeInsets.only(top: 0),
      child:SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                Get.toNamed("/uploadproduct");
              },
              child: Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                child: Column(
                    children: [
                      Icon(Icons.add_business_outlined,color: Colors.white,size: 24,),
                      SizedBox(height: 5,),
                      Text("Upload",style: GoogleFonts.montserrat(fontSize: 9,fontWeight: FontWeight.w400,color: Colors.white),),

                    ]
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.toNamed("/delivery");
              },
              child: Container(

                margin: EdgeInsets.only(top: 10,left: 10),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                child: Column(
                    children: [
                      Icon(Icons.delivery_dining,color: Colors.white,size: 24,),
                      SizedBox(height: 5,),
                      Text("Delivery",style: GoogleFonts.montserrat(fontSize: 9,fontWeight: FontWeight.w400,color: Colors.white),),

                    ]
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.toNamed("/subscription");
              },
              child: Container(

                margin: EdgeInsets.only(top: 10,left: 10),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                child: Column(
                    children: [
                      Icon(Icons.workspace_premium_sharp,color: Colors.white,size: 24,),
                      SizedBox(height: 5,),
                      Text("Upgrade",style: GoogleFonts.montserrat(fontSize: 9,fontWeight: FontWeight.w400,color: Colors.white),),

                    ]
                ),
              ),
            ),

          ],
        ),
      ),
    );

  }

  Header(double width,BuildContext context) {
    return Container(
        height: 50,
        color: Colors.white,
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Icon(Icons.menu)
                )
            ),
            Text("App-Name", style: GoogleFonts.montserrat(
                textStyle: const TextStyle(color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16)),),
            Hero(
              tag: "search",
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return search();
                  },));
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Icon(Icons.search)
                ),
              ),
            )
          ],
        )
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

                  child: FadeInImage(
                    placeholder: AssetImage("asset/aas.png"),
                    image: NetworkImage(img),
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context,error,StackTrace){
                      return Container(
                        width: MediaQuery.sizeOf(context).width,
                        child: Center(
                          child: Icon(Icons.error,color: Colors.black,),
                        ),
                      );
                    },
                  ),
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

  BannerSponsorEx(double width, String img) {

    return Container(
      width: width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),

        color: Colors.grey,
      ),
      margin: EdgeInsets.only(top: 5, bottom: 2),
      child: AspectRatio(aspectRatio: 4 / 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: FadeInImage(
              placeholder: AssetImage("asset/aas.png"),
              image: NetworkImage(img),
              fit: BoxFit.cover,
              imageErrorBuilder: (context,error,StackTrace){
                return Container(
                  width: MediaQuery.sizeOf(context).width,
                  child: Center(
                    child: Icon(Icons.error,color: Colors.black,),
                  ),
                );
              },
            ),
          )
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
      child: SingleChildScrollView(
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
        child: FadeInImage(
          placeholder: AssetImage("asset/aas.png"),
          image: NetworkImage(img),
          fit: BoxFit.cover,
          imageErrorBuilder: (context,error,StackTrace){
            return Container(
              width: MediaQuery.sizeOf(context).width,
              child: Center(
                child: Icon(Icons.error,color: Colors.white,),
              ),
            );
          },
        ),
      ),
    );
  }
}