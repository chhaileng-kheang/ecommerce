import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../CurvedContainer.dart';
class leadingPage extends StatefulWidget {
  leadingPage({super.key});

  @override
  State<leadingPage> createState() => _leadingPageState();
}

class _leadingPageState extends State<leadingPage> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> Page = [
      Page_One(context),
      Page_Two(context),
      Page_Three(context),
      Page_Four(context),

    ];
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.centerRight,
            radius: 5,
            colors: [
              Colors.orange.shade100,
              Color(0xFFFFAD5B),

            ],
            stops: [0.1, 0.2],
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return  Stack(
              children: [
                PageView.builder(
                  onPageChanged: (index){
                    setState(() {
                      currentindex = index;

                    });
                  },
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: Page.length,itemBuilder: (context, index) => Page[index],),
                if(constraints.maxWidth>= 1400)...[
                  Positioned(
                    left: 10,
                    top: MediaQuery.sizeOf(context).height*0.3,
                    child: Column(
                        children: [
                          for(int j = 0 ; j < Page.length ; j++)...[
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              padding: EdgeInsets.all(2),
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: currentindex == j ? Colors.black : Colors.white,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                              ),
                            )
                          ]
                        ]
                    ),
                  ),
                ]else...[
                  if(constraints.maxWidth >= 600)...[
                  Positioned(
                    left: 10,
                    top: MediaQuery.sizeOf(context).height*0.35,
                    child: Column(
                        children: [
                          for(int j = 0 ; j < Page.length ; j++)...[
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              padding: EdgeInsets.all(2),
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: currentindex == j ? Colors.black : Colors.white,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                              ),
                            )
                          ]
                        ]
                    ),
                  ),
            ]else...[
                    Positioned(
                      left: 10,
                      top: MediaQuery.sizeOf(context).height*0.35,
                      child: Column(
                          children: [
                            for(int j = 0 ; j < Page.length ; j++)...[
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(100)
                                ),
                                padding: EdgeInsets.all(2),
                                child: Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                      color: currentindex == j ? Colors.black : Colors.white,
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                ),
                              )
                            ]
                          ]
                      ),
                    ),
                  ]
                ]
              ],
            );
          },
        )
      ),
    );
  }
}
Page_One(BuildContext context) {
  return LayoutBuilder(builder: (context, constraints) {
    if(constraints.maxWidth >= 1840) {
      return Container(
        height: MediaQuery
            .sizeOf(context)
            .height,
        width: MediaQuery
            .sizeOf(context)
            .width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery
                        .sizeOf(context)
                        .height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 200, top: MediaQuery
                                .sizeOf(context)
                                .height * 0.17),
                            child: Text("APP_Name",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(fontSize: 40,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)))),
                        Container(
                          margin: EdgeInsets.only(left: 200, top: 80),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Scaling Online ",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(fontSize: 82,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),),
                                  Text("Business",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(fontSize: 82,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold))),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("FOR ", style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 82,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                                  Text("FREE", style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 82,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Set up your STORE and send to customer ",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400))),
                                  Text("in 3 second",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400))),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20, right: 10),
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFFFFE9D2)
                                    ),
                                    child: Text("Download",
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20, right: 10),
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFFFFE9D2)
                                    ),
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.play_arrow, size: 30,),

                                            SizedBox(width: 5,),
                                            Text("Play Store",
                                                style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight
                                                            .w600))),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10),
                                          height: 25,
                                          width: 3,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(100),
                                              color: Colors.black
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.apple, size: 30),
                                            SizedBox(width: 5,),
                                            Text("APP Store",
                                                style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight
                                                            .w600))),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1000,
                    width: 600,
                    child: Stack(
                      children: [

                        Positioned(
                          right: 0,
                          top: 100,
                          child: Container(
                            height: 800,
                            width: 500,

                            decoration: BoxDecoration(
                                color: Color(0xFFFFAD5B),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5000),
                                    topLeft: Radius.circular(5000))
                            ),
                          ),
                        ),
                        Container(
                          height: 200,
                          width: 200,
                          margin: EdgeInsets.only(left: 300, top: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(1000)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1000),
                            child: Image.asset(
                              "asset/im2.jpg", fit: BoxFit.cover,),
                          ),
                        ),
                        Container(
                            height: 200,
                            width: 200,
                            margin: EdgeInsets.only(left: 300, top: 750),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(1000)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(1000),
                              child: Image.asset(
                                "asset/im1.jpg", fit: BoxFit.cover,),
                            )
                        ),
                        Container(
                          height: 200,
                          width: 200,
                          margin: EdgeInsets.only(left: 40, top: 400),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(1000)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1000),
                            child: Image.asset(
                              "asset/logo1.png", fit: BoxFit.cover,),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    } else if(constraints.maxWidth >= 1400){
      return Container(
        height: MediaQuery
            .sizeOf(context)
            .height,
        width: MediaQuery
            .sizeOf(context)
            .width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery
                        .sizeOf(context)
                        .height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 150, top: MediaQuery
                                .sizeOf(context)
                                .height * 0.17),
                            child: Text("APP_Name",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(fontSize: 40,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)))),
                        Container(
                          margin: EdgeInsets.only(left: 200, top: 80),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Scaling Online ",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(fontSize: 60,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),),
                                  Text("Business",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(fontSize: 60,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold))),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("FOR ", style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 60,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                                  Text("FREE", style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 60,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Set up your STORE and send to customer ",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400))),
                                  Text("in 3 second",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400))),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20, right: 10),
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFFFFE9D2)
                                    ),
                                    child: Text("Download",
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20, right: 10),
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFFFFE9D2)
                                    ),
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.play_arrow, size: 30,),

                                            SizedBox(width: 5,),
                                            Text("Play Store",
                                                style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight
                                                            .w600))),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10),
                                          height: 25,
                                          width: 3,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(100),
                                              color: Colors.black
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.apple, size: 30),
                                            SizedBox(width: 5,),
                                            Text("APP Store",
                                                style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight
                                                            .w600))),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 800,
                    width: 400,
                    child: Stack(
                      children: [

                        Positioned(
                          right: 0,
                          top: 100,
                          child: Container(
                            height: 600,
                            width: 350,
                            decoration: BoxDecoration(
                                color: Color(0xFFFFAD5B),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5000),
                                    topLeft: Radius.circular(5000))
                            ),
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          margin: EdgeInsets.only(left: 100, top: 50),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(1000)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1000),
                            child: Image.asset(
                              "asset/im2.jpg", fit: BoxFit.cover,),
                          ),
                        ),
                        Container(
                            height: 150,
                            width: 150,
                            margin: EdgeInsets.only(left: 100, top: 550),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(1000)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(1000),
                              child: Image.asset(
                                "asset/im1.jpg", fit: BoxFit.cover,),
                            )
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          margin: EdgeInsets.only(left: 0, top: 300),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(1000)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1000),
                            child: Image.asset(
                              "asset/logo1.png", fit: BoxFit.cover,),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }else if(constraints.maxWidth >=950) {
      return Container(
        height: MediaQuery
            .sizeOf(context)
            .height,
        width: MediaQuery
            .sizeOf(context)
            .width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery
                        .sizeOf(context)
                        .height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 200, top: MediaQuery
                                .sizeOf(context)
                                .height * 0.10),
                            child: Text("APP_Name",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)))),
                        Container(
                          margin: EdgeInsets.only(left: 200, top: 250),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Scaling Online ",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(fontSize: 35,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),),
                                  Text("Business",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(fontSize: 35,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold))),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("FOR ", style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 35,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                                  Text("FREE", style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 35,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Set up your STORE and send to customer ",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400))),
                                  Text("in 3 second",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400))),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20, right: 10),
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFFFFE9D2)
                                    ),
                                    child: Text("Download",
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600))),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20, right: 10),
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFFFFE9D2)
                                    ),
                                    child: Row(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.play_arrow, size: 20,),

                                            SizedBox(width: 5,),
                                            Text("Play Store",
                                                style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight
                                                            .w600))),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10),
                                          height: 18,
                                          width: 3,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(100),
                                              color: Colors.black
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.apple, size: 20),
                                            SizedBox(width: 5,),
                                            Text("APP Store",
                                                style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight
                                                            .w600))),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 500,
                    width: 300,
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            height: 400,
                            width: 250,
                            decoration: BoxDecoration(
                                color: Color(0xFFFFAD5B),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5000),
                                    topLeft: Radius.circular(5000))
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.only(left: 100, top: 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(1000)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1000),
                            child: Image.asset(
                              "asset/im2.jpg", fit: BoxFit.cover,),
                          ),
                        ),
                        Container(
                            height: 100,
                            width: 100,
                            margin: EdgeInsets.only(left: 100, top: 300),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(1000)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(1000),
                              child: Image.asset(
                                "asset/im1.jpg", fit: BoxFit.cover,),
                            )
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.only(left: 10, top: 150),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(1000)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(1000),
                            child: Image.asset(
                              "asset/logo1.png", fit: BoxFit.cover,),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }else if(constraints.maxWidth >=450){
      return Container(
        height: MediaQuery
            .sizeOf(context)
            .height,
        width: MediaQuery
            .sizeOf(context)
            .width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 320,
                width: 450,
                child: Stack(
                  children: [
                    Positioned(
                      right: 50,
                      top: 0,
                      child: Container(
                        height: 250,
                        width: 350,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: Offset(0,0),
                              color: Colors.white
                            )
                          ],
                            color: Color(0xFFFFAD5B),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5000),
                                bottomRight: Radius.circular(5000))
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(left: 10, top: 50),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(1000)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.asset(
                          "asset/im2.jpg", fit: BoxFit.cover,),
                      ),
                    ),
                    Container(
                        height: 100,
                        width: 100,
                        margin: EdgeInsets.only(left: 340, top: 50),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(1000)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: Image.asset(
                            "asset/im1.jpg", fit: BoxFit.cover,),
                        )
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(left: 180, top: 200),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(1000)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.asset(
                          "asset/logo1.png", fit: BoxFit.cover,),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text("APP_Name",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)))),
                    Container(
                      margin: EdgeInsets.only(left: 70, top: 150),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Scaling Online ",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(fontSize: constraints.maxWidth >= 700 ? 40: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),),
                              Text("Business",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: constraints.maxWidth >= 700 ? 50: 25,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))),
                            ],
                          ),
                          Row(
                            children: [
                              Text("FOR ", style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(fontSize: constraints.maxWidth >= 500 ? 40: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                              Text("FREE", style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(fontSize: constraints.maxWidth >= 500 ? 40: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Set up your STORE and send to customer ",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400))),
                              Text("in 3 second",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400))),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20, right: 10),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFFFFE9D2)
                                ),
                                child: Text("Download",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600))),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20, right: 10),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFFFFE9D2)
                                ),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.play_arrow, size: 20,),

                                        SizedBox(width: 5,),
                                        Text("Play Store",
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight
                                                        .w600))),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 10, right: 10),
                                      height: 16,
                                      width: 3,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius
                                              .circular(100),
                                          color: Colors.black
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.apple, size: 20),
                                        SizedBox(width: 5,),
                                        Text("APP Store",
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight
                                                        .w600))),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      );
    }else if(constraints.maxWidth >= 350){
      return Container(
        height: MediaQuery
            .sizeOf(context)
            .height,
        width: MediaQuery
            .sizeOf(context)
            .width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: 350,
                child: Stack(
                  children: [
                    Positioned(
                      left: 40,
                      right: 40,
                      top: 0,
                      child: Container(
                        height: 150,
                        width: 200,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  offset: Offset(0,0),
                                  color: Colors.white
                              )
                            ],
                            color: Color(0xFFFFAD5B),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5000),
                                bottomRight: Radius.circular(5000))
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(left: 25, top: 50),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(1000)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.asset(
                          "asset/im2.jpg", fit: BoxFit.cover,),
                      ),
                    ),
                    Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.only(left: 270, top: 50),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(1000)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: Image.asset(
                            "asset/im1.jpg", fit: BoxFit.cover,),
                        )
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(left: 150, top: 120),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(1000)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.asset(
                          "asset/logo1.png", fit: BoxFit.cover,),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text("APP_Name",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)))),
                    Container(
                      margin: EdgeInsets.only(left: MediaQuery.sizeOf(context).width*0.2, top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Scaling Online ",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),),
                              Text("Business",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))),
                            ],
                          ),
                          Row(
                            children: [
                              Text("FOR ", style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                              Text("FREE", style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Set up your STORE and send to customer ",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400))),
                              Text("in 3 second",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400))),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20, right: 10),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFFFFE9D2)
                                ),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.play_arrow, size: 16,),

                                        SizedBox(width: 5,),
                                        Text("Play Store",
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight
                                                        .w600))),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 10, right: 10),
                                      height: 12,
                                      width: 3,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius
                                              .circular(100),
                                          color: Colors.black
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.apple, size: 16),
                                        SizedBox(width: 5,),
                                        Text("APP Store",
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight
                                                        .w600))),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      );
    }else{
      return Container();
    }
  },);
}


