import 'package:ecomerce/api/productAPI.dart';
import 'package:ecomerce/imgviewLite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'customWidget/classwidget.dart';
import 'classobject/object.dart';
class merchantTab extends StatefulWidget {
  merchantTab({super.key});

  @override
  State<merchantTab> createState() => _merchantTabState();
}

class _merchantTabState extends State<merchantTab> {
  final List<ProductObj> Products = [
    ProductObj(product_title: "product A", id: "id", img: "https://images.unsplash.com/photo-1576487503401-173ffc7c669c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8ODB8fHNuZWFrZXJ8ZW58MHx8MHx8fDA%3D", price: "100", category: "category", discount: "5", disbool: "false",derection: "v"),
    ProductObj(product_title: "product B", id: "id", img:  "https://images.unsplash.com/photo-1589578228447-e1a4e481c6c8?q=80&w=2664&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "140", category: "category", discount: "35", disbool: "",derection: "h"),
    ProductObj(product_title: "product C", id: "id", img:"https://images.unsplash.com/photo-1607861716497-e65ab29fc7ac?q=80&w=2564&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "80", category: "category", discount: "10", disbool: "disbool",derection: "v"),
    ProductObj(product_title: "product D", id: "id", img:   "https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?q=80&w=2572&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "78", category: "category", discount: "0", disbool: "disbool",derection: "h"),
    ProductObj(product_title: "product E", id: "id", img:   "https://images.unsplash.com/photo-1548036328-c9fa89d128fa?q=80&w=2669&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",price: "214", category: "category", discount: "9", disbool: "disbool",derection: "h"),
    ProductObj(product_title: "product F", id: "id", img: "https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?q=80&w=2650&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", price: "69", category: "category", discount: "0", disbool: "disbool",derection: "h"),

  ];
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  late Future<List<Product>>data;
  List<String> categorylst =['Sneaker', 'Clothing', "Kid's Clothing", 'Other','Sneaker', 'Clothing', "Kid's Clothing", 'Other'];
  bool isExpand = false;
  String _image = "";
  String cover = "";
  @override
  Widget build(BuildContext context) {
    double width;
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromRGBO(234, 234, 234, 1.0),
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

  maintest (double width, BuildContext context,int grid ){
   return FutureBuilder<List<Product>>(future: data, builder: (context,snapshot){
     if(snapshot.hasData){
       return Text(snapshot.data![0].productTitle);
     }else{
       return const Text("failed");
     }

   });
  }

  mainscreen(double width, BuildContext context,int grid ){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  StoreInFo(width, context),
                  uploadAndSub(width),
                  category(categorylst, width),
                  const SizedBox(height: 5,),
                  bodyGid(width, context, grid,false,true,Products),
                  const SizedBox(height: 100,),
                ],
              ),
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
      width: width,
      color: Colors.white,
      padding: const EdgeInsets.only(top: 5,bottom: 15),
      child: Center(
        child: Container(
          height:50,
          width: width*0.9,
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                const BoxShadow(
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
        ),
      ),
    );
  }

  Contact(double width, context) {
    return Container(
        child: Container(
          margin: const EdgeInsets.only(top: 5),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
              return Container(
                width: width*0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if(constraints.maxWidth > 480)...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Social(45,45,24,12),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      phone_Contact_Row(width,12),
                    ]
                    else if(constraints.maxWidth>350)...[
                      //mobile
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Social(38,20,18,8),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      phone_Contact_Row(width,8.5),
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
                                Social(38,20,18,8),
                                const SizedBox(width: 10,),
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
        )
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
          child: Row(
            children: [
              Icon(Icons.facebook, color: Colors.white,size: size-2,),
              Text("  Facebook",style: GoogleFonts.montserrat(fontSize: fontsize,fontWeight: FontWeight.w400,color: Colors.white),)
            ],
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


  Header(double width) {
    return Container(
        height: 70,
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
        padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: (){
                  Get.back();
                },
                child: const Text("            ")),
            Text("Profle",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16)),),
           IconButton(onPressed: (){
             Get.toNamed("/profilesetting");

           }, icon: const Icon(Icons.settings,color: Colors.white,))
          ],
        )
    );
  }
  void _launchDeepLink() async {
    const deepLink = 'https://t.me/chhailengkc';
    if (await canLaunchUrl(Uri.parse(deepLink))) {
      await launchUrl(Uri.parse(deepLink), mode: LaunchMode.inAppBrowserView,);
    } else {
      throw 'Could not launch $deepLink';
    }
  }
  StoreInFo(double width, BuildContext context){

    return Container(
      width: width,
      height: 260,
      color: Colors.white,
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => viewimg(img: "https://images.unsplash.com/photo-1511317590834-e985451ca5c7?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),));
            },
            child: Container(
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
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => viewimg(img: "https://images.unsplash.com/photo-1605326152964-56fb991b95ff?q=80&w=2160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network("https://images.unsplash.com/photo-1605326152964-56fb991b95ff?q=80&w=2160&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",width: 80,height: 80,fit: BoxFit.cover,),
                      ),
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
                  boxShadow: [
                    const BoxShadow(
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
      width: width,
      color: Colors.white,
      padding: const EdgeInsets.only(top: 10,bottom: 5),
      child:Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: width*0.9,
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
        ),
      ),
    );

  }
}
