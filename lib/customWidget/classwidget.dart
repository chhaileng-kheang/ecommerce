import 'dart:async';
import 'dart:math';

import 'package:ecomerce/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
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
            width >= 800 ? const BoxShadow(
              color: Colors.black12,
              offset: Offset(0,0),
              spreadRadius: 0.5,
              blurRadius: 0.5,) : const BoxShadow(

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5)),
                    child: AspectRatio(
                      aspectRatio: dire == "v" ? 3 / 4 : 4 / 3,
                      child: FadeInImage.assetNetwork(placeholder: "asset/aas.png", image: img,imageCacheWidth: 500,filterQuality: FilterQuality.low,fit: BoxFit.cover,)
                    )
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(title, style: const TextStyle(color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12)),),
                Container(
                  margin: const EdgeInsets.only(
                      left: 5, right: 5, bottom: 5, top: 10),
                  child: discount != "0" ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Text("\$$price", style: GoogleFonts.montserrat(
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Text("\$$price", style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(color: Color.fromRGBO(140,0,0,1),
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
                    Text("-$discount%",
                        style: const TextStyle(color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 12)),
                    const SizedBox(width: 5,),
                    Text("\$$discountprice",
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

uploadAndSub(double width) {
  return Container(
    width: width*0.9,
    margin: const EdgeInsets.only(top: 0),
    child:SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              Get.toNamed("/uploadproduct");
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)
              ),
              padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
              child: Column(
                  children: [
                    const Icon(Icons.add_business_outlined,color: Colors.white,size: 24,),
                    const SizedBox(height: 5,),
                    Text("Upload",style: GoogleFonts.montserrat(fontSize: 9,fontWeight: FontWeight.w400,color: Colors.white),),

                  ]
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Get.toNamed("/delivery");
            },
            child: Container(

              margin: const EdgeInsets.only(top: 10,left: 10),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)
              ),
              padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
              child: Column(
                  children: [
                    const Icon(Icons.delivery_dining,color: Colors.white,size: 24,),
                    const SizedBox(height: 5,),
                    Text("Delivery",style: GoogleFonts.montserrat(fontSize: 9,fontWeight: FontWeight.w400,color: Colors.white),),

                  ]
              ),
            ),
          ),
          InkWell(
            onTap: (){
              Get.toNamed("/subscription");
            },
            child: Container(

              margin: const EdgeInsets.only(top: 10,left: 10),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)
              ),
              padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
              child: Column(
                  children: [
                    const Icon(Icons.workspace_premium_sharp,color: Colors.white,size: 24,),
                    const SizedBox(height: 5,),
                    Text("Upgrade",style: GoogleFonts.montserrat(fontSize: 9,fontWeight: FontWeight.w400,color: Colors.white),),

                  ]
              ),
            ),
          ),

        ],
      ),
    ),
  );

}

Headerss(double width,BuildContext context, scaffoldKey) {
  return Container(
      height: 50,
      color: Colors.white,
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                scaffoldKey.currentState!.openDrawer();
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: const Icon(Icons.menu)
              )
          ),
          Text("App-Name", style: GoogleFonts.montserrat(
              textStyle: const TextStyle(color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),),
          Hero(
            tag: "search",
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const search();
                },));
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: const Icon(Icons.search)
              ),
            ),
          )
        ],
      )
  );
}

TrippleSponsor(double width, BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    width: width * 0.9,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SponsorCard(width, context,
              "https://images.unsplash.com/photo-1521223890158-f9f7c3d5d504?q=80&w=1492&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
          SponsorCard(width, context,
              "https://plus.unsplash.com/premium_photo-1675186049409-f9f8f60ebb5e?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
          SponsorCard(width, context,
              "https://images.stylight.net/image/upload/t_web_post_500x667/q_auto,f_auto/post-3515bce73e333a3a5bb3d9127bdc6d0c35c88a9cffed7da8425a7148.webp"),
          SponsorCard(width, context,
              "https://www.dhresource.com/webp/m/0x0/f2/albu/g19/M00/5F/C5/rBVap2DIXmGAaCmOAAGt0CgPIok342.jpg"),
          SponsorCard(width, context,
              "https://images.unsplash.com/photo-1434389677669-e08b4cac3105?q=80&w=2610&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
          SponsorCard(width, context,
              "https://images.unsplash.com/photo-1560769629-975ec94e6a86?q=80&w=2564&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
        ],
      ),
    ),
  );
}

