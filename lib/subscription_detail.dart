import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../customWidget/widgetSize.dart';
class subscription_detail extends StatefulWidget {
  subscription_detail({super.key});
  late double size = 10;
  late double size2 = 10;
  late bool aba = true;
  late bool ac = false;
  late double thumbnail = 10;
  late double thumbnail1 = 10;
  late bool isImageDES = false;

  @override
  State<subscription_detail> createState() => _subscription_detailState();
}

class _subscription_detailState extends State<subscription_detail> {
  @override
  Color b_color = Colors.white;
  void colorChanged(){
    setState(() {
  if(b_color == Colors.black){
    b_color = Colors.white;
  }else{
    b_color = Colors.black;
  }
    });
  }
  Widget build(BuildContext context) {
    double width;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromRGBO(234,234,234,1),
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

  mainscreen(double width, BuildContext context, int j) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Header(width, context),
            const SizedBox(height: 15,),
            Container(
              width: width*0.9,
              height: 40,
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Premium Plus", style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    WidgetSize(
                      onChange: (Size size){
                        setState(() {
                          widget.size = size.width.toDouble();
                        });


                      },
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            widget.ac = false;
                            widget.aba = true;

                          });

                        },
                        child: const Text("ABA"),
                      ),
                    ),
                    Visibility(
                      visible: widget.aba == true ? true : false ,
                      child: Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: widget.size,
                        height: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 15,),
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  width: 5, height: 20,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)
                  ),

                ),
                const SizedBox(width: 15,),
                Column(
                  children: [
                    WidgetSize(
                      onChange: (Size size){
                        setState(() {
                          widget.size2 = size.width.toDouble();
                        });


                      },
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            widget.ac = true;
                            widget.aba = false;
                          });

                        },
                        child: const Text("ACLEDA"),
                      ),
                    ),
                    Visibility(
                      visible: widget.ac == true ? true : false ,
                      child: Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: widget.size,
                        height: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20),
              width: width*0.9,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15,top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Reception",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold))),
                        Container(
                          margin: const EdgeInsets.only(left: 15,top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Account Number  : ",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.w400))),
                                  Text("100 929 192",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400))),

                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text("Account Holder Name   : ",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.w400))),
                                  Text("Vong Vetana",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400))),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                      bottom: 0,
                      right: 10,
                      child: Icon(Icons.copy))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.only(left: 5,right: 10,top: 10,bottom: 20),
              width: width*0.9,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 15,top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price :  ",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400))),
                    Text("\$16.00",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.redAccent,fontSize: 14,fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              width: width*0.9,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)
              ),
              padding: const EdgeInsets.only(left: 15,top: 10,bottom: 10,right: 15),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Photo of Transaction"),
                  SizedBox(height: 20,),
                  Icon(Icons.add_box_outlined,color: Colors.black,size: 36,),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: width*0.9,
              height: 45,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child:  InkWell(
                              onTap: colorChanged,
                              child: Container(
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: b_color,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                          )
                      ),
                      const SizedBox(width: 10,),
                      Text("Submit will be under review in  a few hour",style: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 11)),)
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: (){

              },
              child: Container(
                width:  width*0.9,
                padding: const EdgeInsets.only(left: 25,right: 25,top: 15,bottom: 15),
                margin: const EdgeInsets.only(left: 5,top: 5),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Center(
                  child: Text(
                    "Submit",
                    style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 20,top: 30),
              child: Column(
                children: [
                  const Icon(Icons.support_agent,size: 20,),
                  const SizedBox(height: 5,),
                  Text("Support",style: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 7,color: Colors.black,fontWeight: FontWeight.w400)),)
                ],
              ),
            ),
            const SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
  Header(double width,context) {
    return Container(
        color: Colors.white,
        height: 50,
        padding: const EdgeInsets.only(left: 15,right: 15,top: 10,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close,size: 28,color: Colors.black,)),
            Text("Subscription",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
            InkWell(
                onTap: (){
                  Get.toNamed("/login");
                },
                child: const SizedBox(width: 30,)
            )
          ],
        )
    );
  }
}
