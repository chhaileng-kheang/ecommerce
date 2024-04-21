import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'classwidget.dart';
class store extends StatelessWidget {
  store({super.key});
  final List<String> imgList = [
    'https://i.ibb.co/0BwmgQ5/Untitled-3.png',
  ];
  List<String> categorylst =['Sneaker', 'Clothing', "Kid's Clothing", 'Other','Sneaker', 'Clothing', "Kid's Clothing", 'Other'];

  @override
  Widget build(BuildContext context) {
    double width;
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromRGBO(234, 234, 234, 1.0),
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
  mainscreen(double width, BuildContext context,int grid ){
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        children: [
          Container(
            width: width,
            color: Colors.white,
            child: Center(
             child:  Header(width),
            )
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Store_info(width,context),
                  Container(
                    width: width,
                    color: Colors.white,
                    padding: EdgeInsets.only(bottom: 20),
                    child: Center(
                      child: Contact(width, context),
                    ),
                  ),

                  BannerSponsor(width),
                  SizedBox(height: 5,),
                  category(categorylst, width),
                  SizedBox(height: 5,),
                  bodyGid(width, context, grid),
                  SizedBox(height: 100,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  category(List<String> categorylist,double width){
    return Container(
      height:50,
      width: width*0.9,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1,1),
          )
        ]
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorylst.length,
        itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(left: 10,right: 10,top: 15),
            child: Text(categorylst[index]));
      },
      ),
    );
  }

  BannerSponsor(double width) {

    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: width*0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: AspectRatio(
          aspectRatio: 4/1,
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              viewportFraction: 1,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
            items: imgList
                .map((item) => Container(
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


  Header(double width) {
    return Container(
        height: 60,
        padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: (){
                  Get.back();
                },
                child: Icon(Icons.arrow_back_ios_new,size: 28,color: Color.fromRGBO(255, 75, 75, 1.0),)),
            Container(
                child: Text("Store",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),)),
            Row(
              children: [
                ClipRRect(
                  child: Image.network("https://flagsapi.com/KH/flat/64.png",height: 24,fit: BoxFit.fitHeight,),
                )
              ],
            ),
          ],
        )
    );
  }

  Store_info(double width, BuildContext context) {
    return Container(
      width: width,
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 10,top: 10),
      child: Container(
        width: width*0.9,
        child: Center(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
                width: width*0.9,
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: Color(0XFFEAEAEA),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network("https://images.unsplash.com/photo-1605326152964-56fb991b95ff?q=80&w=2160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",width: 65,height: 65,fit: BoxFit.cover,),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Container(
                        width: width*0.5,
                        height: width <415 ? 100 : 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex:0,
                                child: Text("Vetana De Sneaker",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 18),)),
                            Expanded(
                              flex:0,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text("Russey Kao, Phnom Penh, Cambodia",style: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),

                                ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              if(width >=650)...[
                Positioned(
                    right: 10,
                    top: 10,
                    child:  profileControl_nobg(40, 40, 22))
              ]else...[
                Positioned(
                    right: 10,
                    top: 10,
                    child:  profileControl_nobg(35, 35, 20))
              ]
            ],
          ),
        ),
      ),
    );
  }

  profileControl_nobg(double width, double height, double size) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10,left: 2),
          width: width,height: height,
          decoration: BoxDecoration(color: Colors.transparent,
              borderRadius: BorderRadius.circular(100)
          ),
          child: Icon(Icons.share, color: Colors.black,size: size,),
        ),

      ],);

  }

  void _launchDeepLink() async {
    const deepLink = 'https://t.me/chhailengkc';
    if (await canLaunchUrl(Uri.parse(deepLink))) {
      await launchUrl(Uri.parse(deepLink), mode: LaunchMode.inAppBrowserView,);
    } else {
      throw 'Could not launch $deepLink';
    }
  }
}

