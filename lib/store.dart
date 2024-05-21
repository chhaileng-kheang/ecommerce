import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce/classobject/object.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'customWidget/classwidget.dart';
class store extends StatelessWidget {
  store({super.key});
  final List<String> imgList = [
    'https://i.ibb.co/0BwmgQ5/Untitled-3.png',
  ];
  List<String> categorylst =['Sneaker', 'Clothing', "Kid's Clothing", 'Other','Sneaker', 'Clothing', "Kid's Clothing", 'Other'];
  getxData controller = Get.put(getxData());
  final List<ProductObj> Product = [
    ProductObj(product_title: "product A", id: "id", img: "https://images.unsplash.com/photo-1576487503401-173ffc7c669c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODB8fHNuZWFrZXJ8ZW58MHx8MHx8fDA%3D", price: "100", category: "category", discount: "5", disbool: "false",derection: "v"),
    ProductObj(product_title: "product B", id: "id", img:  "https://images.unsplash.com/photo-1589578228447-e1a4e481c6c8?q=80&w=2664&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "140", category: "category", discount: "35", disbool: "",derection: "h"),
    ProductObj(product_title: "product C", id: "id", img:"https://images.unsplash.com/photo-1607861716497-e65ab29fc7ac?q=80&w=2564&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "80", category: "category", discount: "10", disbool: "disbool",derection: "v"),
    ProductObj(product_title: "product D", id: "id", img:   "https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?q=80&w=2572&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "78", category: "category", discount: "0", disbool: "disbool",derection: "h"),
    ProductObj(product_title: "product E", id: "id", img:   "https://images.unsplash.com/photo-1548036328-c9fa89d128fa?q=80&w=2669&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",price: "214", category: "category", discount: "9", disbool: "disbool",derection: "h"),
    ProductObj(product_title: "product F", id: "id", img: "https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?q=80&w=2650&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "69", category: "category", discount: "0", disbool: "disbool",derection: "h"),

  ];
  @override
  Widget build(BuildContext context) {
    double width;
    return SafeArea(
        child: GetBuilder<getxData>(
          builder: (_) {
            return Scaffold(
                backgroundColor: const Color.fromRGBO(234, 234, 234, 1.0),
                  body: LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
                  if(constraints.maxWidth < 800){
                      width = MediaQuery.sizeOf(context).width;
                  if(constraints.maxWidth<350) {
                      return mainscreen(width, context, 1,controller);
                  }else{
                      return mainscreen(width, context, 2,controller);
                  }
                  }else{
                      width = 800;
                  return Center(
                    child: Container(
                        color: const Color.fromRGBO(255, 255, 255, 1.0),
                        width: MediaQuery.sizeOf(context).width,
                        child: mainscreen(width, context,3, controller),

              ),

            );
                  }
                }
                )
            );
          }
        )
    );

  }
  mainscreen(double width, BuildContext context,int grid ,getxData controller){
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                StoreInFo(width,context,controller),
                Container(
                  width: width,
                  color: Colors.white,
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Center(
                    child: Contact(width, context),
                  ),
                ),
               Container(
                 height: 50,
                 width: width,
                 color: Colors.white,
                 padding: const EdgeInsets.all(10),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Column(
                       children: [
                         Container(
                           child: Text("Product",style: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w600)),),
                         ),
                         Container(
                           height: 3,
                           width: 30,
                           decoration: BoxDecoration(
                             color: Colors.black,
                             borderRadius: BorderRadius.circular(100),
                           ),
                         )
                       ],
                     ),
                     const SizedBox(width: 25,),
                     Column(
                       children: [
                         Container(
                           child: Text("Videos",style: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.w400))),
                         ),
                         Container(
                           height: 3,
                           width: 30,
                           decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(100),
                           ),
                         )
                       ],
                     ),

                   ],
                 ),
               ),
               // BannerSponsor(width),
                const SizedBox(height: 5,),
                category(categorylst, width),
                const SizedBox(height: 5,),
                bodyGid(width, context, grid,true,false,Product),
                const SizedBox(height: 100,),
              ],
            ),
          ),
          Container(
              width: width,
              child: Header(width)
          ),

        ],
      ),
    );
  }
  category(List<String> categorylist,double width){
    return Container(
      height:50,
      width: width*0.92,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1,1),
            )
          ]
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorylst.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: const EdgeInsets.only(left: 10,right: 10,top: 15),
              child: Text(categorylst[index]));
        },
      ),
    );
  }

  BannerSponsor(double width) {

    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: width*0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: AspectRatio(
          aspectRatio: 4/1,
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              viewportFraction: 1,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
            items: imgList
                .map((item) => Container(
              child: Center(
                  child: Image.network(
                    item,
                    fit: BoxFit.fitWidth,
                    width: width,
                  )),
            ))
                .toList(),
          ),
        ),
      ),
    );

  }


  Header(double width) {
    return Container(
        height: 100,
        decoration: const BoxDecoration(
          gradient:  LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Colors.black,
              Colors.transparent,
            ],
          )
        ),
        padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 45),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: (){
                  Get.back();
                },
                child: const Icon(Icons.arrow_back_ios_new,size: 28,color: Colors.white,)),
            Text("Store",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16)),),
            const Row(
                    children: [
                          Icon(Icons.share,color: Colors.white,)
                        ],
                    ),
          ],
        )
    );
  }
  StoreInFo(double width, BuildContext context,getxData controller){

    return Container(
      width: width,
      height: 260,
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            width: width,
            height: 200,
            decoration: BoxDecoration(
                color: const Color(0xFFFFF0BE),
              image: DecorationImage(
                image: const NetworkImage("https://images.unsplash.com/photo-1511317590834-e985451ca5c7?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                fit: BoxFit.cover,
                onError: (exception, stackTrace) {
                  Container(
                    color: const Color(0xFFFFF0BE),
                  );
                },
              )
            ),
          ),
          Positioned(
            right:  20,
            top: 160,
            child: LayoutBuilder(
              builder : (context,constraint){
               return Container(
                 padding: const EdgeInsets.all(2),
                 decoration: BoxDecoration(
                   color: Colors.blueGrey,
                   borderRadius: BorderRadius.circular(100)
                 ),
                 child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network("https://images.unsplash.com/photo-1605326152964-56fb991b95ff?q=80&w=2160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",width: 80,height: 80,fit: BoxFit.cover,),
                  ),
               );
            }
            ),
          ),
          Positioned(
            top: 210,
            left: 20,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex:0,
                  child: Container(
                      width: width*0.7,
                      child: Text("Vetana De Sneaker",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 18),))),
              Expanded(
                flex:0,
                child: Container(
                  width: width*0.7,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text("Russey Kao, Phnom Penh, Cambodia",style: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),

            ],
          ),),
          Positioned(
            top: 160,
            left: 10,
            child: Container(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(179, 252, 255, 1.0),
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0.2,
                    offset: Offset(0,0),
                    blurRadius: 0.2
                  )
                ]
              ),
              child: const Text("D",style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          )
        ],
      ),);
  }
  Store_info(double width, BuildContext context) {
    return Container(
      width: width,
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 10,top: 10),
      child: Container(
        width: width,
        child: Center(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
                width: width,
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: const Color(0XFFFFF0BE),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network("https://images.unsplash.com/photo-1605326152964-56fb991b95ff?q=80&w=2160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",width: 65,height: 65,fit: BoxFit.cover,),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Container(
                        width: width*0.5,
                        height: width <415 ? 100 : 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                flex:0,
                                child: Text("Vetana De Sneaker",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 18),)),
                            Expanded(
                              flex:0,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text("Russey Kao, Phnom Penh, Cambodia",style: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              if(width >=650)...[
                Positioned(
                    right: 10,
                    top: 10,
                    child:  profileControl_nobg(40, 40, 22))
              ]else...[
                Positioned(
                    right: 10,
                    top: 10,
                    child:  profileControl_nobg(35, 35, 20))
              ]
            ],
          ),
        ),
      ),
    );
  }

  profileControl_nobg(double width, double height, double size) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10,left: 2),
          width: width,height: height,
          decoration: BoxDecoration(color: Colors.transparent,
              borderRadius: BorderRadius.circular(100)
          ),
          child: Icon(Icons.share, color: Colors.black,size: size,),
        ),

      ],);

  }
}

