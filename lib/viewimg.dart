import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce/object.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_view/photo_view.dart';
class viewImg extends StatelessWidget {
  const viewImg({super.key});

  @override
  Widget build(BuildContext context) {
    double width;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(

          child: Scaffold(
        body: LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
          if(constraints.maxWidth < 800){
            width = MediaQuery.sizeOf(context).width;

            return imgviewer(width, context);
          }else{
            width = 800;
            return Center(
              child: Container(
                  color: Colors.white,
                  child:  imgviewer(width, context)

              ),

            );
          }
        },)
      )
      ),
    );
  }
  imgviewer(double width,BuildContext context) {
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1603787081207-362bcef7c144?q=80&w=2565&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1606890657196-d3da9fda15ef?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1713458180041-a6f7a72c9707?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];
    getxData controller = Get.put(getxData());
    return GetBuilder<getxData>(builder: (_){
      return Container(
          width: width,
          height: MediaQuery.sizeOf(context).height,
          child: Stack(
            children: [
              GestureDetector(
                onTap: (){
                  if(controller.isshow == false){
                    controller.isshow = true;
                  }else{
                    controller.isshow= false;
                  }
                  controller.update();

                },
                child: Container(
                  width: width,
                  color: Colors.black,
                  height: MediaQuery.sizeOf(context).height,
                  child: SingleChildScrollView(
                    physics: PageScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:imgList
                          .map((item) =>
                          SizedBox(
                              width: width,
                              child: PhotoView(
                                imageProvider: NetworkImage(
                                  item,
                                ),
                                enableRotation: false,
                                enablePanAlways: false,
                                minScale: PhotoViewComputedScale.contained,
                                maxScale: PhotoViewComputedScale.contained, // Disable zoom out
                              )
                          )
                      )
                          .toList(),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 20,
                  left: 15,
                  child: Visibility(
                    visible: controller.isshow,
                    child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close,color: Colors.white,)),
                  )
              ),
              Positioned(
                  top: 20,
                  right: 15,
                  child: Visibility(
              visible: controller.isshow,
                    child: Icon(Icons.link,color: Colors.white,),
              )
              ),
              Positioned(
                bottom: 0,
                child: Visibility(
                  visible: controller.isshow,
                  child: Container(
                    width: width,
                    height: 100,
                    padding: EdgeInsets.only(left: 15,right: 15,top: 5),
                    color: Color.fromRGBO(15, 15, 15, 0.7),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Sneaker 001",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold)),),
                            Row(
                              children: [
                                Text("\$ 275.00",style: GoogleFonts.montserrat(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white,textStyle: TextStyle(decoration: TextDecoration.lineThrough,decorationThickness: 1.5,decorationColor: Colors.red))),
                                SizedBox(width: 10,),
                                Text("\$ 125.00",style: GoogleFonts.montserrat(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.redAccent),),
                              ],
                            ),
                            Text("1,695 view",style: GoogleFonts.montserrat(fontSize: 11,fontWeight: FontWeight.w200,color: Colors.white),),
                          ],
                        ),
                        Container(
                          child: Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network("https://images.unsplash.com/photo-1605326152964-56fb991b95ff?q=80&w=2160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",width: 50,height: 50,fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              )
            ],
          )
      );

    });
  }
}
