import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class merchant extends StatelessWidget {
  merchant({super.key});
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  List<String> categorylst =['Sneaker', 'Clothing', "Kid's Clothing", 'Other','Sneaker', 'Clothing', "Kid's Clothing", 'Other'];

  @override
  Widget build(BuildContext context) {
    double width;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
              if(constraints.maxWidth < 800){
                width = MediaQuery.sizeOf(context).width;
                if(constraints.maxWidth<350) {
                  return mainscreen(width, context, 1);
                }else{
                  return mainscreen(width, context, 2);
                }
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
          body: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Header(width),
                  Store_info(width,context),
                  Contact(width, context),
                  const SizedBox(height: 5,),
                  category(categorylst, width),
                  const SizedBox(height: 5,),
                  uploadAndSub(width),
                  const SizedBox(height: 5,),
                  bodyGid(width, context, grid)
                ],
              ),
            ),
          ),
        )
    );
  }
  category(List<String> categorylist,double width){
    return Container(
      height:50,
      width: width*0.9,
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
  Contact(double width, context) {
      return SizedBox(
      width: width *0.9,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            phone_Contact_Row(width),
            const SizedBox(width: 10,),
            Social(35,35,20),

          ],
        ),
      ),
    );
  }
  Social(double width, double height ,double size) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10,left: 5),
          width: width,height: height,
          decoration: BoxDecoration(color: Colors.black,
              borderRadius: BorderRadius.circular(100)
          ),
          child: Icon(Icons.facebook, color: Colors.white,size: size,),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10,left: 5),
          width: width,height: height,
          decoration: BoxDecoration(color: Colors.black,
              borderRadius: BorderRadius.circular(100)
          ),
          child: Icon(Icons.telegram, color: Colors.white,size: size,),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10,left: 5),
          width: width,height: height,
          decoration: BoxDecoration(color: Colors.black,
              borderRadius: BorderRadius.circular(100)
          ),
          child: Icon(Icons.message_outlined, color: Colors.white,size: size,),
        ),
      ],);
  }
  phone_Contact_Row(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(

          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10)
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
              children: [
                Text("+855(0)27 229 039",style: GoogleFonts.montserrat(fontSize: 10,fontWeight: FontWeight.w400,color: Colors.white),),

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
          padding: const EdgeInsets.all(12),
          child: Row(
              children: [
                Text("+855(0)27 229 039",style: GoogleFonts.montserrat(fontSize: 10,fontWeight: FontWeight.w400,color: Colors.white),),

              ]
          ),
        ),
      ],
    );
  }
  profile_store_mini(double width) {
    return Padding(
      padding: const EdgeInsets.only(left: 3,right: 3),
      child: Container(
        width: width,
        height: 40,
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(1,1),
                blurRadius: 1,
                spreadRadius: 0.5,
              )]
        ),
        child: InkWell(
          onTap: (){
            Get.toNamed("/store?id=28222");
          },
          child: Row(
            children: [
              const SizedBox(width: 5,),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network("https://images.unsplash.com/photo-1605326152964-56fb991b95ff?q=80&w=2160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",width: 27,height: 27,fit: BoxFit.cover,),
              ),
              const SizedBox(width: 5,),
              const Text("Vetana De Sneaker",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 9),)
            ],
          ),
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
                child: const Icon(Icons.arrow_back_ios_new,size: 28,color: Color.fromRGBO(255, 75, 75, 1.0),)),
            Text("Merchant",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
            profileControl_nobg(40,40,24)
          ],
        )
    );
  }
  Store_info(double width, BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
          width: width*0.9,
          margin: const EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            color: const Color(0XFFFFF0BE),
            borderRadius: BorderRadius.circular(10),
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
                child: SizedBox(
                  width: width*0.5,
                  height: width <420 ? 100 : 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 0,
                          child: Text("Vetana De Sneaker",style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 18),)),
                      Expanded(
                        flex: 0,
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
      ],
    );
  }
  bodyGid(double width,BuildContext context,int Grid){

    return Container(
      width: width*0.9 +8,
      margin: const EdgeInsets.only(top: 5),
      child: StaggeredGrid.count(
        crossAxisCount: Grid,
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
        Get.toNamed("/productOwner?store=12345&product=28222");

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
                  constraints: const BoxConstraints(
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

                      Text("\$$price",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 16,decoration: TextDecoration.lineThrough,decorationThickness: 1.5,decorationColor: Colors.red))),

                    ],
                  )
                      :
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("\$$price",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 16))),

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
                    Text("-$discount%",style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 12)),
                    const SizedBox(width: 5,),
                    Text("\$$discountprice",style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 14)),

                  ],
                ),
              ),)
                : const Text("")
          ],
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
  uploadAndSub(double width) {
    return Container(
      width: width*0.9,
      margin: const EdgeInsets.only(top: 10),
      child:Row(
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
              child: Row(
                  children: [
                    const Icon(Icons.add_business_outlined,color: Colors.white,size: 18,),
                    const SizedBox(width: 5,),
                    Text("Add Product",style: GoogleFonts.montserrat(fontSize: 10,fontWeight: FontWeight.w400,color: Colors.white),),

                  ]
              ),
            ),
          ),
          Container(

            margin: const EdgeInsets.only(top: 10,left: 10),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10)
            ),
            padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
            child: Row(
                children: [
                  const Icon(Icons.workspace_premium_sharp,color: Colors.white,size: 18,),
                  const SizedBox(width: 5,),
                  Text("Subscription",style: GoogleFonts.montserrat(fontSize: 10,fontWeight: FontWeight.w400,color: Colors.white),),

                ]
            ),
          ),
        ],
      ),
    );

  }
}
