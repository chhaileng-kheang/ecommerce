import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class subscrption extends StatefulWidget {
  const subscrption({super.key});

  @override
  State<subscrption> createState() => _subscrptionState();
}

class _subscrptionState extends State<subscrption> {
  bool isexpaned = false;
  @override
  Widget build(BuildContext context) {
    double width;

    return SafeArea(
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
    );
  }
  mainscreen(double width, BuildContext context, int g) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        children: [
          Header(width),
          Expanded(child: Container(
            height: MediaQuery.sizeOf(context).height*0.95,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        if(isexpaned == false){
                          isexpaned = true;
                        }else {
                          isexpaned = false;
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      width: width*0.9,
                      height: isexpaned == false ? 50 : 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                          color: Colors.black38,
                          offset: Offset(0,0),
                          spreadRadius: 0.5,
                          blurRadius: 0.5
                        )]
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width:width*0.8 ,
                            child:Container(
                              height: 250,
                              width:width*0.75,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Free",style: GoogleFonts.montserrat(textStyle : TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500

                                  )),),
                                  Text("0\$/Month",style: GoogleFonts.montserrat(textStyle : TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500

                                  )))
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 150,
                              width:width*0.75,
                              margin: EdgeInsets.only(left: 10,right: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 250,
                                    width:width*0.75,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Free",style: GoogleFonts.montserrat(textStyle : TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500

                                        )),),
                                        Text("0\$/Month",style: GoogleFonts.montserrat(textStyle : TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500

                                        )))
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 250,
                                    width:width*0.75,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Premium",style: GoogleFonts.montserrat(textStyle : TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500

                                        )),),
                                        Text("2.99\$/Month",style: GoogleFonts.montserrat(textStyle : TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500

                                        )))
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 250,
                                    width:width*0.75,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Premium+",style: GoogleFonts.montserrat(textStyle : TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500

                                        )),),
                                        Text("5.99\$/Month",style: GoogleFonts.montserrat(textStyle : TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500

                                        )))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
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
          ))

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
                  Get.back();
                },
                child: Icon(Icons.arrow_back_ios_new,size: 28,color: Color.fromRGBO(255, 75, 75, 1.0),)),
            Text("Subscription",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
            SizedBox(width: 30,)

          ],
        )
    );
  }
}
