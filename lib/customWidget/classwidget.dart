import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../classobject/object.dart';

  bodyGid(double width, BuildContext context, int Grid,bool isstore,bool owner,List<ProductObj> Product) {

    return Container(
      width: width * 0.9 + 8,
      margin: const EdgeInsets.only(top: 5),
      child: StaggeredGrid.count(
        crossAxisCount: Grid,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: Product.map((ProductObj pro) {
          return Container(
            child: ProductCard(
                context,
                pro.img,
                pro.product_title,
                pro.price,
                pro.id,
                pro.category,
                pro.discount,
                width,
                pro.derection,isstore,owner),
          );
        }

        ).toList(),

      ),
    );
  }

  ProductCard(BuildContext context, String img, String title, String price, String id, String category, String discount, double width, String dire,bool isstore,bool owner) {
    double discountprice = double.parse(price) -
        (double.parse(price) * (double.parse(discount) / 100));
    return GestureDetector(
      onTap: () {
        if (isstore == true && owner == false){
          Get.toNamed("/productstore?store=12345&product=28222");
        } else if(isstore == false && owner == true){
          Get.toNamed("/productOwner?id=128928938291");
        }else{
          Get.toNamed("/product?store=12345&product=28222");
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            width >= 800 ? BoxShadow(
              color: Colors.black12,
              offset: Offset(0,0),
              spreadRadius: 0.5,
              blurRadius: 0.5,) : BoxShadow(

              color: Colors.black12,
              offset: Offset(0,0),
              spreadRadius: 0.00,
              blurRadius: 0.00,
            ),
          ]
        ),
        child: Stack(
          children: [
            Column(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5)),
                    child: AspectRatio(
                      aspectRatio: dire == "v" ? 3 / 4 : 4 / 3,
                      child: FadeInImage(
                        placeholder: AssetImage('asset/aas.png'),
                        fadeInDuration: Duration(milliseconds: 20),
                        image: NetworkImage(img),
                        fadeOutDuration: Duration(milliseconds: 10),
                        fadeInCurve: Curves.linear,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.low,

                        imageErrorBuilder: (context,error,StackTrace){
                          return Container(
                            width: MediaQuery.sizeOf(context).width,
                            child: AspectRatio(
                              aspectRatio: dire == "v" ? 3 / 4 : 4 / 3,
                              child: Center(
                                child: Icon(Icons.error),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(title, style: const TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12)),),
                Container(
                  margin: const EdgeInsets.only(
                      left: 5, right: 5, bottom: 5, top: 10),
                  child: discount != "0" ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Text("\$" + price, style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 1.5,
                              decorationColor: Colors.red))),

                    ],
                  )
                      :
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("\$" + price, style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 16))),

                    ],
                  ),
                )
              ],
            ),
            discount != "0" ? Positioned(
              bottom: 0, right: 0,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 5, top: 5),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 75, 75, 1.0),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5))
                ),
                child: Row(
                  children: [
                    Text("-" + discount.toString() + "%",
                        style: const TextStyle(color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 12)),
                    const SizedBox(width: 5,),
                    Text("\$" + discountprice.toString(),
                        style: const TextStyle(color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 14)),

                  ],
                ),
              ),)
                : const Text("")
          ],
        ),
      ),
    );
  }

  Contact(double width, context) {
  return Container(
    margin: EdgeInsets.only(top: 5),
    child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        return Container(
          width: width*0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              if(constraints.maxWidth > 480)...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Social(45,45,24,11),
                    SizedBox(width: 5,),
                    phone_Contact_Row(width,11),
                  ],
                ),
              ]
              else if(constraints.maxWidth>430)...[
                //mobile
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Social(45,20,18,11),
                    SizedBox(width: 3,),
                    phone_Contact_Row(width,11),
                  ],
                ),

              ]
              else if(constraints.maxWidth>350)...[
                  //mobile
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Social(38,20,18,8.5),
                      SizedBox(width: 5,),
                      phone_Contact_Row(width,8.5),
                    ],
                  ),

                ]
                else...[
                    //fold
                    Container(
                      width: width*0.9,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Social(38,20,18,8.5),
                            SizedBox(width: 10,),
                            phone_Contact_Row(width,8.5),
                          ],
                        ),
                      ),
                    ),

                  ],

            ],
          ),
        );

      },
    ),
  );
}
  Social(double width, double height ,double size,double fontsize) {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.only(top: 10),
        height: width-7,
        padding: EdgeInsets.only(left: fontsize - 4,right: 10),
        decoration: BoxDecoration(color: Colors.black,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Icon(Icons.facebook, color: Colors.white,size: size-2,),
            Text("  Facebook",style: GoogleFonts.montserrat(fontSize: fontsize,fontWeight: FontWeight.w400,color: Colors.white),)
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 10,left: 10),
        height: width-7,
        padding: EdgeInsets.only(left: fontsize - 4,right: 10),
        decoration: BoxDecoration(color: Colors.black,
            borderRadius: BorderRadius.circular(10)
        ),
        child: InkWell(
          onTap: (){
            _launchDeepLink();
          },
          child: Row(
            children: [
              Icon(Icons.telegram, color: Colors.white,size: size-2,),
              Text("  Telegram",style: GoogleFonts.montserrat(fontSize: fontsize,fontWeight: FontWeight.w400,color: Colors.white),)
            ],
          ),
        ),
      ),

    ],);
}
  phone_Contact_Row(double width,double size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Text("027 229 039",style: GoogleFonts.montserrat(fontSize: size,fontWeight: FontWeight.w400,color: Colors.white),),

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
              Text("027 229 039",style: GoogleFonts.montserrat(fontSize: size,fontWeight: FontWeight.w400,color: Colors.white),),

            ]
        ),
      ),

    ],
  );
}
  profile_store_mini(double width,double fontSize,double height) {
  return Padding(
    padding: EdgeInsets.only(left: 1,right: 1,bottom: 5),
    child: Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(0,0),
              blurRadius: 0.2,
              spreadRadius: 0.2,
            )]
      ),
      child: InkWell(
        onTap: (){
          Get.toNamed("/store?id=28222");
        },
        child: Container(
          margin: EdgeInsets.only(right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 5,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child : FadeInImage(
                      placeholder: AssetImage('asset/aas.png'),
                      fadeInDuration: Duration(milliseconds: 100),
                      image: NetworkImage("https://images.unsplash.com/photo-1605326152964-56fb991b95ff?q=80&w=2160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                      fadeOutDuration: Duration(milliseconds: 1),
                      fadeInCurve: Curves.linear,
                      height: 35,
                      width: 35,
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
                  SizedBox(width: 5,),
                  Text("Vetana De Sneaker",style: TextStyle(fontWeight: FontWeight.w500,fontSize: fontSize),)
                ],
              ),
              ClipRRect(
                child : FadeInImage(
                  placeholder: AssetImage('asset/aas.png'),
                  fadeInDuration: Duration(milliseconds: 100),
                  image: NetworkImage("https://flagsapi.com/KH/flat/64.png"),
                  fadeOutDuration: Duration(milliseconds: 1),
                  fadeInCurve: Curves.linear,
                  height: 24,
                  fit: BoxFit.fitHeight,
                  imageErrorBuilder: (context,error,StackTrace){
                    return Container(
                      width: MediaQuery.sizeOf(context).width,
                      child: Center(
                        child: Icon(Icons.error),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

//external

String generateRandomCode() {
  final Random _random = Random();
  const String chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const int codeLength = 6;

  String code = '';
  for (int i = 0; i < codeLength; i++) {
    code += chars[_random.nextInt(chars.length)];
  }
  return code;
}
String generateRandomCodePars(String CharPar, int len) {
  final Random _random = Random();
   String chars = CharPar;
   int codeLength = len;

  String code = '';
  for (int i = 0; i < codeLength; i++) {
    code += chars[_random.nextInt(chars.length)];
  }
  return code;
}
void _launchDeepLink() async {
  const deepLink = 'https://t.me/chhailengkc';
  if (await canLaunchUrl(Uri.parse(deepLink))) {
    await launchUrl(Uri.parse(deepLink), mode: LaunchMode.inAppBrowserView,);
  } else {
    throw 'Could not launch $deepLink';
  }
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

