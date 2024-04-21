import 'dart:math';

import 'package:ecomerce/object.dart';
import 'package:ecomerce/staticdata.dart';
import 'package:ecomerce/uploadimage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class merchantReg extends StatelessWidget {
  merchantReg({super.key});

  @override

  getxData controller = Get.put(getxData());
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

    return  GetBuilder<getxData>(
      builder: (_) {
        return Container(
          child: Column(
            children: [
              Container(
                height: 150,
                child: Stack(
                  children: [
                    Container(
                      height: 100,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                      ),
                    ),
                    Positioned(
                      top: 50,
                      child: Hero(
                        tag: "heads",
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 100,width: 100,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset("asset/logo1.png",fit: BoxFit.cover,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15,bottom: 30),
                child: Hero(
                  tag: "text",
                  child: Text("Register Merchant",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w500
                  )

                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.sizeOf(context).height - 300,
                  child: SingleChildScrollView(
                    child:Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: width*0.9,
                          height: 45,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(234, 234, 234, 1.0),
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
                                    decoration: const InputDecoration(
                                      enabled: true,
                                      hintText: "username",
                                      contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                                      border: InputBorder.none,
                                      prefixIconColor: Colors.black,
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: width*0.9,
                          height: 45,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(234, 234, 234, 1.0),
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
                                    decoration: const InputDecoration(
                                      enabled: true,
                                      hintText: "Store name",
                                      contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                                      border: InputBorder.none,
                                      prefixIconColor: Colors.black,
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: width*0.9,
                          height: 45,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(234, 234, 234, 1.0),
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
                                    decoration: const InputDecoration(
                                      enabled: true,
                                      hintText: "Facebook's URL",
                                      contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                                      border: InputBorder.none,
                                      prefixIconColor: Colors.black,
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: width*0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("*facebook.com/[Page ID] | facebook.com/profile.php?id=[Page ID]",style: TextStyle(color: Colors.red,fontSize: 8),),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: width*0.9,
                          height: 45,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(234, 234, 234, 1.0),
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
                                    decoration: const InputDecoration(
                                      enabled: true,
                                      hintText: "Telegram's URL",
                                      contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                                      border: InputBorder.none,
                                      prefixIconColor: Colors.black,
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: width*0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("*t.me/telegram_user",style: TextStyle(color: Colors.red,fontSize: 8),),
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
                              Container(
                                width: width*0.43,
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(234, 234, 234, 1.0),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: TextField(
                                    style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    decoration: const InputDecoration(
                                      enabled: true,
                                      hintText: "Phone number (1)",
                                      hintStyle: TextStyle(
                                        fontSize: 10
                                      ),
                                      contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                                      border: InputBorder.none,
                                      prefixIconColor: Colors.black,
                                    )
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(234, 234, 234, 1.0),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                width: width*0.43,
                                child: TextField(
                                    style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    decoration: const InputDecoration(
                                      enabled: true,
                                      hintText: "Phone Number (2)",
                                      hintStyle: TextStyle(
                                          fontSize: 10
                                      ),
                                      contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                                      border: InputBorder.none,
                                      prefixIconColor: Colors.black,
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: width*0.9,
                          height: 45,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(234, 234, 234, 1.0),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Row(
                            children: [
                              Container(
                                  width: width*0.8,
                                  child:   Autocomplete<String>(
                                    optionsBuilder: (TextEditingValue textEditingValue) {
                                      List<String> suggest_s = [];
                                      if (textEditingValue.text == '') {
                                        return const Iterable<String>.empty();
                                      }
                                      suggest_s.clear();
                                      if(!textEditingValue.text.contains("@")) {
                                        for (String i in Data.suggest) {
                                          suggest_s.add(textEditingValue.text + i);
                                        }
                                        return suggest_s;
                                      }else{
                                        return const Iterable<String>.empty();
                                      }
                                    },
                                    fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                                      return TextFormField(
                                        controller: textEditingController,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                                            border: InputBorder.none,
                                            prefixIconColor: Colors.black,
                                            hintText: 'E-Mail',
                                            hintStyle: GoogleFonts.montserrat(
                                                fontSize: 14
                                            )
                                        ),
                                        focusNode: focusNode,
                                        onFieldSubmitted: (String value) {
                                          onFieldSubmitted();
                                          print('You just typed a new entry  $value');
                                        },
                                      );
                                    },
                                    onSelected: (String selection) {
                                      print('You just selected $selection');
                                    },
                                  )
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: width*0.9,
                          height: 45,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(234, 234, 234, 1.0),
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
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      enabled: true,
                                      hintText: "Password",
                                      contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                                      border: InputBorder.none,
                                      prefixIconColor: Colors.black,
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: width*0.9,
                          height: 45,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(234, 234, 234, 1.0),
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
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      enabled: true,
                                      hintText: "Re-enter Password",
                                      contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                                      border: InputBorder.none,
                                      prefixIconColor: Colors.black,
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: width*0.9,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(234, 234, 234, 1.0),
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
                                    maxLines: 3,
                                    decoration: const InputDecoration(
                                      enabled: true,
                                      hintText: "Address",
                                      contentPadding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                      border: InputBorder.none,
                                      prefixIconColor: Colors.black,
                                    )
                                ),
                              ),
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
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromRGBO(234, 234, 234, 1.0),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                width: width*0.45,
                                child: TextField(
                                    style: GoogleFonts.montserrat(
                                      textStyle: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    decoration: const InputDecoration(
                                      enabled: true,
                                      hintText: "OTP (Send to Email)",
                                      contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                                      border: InputBorder.none,
                                      prefixIconColor: Colors.black,
                                      hintStyle: TextStyle(fontSize: 12)
                                    )
                                ),
                              ),
                              GestureDetector(
                                onTap: controller.buttonEnabled == false ? null
                                    : (){
                                  controller.countdown = 60;
                                  controller.code = generateRandomCode();
                                  controller.disableButton();
                                  controller.update();
                                  print(controller.code);
                                  controller.startTimer();
                                },
                                child: Container(
                                  width:  width*0.35,
                                  padding: EdgeInsets.only(left: 25,right: 25),
                                  decoration: BoxDecoration(
                                      color:  controller.buttonEnabled == true ? Colors.black : Colors.grey,
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: Center(
                                    child: Text(
                                      controller.buttonEnabled == true ? "Get Code" :  controller.formatTime(controller.countdown),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: 14)),
                                    ),
                                  ),
                                ),
                              )
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
                                        margin: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                        child:  InkWell(
                                          onTap: (){
                                            //getx
                                            controller.colorChanged();
                                          },
                                          child: Container(
                                            margin: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: controller.b_color,
                                              borderRadius: BorderRadius.circular(100),
                                            ),
                                          ),
                                        ),
                                      )
                                  ),
                                  SizedBox(width: 10,),
                                  Text("Agree Policy and Term of Use")
                                ],
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => uploadImage()),
                            );
                          },
                          child: Container(
                            width:  width*0.9,
                            padding: EdgeInsets.only(left: 25,right: 25,top: 15,bottom: 15),
                            margin: EdgeInsets.only(left: 5,top: 5),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Center(
                              child: Text(
                                "Next",
                                style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 100,)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }
    );
  }

  String generateRandomCode() {
    final Random _random = Random();
    const String chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const int codeLength = 6;

    String code = '';
    for (int i = 0; i < codeLength; i++) {
      code += chars[_random.nextInt(chars.length)];
    }
    return code;
  }
}
