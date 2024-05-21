import 'package:ecomerce/customWidget/classwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
class trackDetail extends StatelessWidget {
  const trackDetail({super.key});

  @override
  Widget build(BuildContext context) {
    double width;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromRGBO(234,234,234,1),
            body: LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
              if(constraints.maxWidth < 800){
                width = MediaQuery.sizeOf(context).width;
                return mainscreen(width, context,2);
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
            },)
        ),
      ),
    );
  }

  mainscreen(double width, BuildContext context, int i) {
    return FutureBuilder<ImageInfo>(
      future: getImageInfo(Image.network("https://images.unsplash.com/photo-1508858627235-801debd2be27?q=80&w=2669&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")),
      builder:(context,snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return a placeholder widget while waiting for the future to complete
          return SizedBox(
              width: width,
              height: MediaQuery.sizeOf(context).height,
              child: Center(child: SizedBox(width: 150,height: 150, child: Lottie.asset("asset/Animation - 1713422112684.json"))));
        } else
        if (snapshot.hasError) {
          // Return an error widget if the future encounters an error
          return Text('Error: ${snapshot.error}');
        } else {
          // Return the ProductCard widget with the obtained ImageInfo
          return Column(
            children: [
              Header(width, context),
              Expanded(
                  child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: width*0.9,
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FadeInImage(
                              placeholder: const AssetImage("asset/aas.png"),
                              image: const NetworkImage(
                                  "https://images.unsplash.com/photo-1508858627235-801debd2be27?q=80&w=2669&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                              fit: BoxFit.cover,
                              imageErrorBuilder: (context, error, StackTrace) {
                                return SizedBox(
                                  width: MediaQuery
                                      .sizeOf(context)
                                      .width,
                                  child: const Center(
                                    child: Icon(
                                      Icons.error, color: Colors.black,),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: width*0.9,
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Pick-Up Location",style: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400)),),
                                const SizedBox(height: 5,),
                                Container(
                                  width: 120,
                                  height: 2,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: width*0.65,
                                    child: Text("Boeng Keng Kang 1, Khan Chamkar Mon,Phnom Penh",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontSize: 14,decoration: TextDecoration.underline)))),
                                const SizedBox(width: 15,),
                                const Icon(Icons.location_on_rounded,color: Colors.black,)
                              ],
                            ),

                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: width*0.9,
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text("Price :"),
                                Text(" \$188.00",style: GoogleFonts.montserrat(textStyle: const TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent,fontSize: 14))),
                              ],
                            ),

                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: width*0.9,
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Customer Info",style: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400)),),
                                const SizedBox(height: 5,),
                                Container(
                                  width:100,
                                  height: 2,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15,),
                            Text("Chan Sophea",style: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold)),),
                            const SizedBox(height: 20,),
                            Row(
                              children: [
                                Text("013 873 829",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontSize: 14, decoration: TextDecoration.underline))),
                                const SizedBox(width: 15,),
                                const Icon(Icons.call,color: Colors.black,)
                              ],
                            ),
                            const SizedBox(height: 15,),
                            Row(
                              children: [
                                Text("013 873 829",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontSize: 14,decoration: TextDecoration.underline))),
                                const SizedBox(width: 15,),
                                const Icon(Icons.call,color: Colors.black,)
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Location",style: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400)),),
                                const SizedBox(height: 5,),
                                Container(
                                  width: 70,
                                  height: 2,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: width*0.65,
                                    child: Text("Boeng Keng Kang 1, Khan Chamkar Mon,Phnom Penh",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontSize: 14,decoration: TextDecoration.underline)))),
                                const SizedBox(width: 15,),
                                const Icon(Icons.location_on_rounded,color: Colors.black,)
                              ],
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: width*0.9,
                        padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Delivery Info",style: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400)),),
                                const SizedBox(height: 5,),
                                Container(
                                  width:90,
                                  height: 2,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10,),
                            Text("Rottanak",style: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold)),),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                Text("013 873 829",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontSize: 14, decoration: TextDecoration.underline))),
                                const SizedBox(width: 15,),
                                const Icon(Icons.call,color: Colors.black,)
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                Text("013 873 829",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontSize: 14,decoration: TextDecoration.underline))),
                                const SizedBox(width: 15,),
                                const Icon(Icons.call,color: Colors.black,)
                              ],
                            ),


                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: width*0.9,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Tracking",style: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w400)),),
                                      const SizedBox(height: 5,),
                                      Container(
                                        width: 60,
                                        height: 2,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.circular(100)
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 30,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Accepted",style: GoogleFonts.montserrat(textStyle: const TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold)),),
                                    ],
                                  ),
                                  const SizedBox(height: 50,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(100),
                                            ),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(100),
                                                ),
                                                child: const Icon(Icons.check_circle,color: Colors.black,)),
                                          ),
                                          const SizedBox(width: 3,),
                                          Container(
                                            width: 20,
                                            height: 2,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(100)
                                            ),
                                          ),
                                          const SizedBox(width: 3,),
                                          Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(100),
                                            ),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(100),
                                                ),
                                                child: const Icon(Icons.check_circle,color: Colors.white,)),
                                          ),
                                          const SizedBox(width: 3,),
                                          Container(
                                            width: 20,
                                            height: 2,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(100)
                                            ),
                                          ),
                                          const SizedBox(width: 3,),
                                          Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(100),
                                            ),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(100),
                                                ),
                                                child: const Icon(Icons.check_circle,color: Colors.white,)),
                                          ),
                                          const SizedBox(width: 3,),
                                          Container(
                                            width: 20,
                                            height: 2,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(100)
                                            ),
                                          ),
                                          const SizedBox(width: 3,),
                                          Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(100),
                                            ),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(100),
                                                ),
                                                child: const Icon(Icons.check_circle,color: Colors.white,)),
                                          ),
                                          const SizedBox(width: 3,),
                                          Container(
                                            width: 20,
                                            height: 2,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(100)
                                            ),
                                          ),
                                          const SizedBox(width: 3,),
                                          Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius: BorderRadius.circular(100),
                                            ),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(100),
                                                ),
                                                child: const Icon(Icons.check_circle,color: Colors.white,)),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                        SizedBox(
                                          width: width,
                                          child: Center(child: Container(
                                          margin: const EdgeInsets.only(top: 15),
                                           width: 40,height: 20, child: Lottie.asset("asset/Animation - 1713422873683.json"))
                                          )
                                        ),
                                  const SizedBox(height: 5,),
                                ],
                              ),
                            ),
                            Positioned(
                                right: 10,
                                top: 5,
                                child: IconButton(onPressed: (){}, icon: const Icon(Icons.refresh)))
                          ],
                        ),
                      ),

                      const SizedBox(height: 100,)
                    ],
                  ),
                ),
              )
              )
            ],
          );
        }

      },
    );
  }
  Header(double width,context) {
    return Container(
        color: Colors.white,
        height: 60,
        padding: const EdgeInsets.only(left: 15,right: 15,top: 10,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios_new_rounded,size: 28,color: Color.fromRGBO(255, 75, 75, 1.0),)),
            Text("Tracking",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
            InkWell(
              onTap: (){
                Get.toNamed("/login");
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const Image(
                  image: NetworkImage("https://pics.craiyon.com/2023-10-13/45c8f06467d74d7d8949ddadffc5b2c8.webp",),
                  height: 35,width: 35,
                ),
              ),
            )
          ],
        )
    );
  }
}