SponsorCard(double width, BuildContext context, String img) {
  return GestureDetector(
    onTap: (){
      Get.toNamed("/product");
    },
    child: Container(
      margin: const EdgeInsets.only(right: 10),
      width: width / 2.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 3.5 / 4,
                child: Container(
                  width: width / 2,
                  color: const Color.fromRGBO(234,234,234,1),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: FadeInImage.assetNetwork(placeholder: "asset/aas.png", image: img,imageCacheWidth: 500,filterQuality: FilterQuality.low,fit: BoxFit.cover,)
                  ),
                ),
              ),
              Positioned(
                left: 0,
                  bottom: 0,
                  child: Container(
                    height: 30,
                    width: 60,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(234,234,234,1),
                        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(15),topRight: Radius.circular(15))
                    ),
                    child: const Center(
                      child: Text("-10%",style: TextStyle(
                          color: Color.fromRGBO(148, 0, 0, 1.0),
                          fontWeight: FontWeight.bold,
                          fontSize: 12),),
                    ),
                  )
              )
            ],
          ),
          const SizedBox(height: 15,),
          Text("online Men Printed...", style: GoogleFonts.montserrat( textStyle: const TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.w500))),

          const SizedBox(height: 5,),
          Row(
            children: [
              Text("\$ 125", style: GoogleFonts.montserrat( textStyle: const TextStyle(color: Colors.red, fontSize: 12,
                  decoration: TextDecoration.lineThrough, decorationThickness: 1.5, decorationColor: Colors.red)),),
              const SizedBox(width: 15,),
              Container(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(148, 0, 0, 1.0),
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Text("\$ 85", style: GoogleFonts.montserrat( textStyle: const TextStyle(color: Colors.white, fontSize: 12)),)),
            ],
          ),
        ],
      ),
    ),
  );
}

BannerSponsorEx(double width, String img) {

  return Container(
    width: width * 0.9,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),

      color: Colors.grey,
    ),
    margin: const EdgeInsets.only(top: 5, bottom: 2),
    child: AspectRatio(aspectRatio: 4 / 1,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(img,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.low,
              errorBuilder: (context, error, stackTrace) {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: const Center(
                    child: Icon(Icons.error,color: Colors.black,),
                  ),
                );
              },)
        )
    ),
  );
}

