import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class dvHome extends StatelessWidget {
  const dvHome({super.key});

  @override
  Widget build(BuildContext context) {
    double width;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Color(0XFFFFF0BE),
        statusBarIconBrightness: Brightness.dark,
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

  mainscreen(double width, BuildContext context, int g) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
         Container(
           decoration: BoxDecoration(
               color: Color(0XFFFFF0BE),
             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
           ),
           padding: EdgeInsets.only(bottom: 30),
           child: Column(
             children: [
               Header(MediaQuery.sizeOf(context).width),
               SizedBox(height: 20,),
               Container(
                 width: width*0.9,
                 child:Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text("Vetana De Sneaker",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold))),
                     SizedBox(height: 10,),
                     Row(
                       children: [
                         Text("Your Balance :  ",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400))),
                         Text("21.57\$",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 16,color: Colors.red,fontWeight: FontWeight.bold))),
                       ],
                     )
                 ],
               ),
               ),
               SizedBox(height: 10,),
               bodyGrid(context, width),
             ],
           ),
         ),
          Expanded(
              child: Container(
                width: width*0.9,
                margin: EdgeInsets.only(top: 30),
                height: MediaQuery.sizeOf(context).height *0.8,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Icon(Icons.location_on_rounded,size: 28,),
                            SizedBox(width: 10,),
                            Text("My Location",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w600)),)
                  
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Icon(Icons.person,size: 28,),
                            SizedBox(width: 10,),
                            Text("Saved Customer",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w600)),)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Icon(Icons.history,size: 28,),
                            SizedBox(width: 10,),
                            Text("Payment History",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w600)),)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Icon(Icons.headphones,size: 28,),
                            SizedBox(width: 10,),
                            Text("Contact to Support",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w600)),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
          )
          )
        ],
      ),
    );

  }
  Header(double width) {
    return Container(
        height: 50,
        margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: (){
                },
                child: Icon(Icons.arrow_back_ios_new_rounded,size: 28,color: Color.fromRGBO(255, 75, 75, 1.0),)),
            Text("Delivery",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
            SizedBox(width: 35,)
          ],
        )
    );
  }
  bodyGrid(BuildContext context, double width){
    return Container(
      width: width*0.9,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.toNamed("/customerinfo");
                  },
                  child: Container(
                    width: 80,
                    height: 60,
                    margin: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0,0),
                              spreadRadius: 0.5,
                              blurRadius: 0.5
                          )
                        ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delivery_dining_outlined,size: 26,),
                        Text("Package",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 10,color: Colors.black,fontWeight: FontWeight.bold)),)

                      ],
                    ),
                  ),
                ),
                Container(
                  width: 80,
                  height: 60,
                  margin: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0,0),
                            spreadRadius: 0.5,
                            blurRadius: 0.5
                        )
                      ]
                  ),
                  child: AspectRatio(
                    aspectRatio: 1/1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.list_alt,size: 26,),
                        Text("Track",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 10,color: Colors.black,fontWeight: FontWeight.bold)),)

                      ],
                    ),
                  ),
                ),
                Container(
                  width: 80,
                  height: 60,
                  margin: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0,0),
                            spreadRadius: 0.5,
                            blurRadius: 0.5
                        )
                      ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.payment,size: 26,),
                      Text("Payment",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 10,color: Colors.black,fontWeight: FontWeight.bold)),)

                    ],
                  ),
                ),
              ],
            ),
          ),
         ],
      ),
    );

  }
}