Page_Two(BuildContext context) {
  return LayoutBuilder(builder: (context, constraints) {
    if(constraints.maxWidth >= 1840) {
      return Container(
        height: MediaQuery
            .sizeOf(context)
            .height,
        width: MediaQuery
            .sizeOf(context)
            .width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery
                        .sizeOf(context)
                        .height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 200, top: MediaQuery
                              .sizeOf(context)
                              .height * 0.27),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Short ", style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 82,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),),
                                  Text("Video", style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 82,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("For Your ",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(fontSize: 82,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold))),
                                  Text("Product", style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 82,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Post Short video ",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400))),
                                  Text("Link to Exist Product",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400))),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20, right: 10),
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFFFFE9D2)
                                    ),
                                    child: Text("Upload",
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600))),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 800,
                    height: MediaQuery
                        .sizeOf(context)
                        .height,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 500,
                            width: 600,
                            decoration: BoxDecoration(color: Colors.black,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(1000))
                            ),
                          ),
                        ),
                        Positioned(
                            right: 0,
                            child: Container(
                              margin: EdgeInsets.only(top: 200, right: 100),
                              child: Image.asset("asset/short.png", width: 600,
                                fit: BoxFit.fitWidth,),
                            ))
                      ],
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      );
    }else if(constraints.maxWidth >= 1400) {
      return Container(
        height: MediaQuery
            .sizeOf(context)
            .height,
        width: MediaQuery
            .sizeOf(context)
            .width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery
                        .sizeOf(context)
                        .height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 200, top: MediaQuery
                              .sizeOf(context)
                              .height * 0.27),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Short ", style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 60,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),),
                                  Text("Video", style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 60,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("For Your ",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(fontSize: 60,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold))),
                                  Text("Product", style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 60,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Post Short video ",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400))),
                                  Text("Link to Exist Product",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400))),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20, right: 10),
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFFFFE9D2)
                                    ),
                                    child: Text("Upload",
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600))),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 600,
                    height: MediaQuery
                        .sizeOf(context)
                        .height,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 500,
                            width: 600,
                            decoration: BoxDecoration(color: Colors.black,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(1000))
                            ),
                          ),
                        ),
                        Positioned(

                            child: Container(
                              margin: EdgeInsets.only(top: 200, right: 0),
                              child: Image.asset("asset/short.png", width: 600,
                                fit: BoxFit.fitWidth,),
                            ))
                      ],
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      );
    }else if(constraints.maxWidth >= 900) {
      return Container(
        height: MediaQuery
            .sizeOf(context)
            .height,
        width: MediaQuery
            .sizeOf(context)
            .width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery
                        .sizeOf(context)
                        .height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 100, top: MediaQuery
                              .sizeOf(context)
                              .height * 0.27),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Short ", style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 40,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),),
                                  Text("Video", style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 40,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("For Your ",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(fontSize: 40,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold))),
                                  Text("Product", style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 40,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Post Short video ",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400))),
                                  Text("Link to Exist Product",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400))),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20, right: 10),
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFFFFE9D2)
                                    ),
                                    child: Text("Upload",
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600))),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 400,
                    height: MediaQuery
                        .sizeOf(context)
                        .height,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 500,
                            width: 400,
                            decoration: BoxDecoration(color: Colors.black,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(1000))
                            ),
                          ),
                        ),
                        Positioned(

                            child: Container(
                              margin: EdgeInsets.only(top: 300, right: 0),
                              child: Image.asset("asset/short.png", width: 800,
                                fit: BoxFit.fitWidth,),
                            ))
                      ],
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      );
    }else if(constraints.maxWidth >=500) {
      return Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                margin: EdgeInsets.only(top: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 100, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Short ", style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(fontSize: 40,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),),
                              Text("Video", style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(fontSize: 40,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                            ],
                          ),
                          Row(
                            children: [
                              Text("For Your ",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 40,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                              Text("Product", style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(fontSize: 40,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Post Short video ",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400))),
                              Text("Link to Exist Product",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400))),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20, right: 10),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFFFFE9D2)
                                ),
                                child: Text("Upload",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600))),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height - 400,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 400,
                        width: 400,
                        decoration: BoxDecoration(color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(1000))
                        ),
                      ),
                    ),
                    Positioned(
                        child: Container(
                          child: Image.asset("asset/short.png", width: 400,
                            fit: BoxFit.fitHeight,),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }else if(constraints.maxWidth >=350){
      return Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: SingleChildScrollView(
          child: Column(

            children: [
              Container(
                height: 300,
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 50, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Short ", style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),),
                              Text("Video", style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                            ],
                          ),
                          Row(
                            children: [
                              Text("For Your ",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                              Text("Product", style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Post Short video ",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400))),
                              Text("Link to Exist Product",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400))),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20, right: 10),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFFFFE9D2)
                                ),
                                child: Text("Upload",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600))),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height - 350,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(1000))
                        ),
                      ),
                    ),
                    Positioned(
                        child: Container(
                          child: Image.asset("asset/short.png", width: 300,
                            fit: BoxFit.fitHeight,),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }else{
     return Container();
    }
  },);
}
Page_Three(BuildContext context) {
  return LayoutBuilder(builder: (context, constraints) {
    if(constraints.maxWidth >= 1840) {
      return Container(
        height: MediaQuery
            .sizeOf(context)
            .height,
        width: MediaQuery
            .sizeOf(context)
            .width,
        child: SingleChildScrollView(

          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height,
                    child: Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 200,top: MediaQuery.sizeOf(context).height*0.27),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Connecting to",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 82, color: Colors.white,fontWeight: FontWeight.bold)),),
                                  Text("Delivery",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 82, color: Colors.black,fontWeight: FontWeight.bold))),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Calling delivery and",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.w400))),
                                  Text(" save your customer",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w400))),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20,right: 10),
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFFFFE9D2)
                                    ),
                                    child: Text("Sign Up",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w600))),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 800,
                    height: 1200,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            height: 500,
                            width: 600,
                            decoration: BoxDecoration(color: Colors.black,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(1000))
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 250,),
                          height: 600,
                          width: 800,
                          child: Stack(
                            children: [
                          Container(
                              width: 600,height: 600,
                            margin: EdgeInsets.only(left: 100),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.asset("asset/deli2.jpg",width: 600,height: 600,fit: BoxFit.cover,)),
                          ),
                          Positioned(
                            right:  100,
                              child: Container(
                                height: 80,
                                width: 400,
                                padding: EdgeInsets.only(right: 20,left: 20,bottom: 10,top: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0,0),
                                          spreadRadius: 2,
                                          blurRadius: 2
                                      )
                                    ]
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Phnom Penh, Cambodia",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w600))),
                                    Icon(Icons.location_on_rounded,size: 36,)
                                  ],
                                ),
                              )
                          ),
                          Positioned(
                            top: 500,
                            left: 0,
                            child: Container(
                              height: 80,
                              width: 400,
                              padding: EdgeInsets.only(right: 20,left: 20,bottom: 10,top: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0,0),
                                      spreadRadius: 2,
                                      blurRadius: 2
                                  )
                            ],

                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Delivering to customer",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w600))),
                                  Icon(Icons.assistant_navigation,size: 36,)
                                ],
                              ),

                            )
                        )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      );
    }
    else if(constraints.maxWidth >= 1400) {
      return Container(
        height: MediaQuery
            .sizeOf(context)
            .height,
        width: MediaQuery
            .sizeOf(context)
            .width,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height,
                    child: Column(
                      crossAxisAlignment:  CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 200,top: MediaQuery.sizeOf(context).height*0.27),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Connecting to",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 60, color: Colors.white,fontWeight: FontWeight.bold)),),
                                  Text("Delivery",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 60, color: Colors.black,fontWeight: FontWeight.bold))),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Calling delivery and",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.w400))),
                                  Text(" save your customer",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w400))),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 20,right: 10),
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFFFFE9D2)
                                    ),
                                    child: Text("Sign Up",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w600))),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 600,
                    height: 1200,
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          child: Container(
                            height: 500,
                            width: 600,
                            decoration: BoxDecoration(color: Colors.black,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(1000))
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 250,),
                          height: 600,
                          width: 600,
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 50),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(1000),
                                    child: Image.asset("asset/deli2.jpg",width: 400,height: 400,fit: BoxFit.cover,)),
                              ),
                              Positioned(
                                  right:  100,
                                  child: Container(
                                    height: 60,
                                    width: 300,
                                    padding: EdgeInsets.only(right: 20,left: 20,bottom: 10,top: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              offset: Offset(0,0),
                                              spreadRadius: 2,
                                              blurRadius: 2
                                          )
                                        ]
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Phnom Penh, Cambodia",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w600))),
                                        Icon(Icons.location_on_rounded,size: 26,)
                                      ],
                                    ),
                                  )
                              ),
                              Positioned(
                                  top: 350,
                                  left: 0,
                                  child: Container(
                                    height: 60,
                                    width: 300,
                                    padding: EdgeInsets.only(right: 20,left: 20,bottom: 10,top: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0,0),
                                            spreadRadius: 2,
                                            blurRadius: 2
                                        )
                                      ],

                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Delivering to customer",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w600))),
                                        Icon(Icons.assistant_navigation,size: 26,)
                                      ],
                                    ),

                                  )
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),

            ],
          ),
        ),
      );
    }
    else if(constraints.maxWidth >= 900) {
      return Container(
        height: MediaQuery
            .sizeOf(context)
            .height,
        width: MediaQuery
            .sizeOf(context)
            .width,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 700,
                height: 600,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      child: Container(
                        height: 500,
                        width: 400,
                        decoration: BoxDecoration(color: Colors.black,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(1000))
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 150,),
                      height: 600,
                      width: 600,
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 150),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.asset("asset/deli2.jpg",width: 400,height: 400,fit: BoxFit.cover,)),
                          ),
                          Positioned(
                              right:  20,
                              child: Container(
                                height: 60,
                                width: 300,
                                padding: EdgeInsets.only(right: 20,left: 20,bottom: 10,top: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0,0),
                                          spreadRadius: 2,
                                          blurRadius: 2
                                      )
                                    ]
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Phnom Penh, Cambodia",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w600))),
                                    Icon(Icons.location_on_rounded,size: 26,)
                                  ],
                                ),
                              )
                          ),
                          Positioned(
                              top: 350,
                              left: 30,
                              child: Container(
                                height: 60,
                                width: 300,
                                padding: EdgeInsets.only(right: 20,left: 20,bottom: 10,top: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0,0),
                                        spreadRadius: 2,
                                        blurRadius: 2
                                    )
                                  ],

                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Delivering to customer",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w600))),
                                    Icon(Icons.assistant_navigation,size: 26,)
                                  ],
                                ),

                              )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 100,top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Connecting to",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 60, color: Colors.white,fontWeight: FontWeight.bold)),),
                        Text("Delivery",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 60, color: Colors.black,fontWeight: FontWeight.bold))),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Calling delivery and",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.w400))),
                        Text(" save your customer",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w400))),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20,right: 10),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFFFFE9D2)
                          ),
                          child: Text("Sign Up",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w600))),
                        ),
                      ],
                    )
                  ],
                ),
              ),


            ],
          ),
        ),
      );
    }else if(constraints.maxWidth >=500) {
      return Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 450,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      child: Container(
                        height: 400,
                        width: 400,
                        decoration: BoxDecoration(color: Colors.black,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(1000))
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50,left: constraints.maxWidth > 600 ? 100 : 30),
                      height: 600,
                      width: 600,
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 50),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.asset("asset/deli2.jpg",width: constraints.maxWidth>600 ? 400 : 350,height: constraints.maxWidth>600 ? 400 : 350,fit: BoxFit.cover,)),
                          ),
                          Positioned(
                              right:  constraints.maxWidth>600 ? 100 : 30,
                              child: Container(
                                height: 60,
                                width: 270,
                                padding: EdgeInsets.only(right: 20,left: 20,bottom: 10,top: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0,0),
                                          spreadRadius: 2,
                                          blurRadius: 2
                                      )
                                    ]
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Phnom Penh, Cambodia",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w600))),
                                    Icon(Icons.location_on_rounded,size: 26,)
                                  ],
                                ),
                              )
                          ),
                          Positioned(
                              top: 320,
                              left: 0,
                              child: Container(
                                height: 60,
                                width: 270,
                                padding: EdgeInsets.only(right: 20,left: 20,bottom: 10,top: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0,0),
                                        spreadRadius: 2,
                                        blurRadius: 2
                                    )
                                  ],

                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Delivering to customer",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w600))),
                                    Icon(Icons.assistant_navigation,size: 26,)
                                  ],
                                ),

                              )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 400,
                margin: EdgeInsets.only(top: 10),
                child:  Column(
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 100,top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Connecting to",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 40, color: Colors.white,fontWeight: FontWeight.bold)),),
                              Text("Delivery",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 40, color: Colors.black,fontWeight: FontWeight.bold))),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Calling delivery and",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.w400))),
                              Text(" save your customer",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.w400))),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20,right: 10),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFFFFE9D2)
                                ),
                                child: Text("Sign Up",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w600))),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      );
    }else if(constraints.maxWidth >=350){
      return Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: SingleChildScrollView(

          child: Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 300,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      child: Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(color: Colors.black,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(1000),
                            )
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50,left: 15),
                      height: 350,
                      width: 350,
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: MediaQuery.sizeOf(context).width*0.2),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.asset("asset/deli2.jpg",width: 200,height: 200,fit: BoxFit.cover,)),
                          ),
                          Positioned(
                              right:  constraints.maxWidth>600 ? 100 : 30,
                              child: Container(
                                height: 40,
                                width: 200,
                                padding: EdgeInsets.only(right: 20,left: 20,bottom: 10,top: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0,0),
                                          spreadRadius: 2,
                                          blurRadius: 2
                                      )
                                    ]
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Phnom Penh, Cambodia",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 10, color: Colors.black,fontWeight: FontWeight.w600))),
                                    Icon(Icons.location_on_rounded,size: 20,)
                                  ],
                                ),
                              )
                          ),
                          Positioned(
                              top: 180,
                              left: 40,
                              child: Container(
                                height: 40,
                                width: 200,
                                padding: EdgeInsets.only(right: 20,left: 20,bottom: 10,top: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0,0),
                                        spreadRadius: 2,
                                        blurRadius: 2
                                    )
                                  ],

                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Delivering to customer",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 10, color: Colors.black,fontWeight: FontWeight.w600))),
                                    Icon(Icons.assistant_navigation,size: 20,)
                                  ],
                                ),

                              )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 80,top: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Connecting to",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold)),),
                              Text("Delivery",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold))),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Calling delivery and",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.w400))),
                              Text("save your customer",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.w400))),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20,right: 10),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFFFFE9D2)
                                ),
                                child: Text("Sign Up",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 12, color: Colors.black,fontWeight: FontWeight.w600))),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      );
    }else{
      return Container();
    }
  },);

}

