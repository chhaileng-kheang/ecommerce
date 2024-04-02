import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class whitelist extends StatelessWidget {
  const whitelist({super.key});

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
      child: Column(
        children: [
          Header(width),
          Container(
            width: width,
            margin: EdgeInsets.only(left: width*0.05,top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Your Whitelist"),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              width: width*0.9,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    favCard(width,"img","title","price"),
                    favCard(width,"img","title","price"),
                    favCard(width,"img","title","price"),
                    favCard(width,"img","title","price"),
                    favCard(width,"img","title","price"),
                    favCard(width,"img","title","price"),
                    favCard(width,"img","title","price"),
                    SizedBox(height: 100,)

                  ],
                ),
              ),
            ),
          )
        ],
      )
    );

  }
  Header(double width) {
    return Container(
        height: 50,
        margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 40,),
            Text("App-Name",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
            InkWell(
              onTap: (){
                Get.toNamed("/login");
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const Image(
                  image: NetworkImage("https://pics.craiyon.com/2023-10-13/45c8f06467d74d7d8949ddadffc5b2c8.webp",),
                  height: 40,width: 40,
                ),
              ),
            )
          ],
        )
    );
  }

  favCard(double width, String img, String title, String price) {
    return Container(
      width: width*0.85,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(
          color: Colors.black38,
          blurRadius: 0.1,
          spreadRadius: 0.1,
          offset: Offset(0,0)
        )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
            child: Image.network("https://images.unsplash.com/photo-1571601035754-5c927f2d7edc?q=80&w=2432&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",height: 120,width: 120,fit: BoxFit.cover,),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sneaker 01",style: GoogleFonts.montserrat(textStyle : TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                )),),
                Row(
                  children: [
                    Text("Price : "),
                    Text("10.50\$",style: GoogleFonts.montserrat(textStyle : TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.w500
                    )),)
                  ],
                )
              ],
            ),
          )
          
        ],
      ),
    );
  }
}
