
import 'package:ecomerce/whitelist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class trackinglist extends StatelessWidget {
  const trackinglist({super.key});

  @override
  Widget build(BuildContext context) {
    double width;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromRGBO(234,234,234,1),
            body: LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
              if(constraints.maxWidth < 800){
                width = MediaQuery.sizeOf(context).width;
                return mainscreen(width, context,2);
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
            },)
        ),
      ),
    );
  }

  mainscreen(double width, BuildContext context, int g) {

    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
       child: Column(
         children: [
           Header(MediaQuery.sizeOf(context).width,context),
           Expanded(
               child: Container(
                 child: SingleChildScrollView(
                   child: Column(
                     children: [
                       BodyList(width,context),
                     ],
                   ),
                 ),

               )
           )

         ],
       ),
    );

  }
  Header(double width,context) {
    return Container(
        color: Colors.white,
        height: 60,
        padding: const EdgeInsets.only(left: 15,right: 15,top: 10,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios_new_rounded,size: 28,color: Color.fromRGBO(255, 75, 75, 1.0),)),
            Text("Tracking",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
            InkWell(
              onTap: (){
                Get.toNamed("/login");
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const Image(
                  image: NetworkImage("https://pics.craiyon.com/2023-10-13/45c8f06467d74d7d8949ddadffc5b2c8.webp",),
                  height: 35,width: 35,
                ),
              ),
            )
          ],
        )
    );
  }
}

BodyList(double width, BuildContext context) {
  return Column(
    children: [
      SizedBox(height: 20,),
      trackingCard(width,context),
    ],
  );
}

trackingCard(double width, BuildContext context) {
  return GestureDetector(
    onTap: (){
      Get.toNamed("/tracking");
    },
    child: Container(
      height: 150,
      width: width*0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
        ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
          child:   Image.network("https://staticecp.uprinting.com/6409/600x474/needsample-banner_700.jpg",height: 150,width: 150,fit: BoxFit.cover,),
        ),
          SizedBox(width: 5,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Chan Sophea",style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14)),),
                Text("013 873 829",style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 11))),
                Text("094 8378 981",style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 11))),
                Row(
                  children: [
                    Text("Price :"),
                    Text(" \$188.00",style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent,fontSize: 14))),

                  ],
                ),
                Container(
                    width: width*0.4,
                    child: Text("Boeng Keng Kang 1")),
                Text("Pending",style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent,fontSize: 14))),

              ],
            ),
          )
        ],
      ),
    ),
  );
}