Page_Four(BuildContext context) {
  return Container(
    height: MediaQuery.sizeOf(context).height,
    width: MediaQuery.sizeOf(context).width,
    child: Stack(
      children: [
        Positioned(
          bottom: 0,
          child: ClipPath(
            clipper: CurvedTopClipper(),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 200,
              padding: EdgeInsets.only(top: 100),
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Powered By",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 10, color: Colors.white,fontWeight: FontWeight.w400))),
                  SizedBox(height: 5,),
                  Text("APP_NAME",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 10, color: Colors.white,fontWeight: FontWeight.w400)))
                ],
              ),
            ),
          ),
        ),
        LayoutBuilder(builder: (context, constraints) {
          if(constraints.maxWidth >=  1750){
            return Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 100,top: MediaQuery.sizeOf(context).height*0.07),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("CREATE PROMOTE ",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 82, color: Colors.white,fontWeight: FontWeight.bold))),
                                  Text("LINK",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 82, color: Colors.black,fontWeight: FontWeight.bold)))
                                ],
                              ),
                              Text("Using Multiple social, Phone number, Linking to Your Product",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.w400))),
                              Text("for sharing or advertising.",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w400))),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFFFFE9D2)
                                ),
                                child: Text("Create LINK",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold))),
                              )
                            ],
                          ),
                          Container(
                            height: 1000,
                            width: 600,
                            margin: EdgeInsets.only(top: 50),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 70,
                                  top: 30,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 350,
                                        height: 750,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(30),
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 3,
                                            )
                                        ),
                                      ),
                                      Positioned(
                                        top: 20,
                                        left: 100,
                                        child: Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: Colors.black,width: 2),
                                              borderRadius: BorderRadius.circular(100)
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 20,
                                        left: 120,
                                        child: Container(
                                          height: 15,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: Colors.black,width: 2),
                                              borderRadius: BorderRadius.circular(100)
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 70,
                                        left: 120,
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: Colors.black,width: 2),
                                              borderRadius: BorderRadius.circular(100)
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(1000),
                                            child: Image.asset("asset/logo1.png"),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: 250,
                                    left: 30,
                                    child: Container(
                                      height: 50,
                                      width: 170,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.red,
                                            width: 2
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black38,
                                              offset: Offset(1,0),
                                              spreadRadius: 1,
                                              blurRadius: 1

                                          )
                                        ],
                                      ),
                                      padding: EdgeInsets.only(left: 10,right: 10,top: 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.facebook),
                                          Text("Facebook URL",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold)))
                                        ],
                                      ),
                                    )),
                                Positioned(
                                    top: 450,
                                    left: 30,
                                    child: Container(
                                      height: 50,
                                      width: 170,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: Colors.red,
                                              width: 2
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black38,
                                                offset: Offset(1,0),
                                                spreadRadius: 1,
                                                blurRadius: 1

                                            )
                                          ]
                                      ),
                                      padding: EdgeInsets.only(left: 10,right: 10,top: 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.telegram),
                                          Text("Telegram URL",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold)))
                                        ],
                                      ),
                                    )),
                                Positioned(
                                    right: 130,
                                    top: 350,
                                    child: Container(
                                      height: 50,
                                      width: 170,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.red,
                                            width: 2
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black38,
                                              offset: Offset(1,0),
                                              spreadRadius: 1,
                                              blurRadius: 1

                                          )
                                        ],
                                      ),
                                      padding: EdgeInsets.only(left: 10,right: 10,top: 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.phone),
                                          Text("Phone Number",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold)))
                                        ],
                                      ),
                                    )),
                                Positioned(
                                  right: 130,
                                  top: 550,
                                  child: Container(
                                    height: 50,
                                    width: 170,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.red,
                                          width: 2
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black38,
                                            offset: Offset(1,0),
                                            spreadRadius: 1,
                                            blurRadius: 1

                                        )
                                      ],
                                    ),
                                    padding: EdgeInsets.only(left: 10,right: 10,top: 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.store),
                                        Text("Linking Product",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 13.5, color: Colors.black,fontWeight: FontWeight.bold)))
                                      ],
                                    ),
                                  ),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }else if(constraints.maxWidth >=  950){
           return Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 100,top: MediaQuery.sizeOf(context).height*0.07),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("CREATE PROMOTE ",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 40, color: Colors.white,fontWeight: FontWeight.bold))),
                                  Text("LINK",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 60, color: Colors.black,fontWeight: FontWeight.bold)))
                                ],
                              ),
                              Text("Using Multiple social, Phone number,",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.w400))),
                              Text(" Linking to Your Product",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.w400))),
                              Text("for sharing or advertising.",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w400))),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFFFFE9D2)
                                ),
                                child: Text("Create LINK",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold))),
                              )
                            ],
                          ),
                          Container(
                            height: 800,
                            width: 400,
                            margin: EdgeInsets.only(top: 250),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 50,
                                  top: 30,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 250,
                                        height: 550,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(30),
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 3,
                                            )
                                        ),
                                      ),
                                      Positioned(
                                        top: 20,
                                        left: 60,
                                        child: Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: Colors.black,width: 2),
                                              borderRadius: BorderRadius.circular(100)
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 20,
                                        left: 80,
                                        child: Container(
                                          height: 15,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: Colors.black,width: 2),
                                              borderRadius: BorderRadius.circular(100)
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 70,
                                        left: 80,
                                        child: Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: Colors.black,width: 2),
                                              borderRadius: BorderRadius.circular(100)
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(1000),
                                            child: Image.asset("asset/logo1.png"),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: 220,
                                    left: 30,
                                    child: Container(
                                      height: 50,
                                      width: 170,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.red,
                                            width: 2
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black38,
                                              offset: Offset(1,0),
                                              spreadRadius: 1,
                                              blurRadius: 1

                                          )
                                        ],
                                      ),
                                      padding: EdgeInsets.only(left: 10,right: 10,top: 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.facebook),
                                          Text("Facebook URL",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold)))
                                        ],
                                      ),
                                    )),
                                Positioned(
                                    top: 370,
                                    left: 30,
                                    child: Container(
                                      height: 50,
                                      width: 170,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: Colors.red,
                                              width: 2
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black38,
                                                offset: Offset(1,0),
                                                spreadRadius: 1,
                                                blurRadius: 1

                                            )
                                          ]
                                      ),
                                      padding: EdgeInsets.only(left: 10,right: 10,top: 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.telegram),
                                          Text("Telegram URL",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold)))
                                        ],
                                      ),
                                    )),
                                Positioned(
                                    right: 50,
                                    top: 300,
                                    child: Container(
                                      height: 50,
                                      width: 170,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.red,
                                            width: 2
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black38,
                                              offset: Offset(1,0),
                                              spreadRadius: 1,
                                              blurRadius: 1

                                          )
                                        ],
                                      ),
                                      padding: EdgeInsets.only(left: 10,right: 10,top: 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.phone),
                                          Text("Phone Number",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold)))
                                        ],
                                      ),
                                    )),
                                Positioned(
                                  right: 50,
                                  top: 450,
                                  child: Container(
                                    height: 50,
                                    width: 170,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.red,
                                          width: 2
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black38,
                                            offset: Offset(1,0),
                                            spreadRadius: 1,
                                            blurRadius: 1

                                        )
                                      ],
                                    ),
                                    padding: EdgeInsets.only(left: 10,right: 10,top: 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.store),
                                        Text("Linking Product",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 13.5, color: Colors.black,fontWeight: FontWeight.bold)))
                                      ],
                                    ),
                                  ),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }else if(constraints.maxWidth >=500) {
            return Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 0,top: MediaQuery.sizeOf(context).height*0.01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 600,
                            width: 400,
                            margin: EdgeInsets.only(top: 20),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 70,
                                  top: 30,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 250,
                                        height: 550,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(30),
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 3,
                                            )
                                        ),
                                      ),
                                      Positioned(
                                        top: 20,
                                        left: 60,
                                        child: Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: Colors.black,width: 2),
                                              borderRadius: BorderRadius.circular(100)
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 20,
                                        left: 80,
                                        child: Container(
                                          height: 15,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: Colors.black,width: 2),
                                              borderRadius: BorderRadius.circular(100)
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 70,
                                        left: 80,
                                        child: Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: Colors.black,width: 2),
                                              borderRadius: BorderRadius.circular(100)
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(1000),
                                            child: Image.asset("asset/logo1.png"),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: 220,
                                    left: 30,
                                    child: Container(
                                      height: 50,
                                      width: 170,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.red,
                                            width: 2
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black38,
                                              offset: Offset(1,0),
                                              spreadRadius: 1,
                                              blurRadius: 1

                                          )
                                        ],
                                      ),
                                      padding: EdgeInsets.only(left: 10,right: 10,top: 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.facebook),
                                          Text("Facebook URL",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold)))
                                        ],
                                      ),
                                    )),
                                Positioned(
                                    top: 370,
                                    left: 30,
                                    child: Container(
                                      height: 50,
                                      width: 170,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: Colors.red,
                                              width: 2
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black38,
                                                offset: Offset(1,0),
                                                spreadRadius: 1,
                                                blurRadius: 1

                                            )
                                          ]
                                      ),
                                      padding: EdgeInsets.only(left: 10,right: 10,top: 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.telegram),
                                          Text("Telegram URL",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold)))
                                        ],
                                      ),
                                    )),
                                Positioned(
                                    right: 50,
                                    top: 300,
                                    child: Container(
                                      height: 50,
                                      width: 170,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.red,
                                            width: 2
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black38,
                                              offset: Offset(1,0),
                                              spreadRadius: 1,
                                              blurRadius: 1

                                          )
                                        ],
                                      ),
                                      padding: EdgeInsets.only(left: 10,right: 10,top: 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.phone),
                                          Text("Phone Number",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold)))
                                        ],
                                      ),
                                    )),
                                Positioned(
                                  right: 50,
                                  top: 450,
                                  child: Container(
                                    height: 50,
                                    width: 170,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.red,
                                          width: 2
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black38,
                                            offset: Offset(1,0),
                                            spreadRadius: 1,
                                            blurRadius: 1

                                        )
                                      ],
                                    ),
                                    padding: EdgeInsets.only(left: 10,right: 10,top: 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.store),
                                        Text("Linking Product",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 13.5, color: Colors.black,fontWeight: FontWeight.bold)))
                                      ],
                                    ),
                                  ),)
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("CREATE PROMOTE ",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold))),
                                  Text("LINK",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold)))
                                ],
                              ),
                              Text("Using Multiple social, Phone number,Linking to Your Product",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w400))),
                              Text("for sharing or advertising.",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w400))),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFFFFE9D2)
                                ),
                                child: Text("Create LINK",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold))),
                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }else if(constraints.maxWidth >=350){
            return Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 0,top: MediaQuery.sizeOf(context).height*0.01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 300,
                            width: 270,
                            margin: EdgeInsets.only(top: 20),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 50,
                                  top: 30,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 250,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 3,
                                            )
                                        ),
                                      ),
                                      Positioned(
                                        top: 20,
                                        left: 45,
                                        child: Container(
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: Colors.black,width: 2),
                                              borderRadius: BorderRadius.circular(100)
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 20,
                                        left: 60,
                                        child: Container(
                                          height: 10,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: Colors.black,width: 2),
                                              borderRadius: BorderRadius.circular(100)
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 50,
                                        left: 55,
                                        child: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(color: Colors.black,width: 2),
                                              borderRadius: BorderRadius.circular(100)
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(1000),
                                            child: Image.asset("asset/logo1.png"),
                                          ),
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: 140,
                                    left: 0,
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.red,
                                            width: 2
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black38,
                                              offset: Offset(1,0),
                                              spreadRadius: 1,
                                              blurRadius: 1

                                          )
                                        ],
                                      ),
                                      padding: EdgeInsets.only(left: 10,right: 10,top: 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.facebook,size: 18,),
                                          Text("Facebook URL",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 10, color: Colors.black,fontWeight: FontWeight.w400)))
                                        ],
                                      ),
                                    )),
                                Positioned(
                                    top: 200,
                                    left: 0,
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: Colors.red,
                                              width: 2
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black38,
                                                offset: Offset(1,0),
                                                spreadRadius: 1,
                                                blurRadius: 1

                                            )
                                          ]
                                      ),
                                      padding: EdgeInsets.only(left: 10,right: 10,top: 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.telegram,size: 18,),
                                          Text("Telegram URL",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 10, color: Colors.black,fontWeight: FontWeight.w400)))
                                        ],
                                      ),
                                    )),
                                Positioned(
                                    right: 0,
                                    top: 160,
                                    child: Container(
                                      height: 35,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.red,
                                            width: 2
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black38,
                                              offset: Offset(1,0),
                                              spreadRadius: 1,
                                              blurRadius: 1

                                          )
                                        ],
                                      ),
                                      padding: EdgeInsets.only(left: 8,right: 8,top: 0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.phone,size: 18,),
                                          Text("Phone Number",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 9, color: Colors.black,fontWeight: FontWeight.w400)))
                                        ],
                                      ),
                                    )),
                                Positioned(
                                  right: 0,
                                  top: 220,
                                  child: Container(
                                    height: 35,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.red,
                                          width: 2
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black38,
                                            offset: Offset(1,0),
                                            spreadRadius: 1,
                                            blurRadius: 1

                                        )
                                      ],
                                    ),
                                    padding: EdgeInsets.only(left: 10,right: 10,top: 0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.store,size: 18,),
                                        Text("Linking Product",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 9, color: Colors.black,fontWeight: FontWeight.w400)))
                                      ],
                                    ),
                                  ),)
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("CREATE PROMOTE ",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold))),
                                  Text("LINK",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold)))
                                ],
                              ),
                              Text("Using Multiple social, Phone number,",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w400))),
                              Text("Linking to Your Product,",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w400))),
                              Text("for sharing or advertising.",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w400))),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFFFFE9D2)
                                ),
                                child: Text("Create LINK",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold))),
                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          else {
            return Container();
          }
        },)
      ],
    ),
  );
}

class CustomPageViewScrollPhysics extends ScrollPhysics {
  const CustomPageViewScrollPhysics({ScrollPhysics? parent})
      : super(parent: parent);

  @override
  CustomPageViewScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomPageViewScrollPhysics(parent: buildParent(ancestor)!);
  }

  @override
  SpringDescription get spring => const SpringDescription(
    mass: 50,
    stiffness: 100,
    damping: 0.8,
  );
}

