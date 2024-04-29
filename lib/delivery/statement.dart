import 'package:ecomerce/delivery/storepayment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class statement extends StatelessWidget {
  const statement({super.key});

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

  mainscreen(double width, BuildContext context, int i) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: width,
      child: Column(

        children: [
          Header(width,context),
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
            margin: EdgeInsets.only(top: 10),
            width: width*0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Income Statement",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16))),
                ],
              )),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 15),
              height: MediaQuery.sizeOf(context).height -200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      history(width, context, "14.00", "13/06/2025 - 10:30PM", "Rottana"),
                      history(width, context, "14.00", "13/06/2025 - 10:30PM", "Rottana"),
                      history(width, context, "14.00", "13/06/2025 - 10:30PM", "Rottana"),
                      history(width, context, "14.00", "13/06/2025 - 10:30PM", "Rottana"),
                      history(width, context, "14.00", "13/06/2025 - 10:30PM", "Rottana"),
                      history(width, context, "14.00", "13/06/2025 - 10:30PM", "Rottana"),
                      history(width, context, "14.00", "13/06/2025 - 10:30PM", "Rottana"),
                      history(width, context, "14.00", "13/06/2025 - 10:30PM", "Rottana"),
                      history(width, context, "14.00", "13/06/2025 - 10:30PM", "Rottana"),
                      history(width, context, "14.00", "13/06/2025 - 10:30PM", "Rottana"),
                      history(width, context, "14.00", "13/06/2025 - 10:30PM", "Rottana"),
                      history(width, context, "14.00", "13/06/2025 - 10:30PM", "Rottana"),
                      history(width, context, "14.00", "13/06/2025 - 10:30PM", "Rottana"),
                      history(width, context, "14.00", "13/06/2025 - 10:30PM", "Rottana"),
                      history(width, context, "14.00", "13/06/2025 - 10:30PM", "Rottana"),
                      Container(
                        width: width*0.9,
                        color: Colors.white,
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }

  history(double width, BuildContext context,String price, String dt, String Delivery_name) {
    return Container(
      width: width*0.9,
      color: Colors.white,
      padding: EdgeInsets.only(left: width*0.05,right: width*0.05),
      child: Column(
        children: [

          Container(
            padding: EdgeInsets.only(top: 10,bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$$price",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16))),
                Text("$dt",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 12)))

              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Text("$Delivery_name",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.redAccent,fontWeight: FontWeight.w400,fontSize: 14))),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            height: 1,
            width: width,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
