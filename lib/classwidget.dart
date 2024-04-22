import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'object.dart';

  bodyGid(double width, BuildContext context, int Grid) {
    final List<ProductObj> Product = [
      ProductObj(product_title: "product A", id: "id", img: "https://images.unsplash.com/photo-1576487503401-173ffc7c669c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODB8fHNuZWFrZXJ8ZW58MHx8MHx8fDA%3D", price: "100", category: "category", discount: "5", disbool: "false",derection: "v"),
      ProductObj(product_title: "product B", id: "id", img:  "https://images.unsplash.com/photo-1589578228447-e1a4e481c6c8?q=80&w=2664&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "140", category: "category", discount: "35", disbool: "",derection: "h"),
      ProductObj(product_title: "product C", id: "id", img:"https://images.unsplash.com/photo-1607861716497-e65ab29fc7ac?q=80&w=2564&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "80", category: "category", discount: "10", disbool: "disbool",derection: "v"),
      ProductObj(product_title: "product D", id: "id", img:   "https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?q=80&w=2572&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "78", category: "category", discount: "0", disbool: "disbool",derection: "h"),
      ProductObj(product_title: "product E", id: "id", img:   "https://images.unsplash.com/photo-1548036328-c9fa89d128fa?q=80&w=2669&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",price: "214", category: "category", discount: "9", disbool: "disbool",derection: "h"),
      ProductObj(product_title: "product F", id: "id", img: "https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?q=80&w=2650&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "69", category: "category", discount: "0", disbool: "disbool",derection: "h"),

    ];
    return Container(
      width: width * 0.9 + 8,
      margin: const EdgeInsets.only(top: 5),
      child: StaggeredGrid.count(
        crossAxisCount: Grid,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
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
                pro.derection),
          );
        }

        ).toList(),

      ),
    );
  }

  ProductCard(BuildContext context, String img, String title, String price, String id, String category, String discount, double width, String dire) {
    double discountprice = double.parse(price) -
        (double.parse(price) * (double.parse(discount) / 100));
    return GestureDetector(
      onTap: () {
        Get.toNamed("/product?store=12345&product=28222");
      },
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: width >= 800 ? 1 : 0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))
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
                        fadeInDuration: Duration(milliseconds: 100),
                        image: NetworkImage(img),
                        fadeOutDuration: Duration(milliseconds: 1),
                        fadeInCurve: Curves.linear,
                        fit: BoxFit.cover,
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
              else if(constraints.maxWidth>400)...[
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
                    child: Image.network("https://images.unsplash.com/photo-1605326152964-56fb991b95ff?q=80&w=2160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",width: 35,height: 35,fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 5,),
                  Text("Vetana De Sneaker",style: TextStyle(fontWeight: FontWeight.w500,fontSize: fontSize),)
                ],
              ),
              ClipRRect(
                child: Image.network("https://flagsapi.com/KH/flat/64.png",height: 24,fit: BoxFit.fitHeight,),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

//external
void _launchDeepLink() async {
  const deepLink = 'https://t.me/chhailengkc';
  if (await canLaunchUrl(Uri.parse(deepLink))) {
    await launchUrl(Uri.parse(deepLink), mode: LaunchMode.inAppBrowserView,);
  } else {
    throw 'Could not launch $deepLink';
  }
}