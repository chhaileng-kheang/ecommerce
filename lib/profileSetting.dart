import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
class profileSetting extends StatelessWidget {
  const profileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    late double width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
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
    );
  }

  mainscreen(double width, BuildContext context, int g) {
   return Column(
      children: [
        Header(width),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 350,
                  child: Stack(
                    children: [
                      Container(
                        width: width*0.9,

                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(234, 234, 234, 1.0),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: AspectRatio(
                          aspectRatio: 4/3,
                          child: Text(""),
                        ),
                      ),
                      Positioned(
                          top: 200,
                          child: Container(
                            width: width*0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(100)
                                    ),
                                  ),
                                ),
                              ],

                            ),
                          )
                      ),
                      Positioned(
                          right: 10,top: 10,
                          child: Icon(Icons.edit_rounded))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10,bottom: 5),
                  child: Text("Store_Name",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),),
                ),
                Container(
                  margin: EdgeInsets.only(top: 2,bottom: 10),
                  child: Text("Membership : Free",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.w400,fontSize: 12)),),
                ),
                InkWell(
                  onTap: (){
                    Get.toNamed("/editinfo");
                  },
                  child: Container(
                    width: width*0.9,
                    margin: EdgeInsets.only(top: 12),
                    padding: EdgeInsets.only(left: 10,right: 10,bottom: 8,top: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0,0),
                            blurRadius: 0.5,
                            spreadRadius: 0.5
                        )]
                    ),
                    child: Text(
                      "Edit Store Information",
                      style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed("/emailchange");
                  },
                  child: Container(
                    width: width*0.9,
                    margin: EdgeInsets.only(top: 12),
                    padding: EdgeInsets.only(left: 10,right: 10,bottom: 8,top: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0,0),
                              blurRadius: 0.5,
                              spreadRadius: 0.5
                          )]
                    ),
                    child: Text(
                      "Change Email",
                      style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.toNamed("/changepassword");
                  },
                  child: Container(
                    width: width*0.9,
                    margin: EdgeInsets.only(top: 12),
                    padding: EdgeInsets.only(left: 10,right: 10,bottom: 8,top: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0,0),
                              blurRadius: 0.5,
                              spreadRadius: 0.5
                          )]
                    ),
                    child: Text(
                      "Change Password",
                      style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
                Container(
                  width: width*0.9,
                  margin: EdgeInsets.only(top: 12),
                  padding: EdgeInsets.only(left: 10,right: 10,bottom: 8,top: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0,0),
                            blurRadius: 0.5,
                            spreadRadius: 0.5
                        )]
                  ),
                  child: Text(
                    "Premium Subscription",
                    style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,color: Colors.red)),
                  ),
                ),
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    width:  width*0.9,
                    padding: EdgeInsets.only(left: 25,right: 25,top: 8,bottom: 8),
                    margin: EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(
                      child: Text(
                        "Sign Out",
                        style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

      ],
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
                 Get.back();
                },
                child: Icon(Icons.arrow_back_ios,size: 28,color: Color.fromRGBO(255, 75, 75, 1.0),)),
            Text("Setting",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
            Text("",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
          ],
        )
    );
  }

}


