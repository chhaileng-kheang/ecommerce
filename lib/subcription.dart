
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class subscrption extends StatelessWidget {
  subscrption({super.key});

  bool isexpaned = false;
  List<String> detail = ['10 Photo','3 Category'];
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
                  subcriptionCard(width,"Standard","0.00", ['15 Photo','3 Category'] ,"0",true),
                  subcriptionCard(width,"Premium","12", ['35 Photo','5 Category','Image Description','No Ads Banner'] ,"50",false),
                  subcriptionCard(width,"Premium Plus","20", ['50 Photo','10 Category','Image Description','No Ads Banner','Sponsor Feed'] ,"50",false),
                  subcriptionCard(width,"Diamond","30", ['80 Photo','15 Category','Image Description','No Ads Banner','Sponsor Feed','Recommend Feed'] ,"50",false),
                  SizedBox(height: 50,)
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

  subcriptionCard(double width,String plan_name, String price, List Detail,String discount,bool selected) {
    return Container(
      width: width*0.9,
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Color(0xFFFFF0BE),
        borderRadius: BorderRadius.circular(5),
      ),

      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(plan_name,style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14)),),
                    discount == "0" ? Text("\$" + price,style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 14)),) :
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 5,right: 5,top: 2,bottom: 2),
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(3)
                              ),
                              child: Row(
                                children: [
                                  Text("-"+discount + "%",style: GoogleFonts.montserrat(textStyle : TextStyle(color: Colors.white)),),
                                  SizedBox(width: 10,),
                                  Text("\$" + price,style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 14,
                                      decoration: TextDecoration.lineThrough, decorationThickness: 1.5, decorationColor: Colors.white)),),

                                ],
                              ),

                            ),
                            SizedBox(width: 10,),
                             Text("\$" + (double.parse(price) - (double.parse(price) * double.parse(discount)/100)).toString(),style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 16)),),

                          ],
                        )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5,bottom: 5),
                  height: 3,
                  width: width*0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: Detail.map((e) => Container(
                      margin: EdgeInsets.only(top: 3),

                      child: e.toString().contains("Sponsor") ? Row(
                        children: [
                          Text("- $e",style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 12))),
                          SizedBox(width: 10,),
                          Tooltip(
                              showDuration: Duration(seconds: 5),
                              margin: EdgeInsets.only(left: 5, right: 5),
                              triggerMode: TooltipTriggerMode.tap,
                              message: "ផលិតផលនិងបង្ហាញនៅលើផ្នែក Sponsor",
                              child: Icon(Icons.info_outline,size: 14,)),
                        ],
                      ) : e.toString().contains("Feed") ? Row(
                    children: [
                      Text("- $e",style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 12))),
                  SizedBox(width: 10,),
                  Tooltip(
                  showDuration: Duration(seconds: 5),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      triggerMode: TooltipTriggerMode.tap,
                      message: "ផលិតផលរបស់អ្នកនិងបង្ហាញនៅលើ Product Feed រៀងរាល់ 5 ផលិតផលម្ដង",
                      child: Icon(Icons.info_outline,size: 14,)),
                    ],
                  ) : Text("- $e",style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 12)))
                  )).toList(),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 10,right: 10,
            child: GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: selected == true ? Colors.grey : Colors.black,
                ),
                child: selected == true ? Text("currently",style: GoogleFonts.montserrat(textStyle : TextStyle(color: Colors.white)),) : Text("Select",style: GoogleFonts.montserrat(textStyle : TextStyle(color: Colors.white)),
              ),
            ),
          )
    )
    ],
      ),
    );


  }
}
