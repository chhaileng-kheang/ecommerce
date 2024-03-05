import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class store extends StatelessWidget {
  const store({super.key});

  @override
  Widget build(BuildContext context) {
    double width;
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
    }
    )
        )
    );
  }
  mainscreen(double width, BuildContext context,int grid ){
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Header(width),
                  Store_info(width,context),
                  Contact(width, context)
                ],
              ),
            ),
          ),
        )
    );
  }
  Contact(double width, context) {
    return Container(
      width: width*0.9,
      margin: EdgeInsets.only(top: 5),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          if(constraints.maxWidth < 450){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if(constraints.maxWidth>350)...[
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: Row(
                            children: [
                              Icon(Icons.phone,color: Colors.white),
                              SizedBox(width: 3,),
                              Text("+855(0)27 229 039",style: GoogleFonts.montserrat(fontSize: 11,fontWeight: FontWeight.w600,color: Colors.white),),

                            ]
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: Row(
                            children: [
                              Icon(Icons.phone,color: Colors.white),
                              SizedBox(width: 3,),
                              Text("+855(0)27 229 039",style: GoogleFonts.montserrat(fontSize: 11,fontWeight: FontWeight.w600,color: Colors.white),),

                            ]
                        ),
                      ),
                    ],
                  ),
                ]else...[
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: Row(
                            children: [
                              Icon(Icons.phone,color: Colors.white),
                              SizedBox(width: 3,),
                              Text("+855(0)27 229 039",style: GoogleFonts.montserrat(fontSize: 11,fontWeight: FontWeight.w600,color: Colors.white),),

                            ]
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                        child: Row(
                            children: [
                              Icon(Icons.phone,color: Colors.white),
                              SizedBox(width: 3,),
                              Text("+855(0)27 229 039",style: GoogleFonts.montserrat(fontSize: 11,fontWeight: FontWeight.w600,color: Colors.white),),

                            ]
                        ),
                      ),
                    ],
                  ),
                ],
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Container(
                    margin: EdgeInsets.only(top: 10,left: 5),
                    width: 40,height: 40,
                    decoration: BoxDecoration(color: Colors.black,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Icon(Icons.facebook, color: Colors.white,size: 28,),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10,left: 5),
                    width: 40,height: 40,
                    decoration: BoxDecoration(color: Colors.black,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Icon(Icons.telegram, color: Colors.white,size: 28,),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10,left: 5),
                    width: 40,height: 40,
                    decoration: BoxDecoration(color: Colors.black,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Icon(Icons.message_outlined, color: Colors.white,size: 25,),
                  ),
                ],)
              ],
            );
          }else {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.only(left: 10,right: 10,top: 12,bottom: 12),
                      child: Row(
                          children: [
                            Icon(Icons.phone,color: Colors.white,size: 20,),
                            SizedBox(width: 3,),
                            Text("+855(0)27 229 039",style: GoogleFonts.montserrat(fontSize: 10,fontWeight: FontWeight.w400,color: Colors.white),),

                          ]
                      ),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.only(left: 10,right: 10,top: 12,bottom: 12),
                      child: Row(
                          children: [
                            Icon(Icons.phone,color: Colors.white,size: 20,),
                            SizedBox(width: 3,),
                            Text("+855(0)27 229 039",style: GoogleFonts.montserrat(fontSize: 10,fontWeight: FontWeight.w400,color: Colors.white),),

                          ]
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Row(children: [
                  Container(
                    margin: EdgeInsets.only(top: 10,left: 10),
                    width: 35,height: 35,
                    decoration: BoxDecoration(color: Colors.black,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Icon(Icons.facebook, color: Colors.white,size: 22,),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10,left: 10),
                    width: 35,height: 35,
                    decoration: BoxDecoration(color: Colors.black,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Icon(Icons.telegram, color: Colors.white,size: 22,),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10,left: 10),
                    width: 35,height: 35,
                    decoration: BoxDecoration(color: Colors.black,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Icon(Icons.message_outlined, color: Colors.white,size: 22,),
                  ),
                ],)
              ],
            );
          }
        },
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
            Text("Store",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: const Image(
                image: NetworkImage("https://pics.craiyon.com/2023-10-13/45c8f06467d74d7d8949ddadffc5b2c8.webp",),
                height: 40,width: 40,
              ),
            )
          ],
        )
    );
  }
  Store_info(double width, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
      width: width*0.9,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Color(0XFFFFF0BE),
        borderRadius: BorderRadius.circular(8),

      ),
      child: Row(
        children: [
          SizedBox(width: 10,),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network("https://images.unsplash.com/photo-1605326152964-56fb991b95ff?q=80&w=2160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",width: 65,height: 65,fit: BoxFit.cover,),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Container(
              width: width*0.5,
              height: width <410 ? 100 : 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 0,
                      child: Text("Vetana De Sneaker",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 18),)),
                  Expanded(
                    flex: 0,
                    child: Text("Russey Kao, Phnom Penh, Cambodia",style: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
                    ),
                  ),
            
                      ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