RegisterMerchant(double width, BuildContext context) {
  return Container(
    width: width * 0.9,
    height: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      gradient: RadialGradient(
        center: Alignment.centerRight,
        radius: 5,
        colors: [
          Colors.orange.shade100,
          const Color(0xFFFFAD5B),

        ],
        stops: const [0.1, 0.5],
      ),
    ),
    margin: const EdgeInsets.only(top: 5, bottom: 3),
    child: Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Stack(
        children: [
          Positioned(
            bottom: 7,
            right: 0,
            child: SizedBox(height: 120,
                child: Lottie.asset("asset/Animation - 1712806927475.json",animate: true)
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Register As Merchant", style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),),
              Text("For Free", style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold))),
              GestureDetector(
                onTap: (){
                  Get.toNamed("/login");
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 35),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text("Login / SignUp", textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(textStyle: const TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))),
                ),
              )
            ],
          ),

        ],
      ),
    ),
  );
}
store(String img) {
  return Container(
    margin: const EdgeInsets.only(right: 10),
    height: 70,
    width: 70,
    padding: const EdgeInsets.all(2),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: Colors.black,
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: FadeInImage(
        placeholder: const AssetImage("asset/aas.png"),
        image: NetworkImage(img),
        fit: BoxFit.cover,
        imageErrorBuilder: (context,error,StackTrace){
          return SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: const Center(
              child: Icon(Icons.error,color: Colors.white,),
            ),
          );
        },
      ),
    ),
  );
}
storepath(double width, BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 10, bottom: 20),
    color: Colors.white,
    width: width,
    height: 100,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 20,),
          store(
              "https://plus.unsplash.com/premium_photo-1690263583138-155eca49f57d?q=80&w=2660&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
          store(
              "https://plus.unsplash.com/premium_photo-1684407617236-c60dc693293a?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
          store(
              "https://images.unsplash.com/photo-1564510715156-793609f9e8b5?q=80&w=2671&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
          store(
              "https://images.unsplash.com/photo-1565958011703-44f9829ba187?q=80&w=2565&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
          store(
              "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?q=80&w=2580&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
          store(
              "https://plus.unsplash.com/premium_photo-1677451335829-c863209d463b?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
          store(
              "https://plus.unsplash.com/premium_photo-1690263583138-155eca49f57d?q=80&w=2660&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
          store(
              "https://plus.unsplash.com/premium_photo-1684407617236-c60dc693293a?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),

        ],
      ),
    ),
  );
}
Contact(double width, context) {
    print("width $width");
  return Container(
    margin: const EdgeInsets.only(top: 5),
    child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        return SizedBox(
          width: width*0.9,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                if(constraints.maxWidth > 450)...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Social(45,45,24,11),
                      const SizedBox(width: 5,),
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
                      const SizedBox(width: 3,),
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
                        const SizedBox(width: 5,),
                        phone_Contact_Row(width,8.5),
                      ],
                    ),

                  ]
                  else...[
                      //fold
                      SizedBox(
                        width: width*0.9,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Social(38,20,18,8.5),
                              const SizedBox(width: 10,),
                              phone_Contact_Row(width,8.5),
                            ],
                          ),
                        ),
                      ),

                    ],
              ],
            ),
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
        margin: const EdgeInsets.only(top: 10),
        height: width-7,
        padding: EdgeInsets.only(left: fontsize - 4,right: 10),
        decoration: BoxDecoration(color: Colors.black,
            borderRadius: BorderRadius.circular(10)
        ),
        child: GestureDetector(
          onTap: (){
            _launchDeepLink("fb-messenger://user-thread/morescollagenoffical");
          },
          child: Row(
            children: [
              Icon(Icons.facebook, color: Colors.white,size: size-2,),
              Text("  Messenger",style: GoogleFonts.montserrat(fontSize: fontsize,fontWeight: FontWeight.w400,color: Colors.white),)
            ],
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 10,left: 10),
        height: width-7,
        padding: EdgeInsets.only(left: fontsize - 4,right: 10),
        decoration: BoxDecoration(color: Colors.black,
            borderRadius: BorderRadius.circular(10)
        ),
        child: InkWell(
          onTap: (){
            _launchDeepLink("tg://resolve?domain=chhailengkc");
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

        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
        child: Row(
            children: [
              Text("027 229 039",style: GoogleFonts.montserrat(fontSize: size,fontWeight: FontWeight.w400,color: Colors.white),),

            ]
        ),
      ),
      const SizedBox(width: 10,),
      Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
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
    padding: const EdgeInsets.only(left: 1,right: 1,bottom: 5),
    child: Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
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
          margin: const EdgeInsets.only(right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 5,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child : FadeInImage(
                      placeholder: const AssetImage('asset/aas.png'),
                      fadeInDuration: const Duration(milliseconds: 100),
                      image: const NetworkImage("https://images.unsplash.com/photo-1605326152964-56fb991b95ff?q=80&w=2160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                      fadeOutDuration: const Duration(milliseconds: 1),
                      fadeInCurve: Curves.linear,
                      height: 35,
                      width: 35,
                      fit: BoxFit.cover,
                      imageErrorBuilder: (context,error,StackTrace){
                        return SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: const Center(
                            child: Icon(Icons.error),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Text("Vetana De Sneaker",style: TextStyle(fontWeight: FontWeight.w500,fontSize: fontSize),)
                ],
              ),
              ClipRRect(
                child : FadeInImage(
                  placeholder: const AssetImage('asset/aas.png'),
                  fadeInDuration: const Duration(milliseconds: 100),
                  image: const NetworkImage("https://flagsapi.com/KH/flat/64.png"),
                  fadeOutDuration: const Duration(milliseconds: 1),
                  fadeInCurve: Curves.linear,
                  height: 24,
                  fit: BoxFit.fitHeight,
                  imageErrorBuilder: (context,error,StackTrace){
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: const Center(
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
Future<void> _launchDeepLink(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
Future<ImageInfo> getImageInfo(Image img) async {
  final c = Completer<ImageInfo>();
  img.image
      .resolve(const ImageConfiguration())
      .addListener(ImageStreamListener((ImageInfo i, bool _) {
    c.complete(i);
  }));
  return c.future;
}

