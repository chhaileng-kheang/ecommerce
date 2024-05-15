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
        child: Stack(
          children: [
            PageView.builder(
              onPageChanged: (index){
                setState(() {
                  currentindex = index;

                });
                print(currentindex);
              },
              scrollDirection: Axis.vertical,
              itemCount: Page.length,itemBuilder: (context, index) => Page[index],),
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
            )
          ],
        )
      ),
    );
  }
}
Page_One(BuildContext context) {
  return Container(
    height: MediaQuery.sizeOf(context).height,
    width: MediaQuery.sizeOf(context).width,
    child: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height,
                child: Column(
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 200,top: MediaQuery.sizeOf(context).height*0.17),
                        child: Text("APP_Name",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 40, color: Colors.white,fontWeight: FontWeight.bold)))),
                    Container(
                      margin: EdgeInsets.only(left: 200,top: 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Scaling Online ",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 82, color: Colors.white,fontWeight: FontWeight.bold)),),
                              Text("Business",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 82, color: Colors.black,fontWeight: FontWeight.bold))),
                            ],
                          ),
                          Row(
                            children: [
                              Text("FOR ",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 82, color: Colors.white,fontWeight: FontWeight.bold))),
                              Text("FREE",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 82, color: Colors.black,fontWeight: FontWeight.bold))),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Set up your STORE and send to customer ",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.w400))),
                              Text("in 3 second",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w400))),
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
                                child: Text("Download",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w600))),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20,right: 10),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFFFFE9D2)
                                ),
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.play_arrow,size: 30,),

                                        SizedBox(width: 5,),
                                        Text("Play Store",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w600))),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10,right: 10),
                                      height: 25,
                                      width: 3,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Colors.black
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.apple,size: 30),
                                        SizedBox(width: 5,),
                                        Text("APP Store",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w600))),
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
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5000), topLeft: Radius.circular(5000))
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      margin: EdgeInsets.only(left: 300,top: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(1000)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.asset("asset/im2.jpg",fit: BoxFit.cover,),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      margin: EdgeInsets.only(left: 300,top: 750),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(1000)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.asset("asset/im1.jpg",fit: BoxFit.cover,),
                      )
                    ),
                    Container(
                      height: 200,
                      width: 200,
                      margin: EdgeInsets.only(left: 40,top: 400),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(1000)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.asset("asset/im3.jpg",fit: BoxFit.cover,),
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
}


Page_Two(BuildContext context) {
  return Container(
    height: MediaQuery.sizeOf(context).height,
    width: MediaQuery.sizeOf(context).width,
    child: Stack(
      children: [
      ],
    ),
  );
}
Page_Three(BuildContext context) {
  return Container(
    height: MediaQuery.sizeOf(context).height,
    width: MediaQuery.sizeOf(context).width,
  );

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
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}
