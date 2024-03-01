import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
class mobile extends StatelessWidget {
   mobile({super.key});
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];


  @override
  Widget build(BuildContext context) {
    late double width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
        if(constraints.maxWidth < 1000){
          width = MediaQuery.sizeOf(context).width;
          return Scaffold(
            backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
            body: SizedBox(
              width: width,
              height: MediaQuery.sizeOf(context).height,
              child: Column(
                children: [
                  Header(width),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: width,
                    height: MediaQuery.sizeOf(context).height-60,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SearchBars(width),
                          BannerSponsor(width),
                          SizedBox(
                            width: width*0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                  
                                    margin: const EdgeInsets.only(top: 12),
                                    child: Text("Sponsor",style: GoogleFonts.montserrat(fontSize: 16,fontWeight: FontWeight.w400),)),
                              ],
                            ),
                          ),
                          TrippleSponsor(width,context),
                          BannerSponsorEx(width),
                          bodyGid(width, context),
                          const SizedBox(height: 60,)
                        ],
                      ),
                    ),
                  ),
                )
                ],
              ),
            )
          );
        }else{
          width = 1000;
          return Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: Container(
                  color: const Color.fromRGBO(255, 255, 255, 1.0),
                  width: width,

                ),
              )
          );
        }
      },)
    );
  }

  Header(double width) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.menu,size: 28,color: Color.fromRGBO(255, 75, 75, 1.0),),
          Text("App-Name",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
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
  SearchBars(double width){
    return   Container(
      margin: const EdgeInsets.only(top: 15),
      width: width*0.9,
      height: 35,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(234, 234, 234, 1.0),
          borderRadius: BorderRadius.circular(5)
      ),
      child: InkWell(
        onTap: (){},
        child: Row(
          children: [
            SizedBox(
              width: width*0.8,
              height: 35,
              child: TextField(
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  decoration: const InputDecoration(
                    enabled: false,
                    hintText: "Search",
                    contentPadding: EdgeInsets.only(left: 10,right: 10,top: 0),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.black,
                  )
              ),
            ),
            Text("ALL",
              style: GoogleFonts.montserrat(textStyle: const TextStyle(
                  fontSize: 14
              ),
              ),)
          ],
        ),
      ),
    );
  }
  TrippleSponsor(double width,BuildContext context){
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: width*0.9,
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  SizedBox(
                    width: width/3.35,
                    height: 140,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5)),
                      child: Image.network("https://images.stylight.net/image/upload/t_web_post_500x667/q_auto,f_auto/post-3515bce73e333a3a5bb3d9127bdc6d0c35c88a9cffed7da8425a7148.webp",fit: BoxFit.cover,  ),
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
                  SizedBox(
                    width: width/3.35,
                    height: 140,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5)),
                      child: Image.network("https://www.dhresource.com/webp/m/0x0/f2/albu/g19/M00/5F/C5/rBVap2DIXmGAaCmOAAGt0CgPIok342.jpg",fit: BoxFit.cover,  width: MediaQuery.sizeOf(context).width,),
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
                  SizedBox(
                    width: width/3.35,
                    height: 140,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(5),topLeft: Radius.circular(5)),
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiNqZEHcC_DdFEzlsERkfVA1ikhe-SzwkgxVF4cbyBCeRLkxKvKwWO1aggj07BFPCBFIE&usqp=CAU",fit: BoxFit.cover,  width: MediaQuery.sizeOf(context).width,),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
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
              autoPlay: true,
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
   BannerSponsorEx(double width) {

     return Container(
       margin: const EdgeInsets.only(top: 10),
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

   bodyGid(double width,BuildContext context){

    return Container(
      width: width*0.9 +8,
      margin: const EdgeInsets.only(top: 5),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        children: [
          ProductCard(context, "https://images.unsplash.com/photo-1576487503401-173ffc7c669c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODB8fHNuZWFrZXJ8ZW58MHx8MHx8fDA%3D", "pair of black air jordan", "200", "10111222", "sneaker", "20"),
          ProductCard(context, "https://images.unsplash.com/photo-1589578228447-e1a4e481c6c8?q=80&w=2664&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "black computer keyboard", "60", "10111222", "Keyboard", "0"),
          ProductCard(context, "https://images.unsplash.com/photo-1607861716497-e65ab29fc7ac?q=80&w=2564&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "pair of black air jordan", "170", "10111222", "sneaker", "20"),
          ProductCard(context, "https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?q=80&w=2572&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "white crew neck long sleeve shirt", "35", "10111222", "T-shirt", "0"),
          ProductCard(context, "https://images.unsplash.com/photo-1548036328-c9fa89d128fa?q=80&w=2669&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "black gucci leather shoulder bag", "870", "10111222", "Bag", "5"),
          ProductCard(context, "https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?q=80&w=2650&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "pair of black air jordan", "80", "10111222", "sneaker", "0"),




        ],

      ),
    );
   }
   ProductCard(BuildContext context,String img, String title, String price,String id,String category, String discount) {
    double discountprice = double.parse(price) - (double.parse(price)*(double.parse(discount)/100));
     return InkWell(
       onTap: (){

       },
       child: Card(
         color: Colors.white,
         surfaceTintColor: Colors.white,
         shape: const RoundedRectangleBorder(
             borderRadius: BorderRadius.all(Radius.circular(5))
         ),
         child: Stack(
           children: [
             Column(
               children: [
                 ConstrainedBox(
                  constraints: new BoxConstraints(
                    maxHeight: 300
                    ),
                   child: ClipRRect(
                     borderRadius: const BorderRadius.only(topRight:  Radius.circular(5), topLeft:  Radius.circular(5)),
                     child: FadeInImage.assetNetwork(placeholder: 'asset/aas.png', image: img,fit: BoxFit.cover,width: MediaQuery.sizeOf(context).width,)
                   ),
                 ),
                 Container(
                   padding: const EdgeInsets.all(5),
                   child: Text(title,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12)),),
                 Container(
                   margin: const EdgeInsets.only(left: 5,right: 5,bottom: 5,top: 10),
                   child: discount != "0" ? Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [

                       Text("\$" +price,style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 16))),

                     ],
                   )
                       :
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [

                       Text("\$" +price,style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 16))),

                     ],
                   ),
                 )
               ],
             ),
            discount != "0" ?  Positioned(
              bottom: 0,right: 0,
              child:   Container(
                padding: const EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 75, 75, 1.0),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomRight: Radius.circular(5))
                ),
                child: Row(
                  children: [
                    Text("-" + discount.toString() + "%",style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 12)),
                    const SizedBox(width: 5,),
                    Text("\$"+discountprice.toString(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 14)),

                  ],
                ),
              ),)
                : const Text("")
           ],
         ),
       ),
     );
   }
}

