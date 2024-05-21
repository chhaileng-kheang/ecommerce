import 'package:ecomerce/customWidget/classwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class storeList extends StatelessWidget {
  const storeList({super.key});

  @override
  Widget build(BuildContext context) {
    late double width;

    return SafeArea(
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
    );
  }
  mainscreen(double width, BuildContext context, int g) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                 Container(
                   padding: const EdgeInsets.only(top: 10),
                   color: Colors.white,
                   child: Column(
                     children: [
                       Diamond_PremiumPlus(width,context),
                     ],
                   ),
                 ),
                  const SizedBox(height: 10,),
                  storecard(context,"https://images.unsplash.com/photo-1566150905458-1bf1fc113f0d?q=80&w=2671&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","https://images.unsplash.com/photo-1597633244018-0201d0158aab?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","LALI BAGI","292",width),
                  storecard(context,"https://images.unsplash.com/photo-1539874754764-5a96559165b0?q=80&w=2730&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","https://images.unsplash.com/photo-1509048191080-d2984bad6ae5?q=80&w=2564&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","Time & Heal","871",width),
                  storecard(context,"https://images.unsplash.com/photo-1560243563-062bfc001d68?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","https://images.unsplash.com/photo-1594672841203-3fedf29dc8e9?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","Jacky John","9,203",width),
                  storecard(context,"https://images.unsplash.com/photo-1441984904996-e0b6ba687e04?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","https://images.unsplash.com/photo-1575663620136-5ebbfcc2c597?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","Davika","10,250",width),
                  const SizedBox(height: 100,)
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
  storecard(BuildContext context,String cover, String profile, String name,String view,double width){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: (){
          Get.toNamed("/store");
        },
        child: Container(
          width: width*0.9,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 0.5,
                spreadRadius: 0.5,
                offset: Offset(0,0)
              )
            ]
          ),
          child: Stack(
            children: [
              Container(
                width: width,
                height: 170,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                  child: Image.network(cover,fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 130,
                left: 10,
                child: Container(
                  padding:const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black38,
                            offset: Offset(0,0),
                            spreadRadius: 0.5,
                            blurRadius: 0.5
                        )
                      ],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(profile,fit: BoxFit.cover,width: 100,height: 100,),
                  ),
                ),
              ),
              Positioned(
                top: 170,
                left: 120,
                child: Container(
                  margin: const EdgeInsets.only(top: 10,bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name.toUpperCase(),style: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w600)),),
                      const SizedBox(height: 2,),
                      Text(view + " view",style: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 11, color: Colors.black)),),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Diamond_PremiumPlus(double width, BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(left: width*0.05,top: 10,bottom: 5),
            child: Text("Diamon Class",style: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold)))
        ),
        storepath(width, context),
      ],
    );

  }
}
