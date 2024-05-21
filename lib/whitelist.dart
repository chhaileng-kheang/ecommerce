import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class whitelist extends StatefulWidget {
  whitelist({super.key});

  @override
  State<whitelist> createState() => _whitelistState();
}

class _whitelistState extends State<whitelist> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

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
          Container(
            width: width,
            padding: EdgeInsets.only(bottom: 15,top: 15),
            margin: EdgeInsets.only(left: width*0.05,top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Whitelist",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold))),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              width: width*0.9,
              color: Colors.transparent,
              child: ListView.builder(
                itemCount: items.length, itemBuilder: (context,index){
                final item = items[index];
                return Dismissible(
                    key: Key(item),
                    onDismissed: (direction){
                      setState(() {
                        items.removeAt(index);
                      });
                     showSimpleSnackbar(context, "Removed");
                    },
                    background: Container(

                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.red), child: Center(child: Text("Remove"),),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10,top: 1),
                decoration: BoxDecoration(),
                child : favCard(width,"img","Hello","price"))
                );

              },)
            ),
          )
        ],
      )
    );

  }
  void showSimpleSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),  // Adjust the duration as needed
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  favCard(double width, String img, String title, String price) {
    return GestureDetector(
      onTap: (){
        Get.toNamed("/product");
      },
      child: Container(
        width: width*0.85,
        margin: EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
            color: Colors.black38,
            blurRadius: 0.1,
            spreadRadius: 0.1,
            offset: Offset(0,0)
          )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5)),
              child: Image.network("https://images.unsplash.com/photo-1571601035754-5c927f2d7edc?q=80&w=2432&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",height: 120,width: 120,fit: BoxFit.cover,),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: GoogleFonts.montserrat(textStyle : TextStyle(
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
      ),
    );
  }
}
