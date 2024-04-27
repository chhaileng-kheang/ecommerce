import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import 'customWidget/classwidget.dart';
class detail extends StatelessWidget {
  detail({super.key});
  List<String> Images = [
    'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?q=80&w=2650&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.stylight.net/image/upload/t_web_post_500x667/q_auto,f_auto/post-3515bce73e333a3a5bb3d9127bdc6d0c35c88a9cffed7da8425a7148.webp',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiNqZEHcC_DdFEzlsERkfVA1ikhe-SzwkgxVF4cbyBCeRLkxKvKwWO1aggj07BFPCBFIE&usqp=CAU',
    'https://www.dhresource.com/webp/m/0x0/f2/albu/g19/M00/5F/C5/rBVap2DIXmGAaCmOAAGt0CgPIok342.jpg'
  ];
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
  Future<List<ImageInfo>> getImageinfoList(List<String> imgUrls) async {
    List<Future<ImageInfo>> futures = imgUrls.map((url) {
      return getImageInfo(Image.network(url,filterQuality: FilterQuality.low,));
    }).toList();

    return Future.wait(futures);
  }
  Future<ImageInfo> getImageInfo(Image img) async {
    final c = new Completer<ImageInfo>();
    img.image
        .resolve(new ImageConfiguration())
        .addListener(new ImageStreamListener((ImageInfo i, bool _) {
      c.complete(i);
    }));
    return c.future;
  }
  mainscreen(double width, BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body:  SizedBox(
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
                      imageSection(width,context,Images[0],Images.sublist(1)),
                      Container(
                        width: width*0.9,
                        margin: EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("white and red nike athletic shoe J2 Code : wAQDckus",style: GoogleFonts.montserrat(fontSize: 20,fontWeight: FontWeight.w600),),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text("\$ 275.00",style: GoogleFonts.montserrat(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.black,textStyle: TextStyle(decoration: TextDecoration.lineThrough,decorationThickness: 1.5,decorationColor: Colors.red))),
                                    SizedBox(width: 10,),
                                    Text("\$ 125.00",style: GoogleFonts.montserrat(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.redAccent),),
                                  ],
                                ),
                                Text("1,695 view",style: GoogleFonts.montserrat(fontSize: 14,fontWeight: FontWeight.w200),),
                              ],
                            ),
                            profile_store_mini(width, 14, 50),
                            Contact(width,context),
                            sponsor(width),
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
  imageSection(double width,context,String thm, List<String> subimg) {
    return Container(
      child: Column(
        children: [
          thumnnail(width,thm),
          SubImage(width,context,subimg),

        ],
      ),
    );
    
  }
  thumnnail(double width,String imgthm) {
    return GestureDetector(
      onTap: (){
        Get.toNamed("/imgview");
      },
      child: Container(
        width: width * 0.9,
        margin: EdgeInsets.only(top: 10),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: AspectRatio(
              aspectRatio: 16/9,
              child: FadeInImage(
                placeholder: AssetImage('asset/aas.png'),
                fadeInDuration: Duration(milliseconds: 100),
                image: NetworkImage(imgthm),
                filterQuality: FilterQuality.low,
                fadeOutDuration: Duration(milliseconds: 1),
                fadeInCurve: Curves.linear,
                width: width*0.9,
                fit: BoxFit.cover,
                imageErrorBuilder: (context,error,StackTrace){
                  return Container(
                    width: MediaQuery.sizeOf(context).width,
                    child: Center(
                      child: Icon(Icons.error),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
  SubImage(double width,BuildContext context,List<String> imgsub) {
    return FutureBuilder<List<ImageInfo>>(future: getImageinfoList(imgsub), builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // Return a placeholder widget while waiting for the future to complete
        return Container(
            width: width,
            child: Center(child: Container(
                margin: EdgeInsets.only(top: 10),
                width: 40,height: 20, child: Lottie.asset("asset/Animation - 1713422873683.json"))));
      } else if (snapshot.hasError) {
        // Return an error widget if the future encounters an error
        return Text('Error: ${snapshot.error}');
      } else {
        // Return the ProductCard widget with the obtained ImageInfo
        return   Container(
          margin: const EdgeInsets.only(top: 5),
          width: width*0.9,
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: imgsub.map((e) => SizedBox(
                  width: width/3.35,
                  child: AspectRatio(
                    aspectRatio: 4/3,
                    child: Card(
                      surfaceTintColor: Colors.white,
                      color: Colors.white,
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child:Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: width/3.35,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: FadeInImage(
                                  placeholder: AssetImage('asset/aas.png'),
                                  fadeInDuration: Duration(milliseconds: 100),
                                  image: NetworkImage(e),
                                  filterQuality: FilterQuality.low,
                                  fadeOutDuration: Duration(milliseconds: 1),
                                  fadeInCurve: Curves.linear,
                                  width: MediaQuery.sizeOf(context).width,
                                  height: 200,
                                  fit: BoxFit.cover,
                                  imageErrorBuilder: (context,error,StackTrace){
                                    return Container(
                                      width: MediaQuery.sizeOf(context).width,
                                      child: Center(
                                        child: Icon(Icons.error),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )).toList(),
              )
          ),
        );
      }

    },
    );

  }
  sponsor(double width){
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: FutureBuilder<ImageInfo>(
        future: getImageInfo(Image.network("https://i.ibb.co/0BwmgQ5/Untitled-3.png")),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Return a placeholder widget while waiting for the future to complete
            return Text("");
          } else if (snapshot.hasError) {
            // Return an error widget if the future encounters an error
            return Text('Error: ${snapshot.error}');
          } else {
            // Return the ProductCard widget with the obtained ImageInfo
            return AspectRatio(aspectRatio: 4/1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "https://i.ibb.co/0BwmgQ5/Untitled-3.png",
                    fit: BoxFit.fitWidth,
                    width: width,
                  ),
                )
            );
          }

        },

    )
    );
  }
  profile_store(double width) {
    return Padding(
      padding: EdgeInsets.only(left: 3,right: 3),
      child: Container(
        width: width,
        height: 60,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
            color: Colors.black12,
              offset: Offset(1,1),
              blurRadius: 2,
              spreadRadius: 1,
          )]
        ),
        child: InkWell(
          onTap: (){
            Get.toNamed("/store?id=28222");
          },
          child: Row(
            children: [
              SizedBox(width: 10,),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network("https://images.unsplash.com/photo-1605326152964-56fb991b95ff?q=80&w=2160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",width: 40,height: 40,fit: BoxFit.cover,),
              ),
              SizedBox(width: 10,),
              Text("Vetana De Sneaker",style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),)
            ],
          ),
        ),
      ),
    );
  }

}
