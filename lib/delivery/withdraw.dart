import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slider_button/slider_button.dart';
class withdraw extends StatefulWidget {
  const withdraw({super.key});

  @override
  State<withdraw> createState() => _withdrawState();
}

class _withdrawState extends State<withdraw> {
  bool islogin = false;
  final TextEditingController usernametxt = TextEditingController();
  final TextEditingController passwordtxt = TextEditingController();
  late IconData icondata =  Icons.remove_red_eye_outlined;
  late bool view = true;
  @override
  Widget build(BuildContext context) {
    late double width;

    return SafeArea(
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
    );
  }

  mainscreen(double width, BuildContext context, int g) {
    return Container(
      width: width,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Header(width,context),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 20),
                    width: width*0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 15,top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Verify Your Bank",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold))),
                          Container(
                            margin: EdgeInsets.only(left: 15,top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("Account Number (ABA) : ",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.w400))),
                                    Text("100 929 192",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400))),

                                  ],
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [
                                    Text("Account Holder Name   : ",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.w400))),
                                   Text("Vong Vetana",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400))),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    padding: EdgeInsets.only(left: 5,right: 10,top: 10,bottom: 20),
                    width: width*0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 15,top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Balance :  ",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400))),
                          Text("\$455.20",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.redAccent,fontSize: 14,fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width*0.9,
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("* Your Payment Will Be Pending a Few Hour",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.redAccent,fontSize: 10,fontWeight: FontWeight.w400))),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    width: width*0.9,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: width*0.8,
                          child: TextField(
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
              
                              obscureText: view == true ? true : false,
                              controller: passwordtxt,
                              decoration: const InputDecoration(
                                enabled: true,
                                hintText: "Password",
                                contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                                border: InputBorder.none,
                                prefixIconColor: Colors.black,
                              )
                          ),
                        ),
                        InkWell(
                            onTap: (){
                              setState(() {
                                if(view == true){
                                  icondata = Icons.remove_red_eye_sharp;
                                  view = false;
                                }else{
                                  view = true;
                                  icondata = Icons.remove_red_eye_outlined;
                                }
                              });
                            },
                            child: Icon(icondata))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: width*0.05,
            bottom: 40,
            child: Container(
              height: 45,
              margin: EdgeInsets.only(top: 10),
              child: SliderButton(
                action: () async{
                  ///Do something here OnSlide
                  return true;
                },

                ///Put label over here
                label: Text(
                  "Slide to Withdraw",
                  style: TextStyle(
                      color: Color(0xff4a4a4a),
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
                icon: Center(
                    child: Icon(
                      Icons.keyboard_double_arrow_right_sharp,
                      color: Colors.white,
                      size: 30.0,
                    )),
                width: width*0.9,
                radius: 100,
                buttonColor: Colors.black,
                backgroundColor: Colors.white,
                highlightedColor: Colors.white,
                baseColor: Colors.black12,
                alignLabel: Alignment.center,
              ),
            ),
          )
        ],
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
                child: Icon(Icons.close,size: 28,color: Colors.black,)),
            Text("Balance",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
            InkWell(
                onTap: (){
                  Get.toNamed("/login");
                },
                child: SizedBox(width: 30,)
            )
          ],
        )
    );
  }
}
