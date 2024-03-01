import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
class detail extends StatelessWidget {
  const detail({super.key});

  @override
  Widget build(BuildContext context) {
    String id = Get.parameters['store'] ?? '';
    String product = Get.parameters['product'] ?? '';
    double width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
            if(constraints.maxWidth < 800){
              width = MediaQuery.sizeOf(context).width;
              return mainscreen(width, context);
            }else{
              width = 800;
              return Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                    child: Container(
                      color: const Color.fromRGBO(255, 255, 255, 1.0),
                      width: MediaQuery.sizeOf(context).width,
                      child: mainscreen(width, context),

                    ),
                  )
              );
            }
          },)
      ),
    );
  }
  mainscreen(double width, BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            Header(MediaQuery.sizeOf(context).width),
            Expanded(
              flex: 1,
              child: Container(
                width: width*0.9,
                height: MediaQuery.sizeOf(context).height-70,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      imageSection(width,context),
                      Container(
                        width: width*0.9,
                        margin: EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("white and red nike athletic shoe J2 Code : wAQDckus",style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600),),
                            SizedBox(height: 10,),
                            Text("\$ 275.00",style: GoogleFonts.montserrat(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.redAccent),),
                            Contact(width,context),
                            Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text("Sneakers, an iconic fusion of fashion and function, transcend mere footwear. These sleek, cushioned marvels boast diverse designs,"
                                    " from classic canvas to cutting-edge knit technology. Brands innovate with vibrant color palettes and avant-garde collaborations, ensuring every step"
                                    " is a style statement. Comfort meets culture in the world of sneakers.",
                                  style: GoogleFonts.montserrat(fontSize: 16,fontWeight: FontWeight.w400),)),


                          ],
                        ),
                      ),

                      SizedBox(height: 50,)
                    ],
                  ),
                ),
              ),
            )


          ],
        ),
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
            const Icon(Icons.link,size: 28,color: Color.fromRGBO(255, 75, 75, 1.0),),

          ],
        )
    );
  }

  imageSection(double width,context) {
    return Container(
      child: Column(
        children: [
          thumnnail(width),
          SubImage(width,context),

        ],
      ),
    );
    
  }

  thumnnail(double width) {
    return Container(
      width: width * 0.9,
      margin: EdgeInsets.only(top: 10),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: AspectRatio(
            aspectRatio: 16/9,
            child: Image.network("https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?q=80&w=2650&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",width: width*0.9,fit: BoxFit.cover,),
          ),
        ),
      ),
    );
  }

  SubImage(double width,BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: width*0.9,
      height: 200,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
          SizedBox(
            width: width/3.35,

            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              elevation: 1,
              color: Colors.white,
              shadowColor: Colors.black,
              child:Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: width/3.35,

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network("https://images.stylight.net/image/upload/t_web_post_500x667/q_auto,f_auto/post-3515bce73e333a3a5bb3d9127bdc6d0c35c88a9cffed7da8425a7148.webp",fit: BoxFit.cover,  height: 200, width: MediaQuery.sizeOf(context).width, ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: width/3.35,

            child: Card(
              elevation: 1,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              color: Colors.white,
              shadowColor: Colors.black,
              child:Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: width/3.35,
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network("https://www.dhresource.com/webp/m/0x0/f2/albu/g19/M00/5F/C5/rBVap2DIXmGAaCmOAAGt0CgPIok342.jpg",fit: BoxFit.cover,  width: MediaQuery.sizeOf(context).width,  height: 200,),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: width/3.35,
        
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              elevation: 1,
              color: Colors.white,
              shadowColor: Colors.black,
              child:Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: width/3.35,
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiNqZEHcC_DdFEzlsERkfVA1ikhe-SzwkgxVF4cbyBCeRLkxKvKwWO1aggj07BFPCBFIE&usqp=CAU",fit: BoxFit.cover,  width: MediaQuery.sizeOf(context).width,  height: 200,),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: width/3.35,

            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              elevation: 1,
              color: Colors.white,
              shadowColor: Colors.black,
              child:Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: width/3.35,

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network("https://images.stylight.net/image/upload/t_web_post_500x667/q_auto,f_auto/post-3515bce73e333a3a5bb3d9127bdc6d0c35c88a9cffed7da8425a7148.webp",fit: BoxFit.cover,  height: 200, width: MediaQuery.sizeOf(context).width, ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: width/3.35,

            child: Card(
              elevation: 1,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              color: Colors.white,
              shadowColor: Colors.black,
              child:Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: width/3.35,
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network("https://www.dhresource.com/webp/m/0x0/f2/albu/g19/M00/5F/C5/rBVap2DIXmGAaCmOAAGt0CgPIok342.jpg",fit: BoxFit.cover,  width: MediaQuery.sizeOf(context).width,  height: 200,),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: width/3.35,

            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              elevation: 1,
              color: Colors.white,
              shadowColor: Colors.black,
              child:Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: width/3.35,
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiNqZEHcC_DdFEzlsERkfVA1ikhe-SzwkgxVF4cbyBCeRLkxKvKwWO1aggj07BFPCBFIE&usqp=CAU",fit: BoxFit.cover,  width: MediaQuery.sizeOf(context).width,  height: 200,),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
        )
      ),
    );

  }

  Contact(double width, context) {
    return Container(
      child: Container(
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
                  Row(children: [
                    Container(
                      margin: EdgeInsets.only(top: 10,left: 5),
                      width: 40,height: 40,
                      decoration: BoxDecoration(color: Colors.black,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Icon(Icons.facebook, color: Colors.white,size: 22,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10,left: 5),
                      width: 40,height: 40,
                      decoration: BoxDecoration(color: Colors.black,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Icon(Icons.telegram, color: Colors.white,size: 22,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10,left: 5),
                      width: 40,height: 40,
                      decoration: BoxDecoration(color: Colors.black,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Icon(Icons.message_outlined, color: Colors.white,size: 22,),
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
                  SizedBox(height: 5,),
                  Row(children: [
                    Container(
                      margin: EdgeInsets.only(top: 10,left: 5),
                      width: 40,height: 40,
                      decoration: BoxDecoration(color: Colors.black,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Icon(Icons.facebook, color: Colors.white,size: 22,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10,left: 5),
                      width: 40,height: 40,
                      decoration: BoxDecoration(color: Colors.black,
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Icon(Icons.telegram, color: Colors.white,size: 22,),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10,left: 5),
                      width: 40,height: 40,
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
      )
    );
  }
}
