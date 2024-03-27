import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class storeList extends StatelessWidget {
  const storeList({super.key});

  @override
  Widget build(BuildContext context) {
    late double width;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
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
                },
                child: Icon(Icons.menu,size: 28,color: Color.fromRGBO(255, 75, 75, 1.0),)),
            Text("APP_Name",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
            InkWell(
              onTap: (){
                Get.toNamed("/login");
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const Image(
                  image: NetworkImage("https://pics.craiyon.com/2023-10-13/45c8f06467d74d7d8949ddadffc5b2c8.webp",),
                  height: 40,width: 40,
                ),
              ),
            )
          ],
        )
    );
  }
  mainscreen(double width, BuildContext context, int g) {
    return Container(
      width: MediaQuery.sizeOf(context).width,

      child: Column(
        children: [

          Header(width),
          SearchBars(width, context),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: width*0.91,
                    child:  StaggeredGrid.count(
                      crossAxisCount: g,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                      children: [
                        storecard(context,"https://images.unsplash.com/photo-1441984904996-e0b6ba687e04?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","https://images.unsplash.com/photo-1575663620136-5ebbfcc2c597?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","Davika",width),
                        storecard(context,"https://images.unsplash.com/photo-1441984904996-e0b6ba687e04?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","https://images.unsplash.com/photo-1575663620136-5ebbfcc2c597?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","Davika",width),
                        storecard(context,"https://images.unsplash.com/photo-1441984904996-e0b6ba687e04?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","https://images.unsplash.com/photo-1575663620136-5ebbfcc2c597?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","Davika",width),
                        storecard(context,"https://images.unsplash.com/photo-1441984904996-e0b6ba687e04?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","https://images.unsplash.com/photo-1575663620136-5ebbfcc2c597?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D","Davika",width),

                      ],

                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
  SearchBars(double width,BuildContext context){
    return   Hero(
      tag: 'search',
      child: InkWell(
        onTap: (){
          Get.toNamed("/profilesetting");
        },
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          width: width*0.9,
          height: 35,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(234, 234, 234, 1.0),
              borderRadius: BorderRadius.circular(5)
          ),
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
      ),
    );
  }
  storecard(BuildContext context,String cover, String profile, String name,double width){
    return Container(

      child: Card(
        surfaceTintColor: Colors.white,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [

            Container(
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 4/3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                      child: Image.network(cover,fit: BoxFit.cover,),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    child: Center(
                      child: Container(
                        padding:EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(0,0),
                                  spreadRadius: 2,
                                  blurRadius: 1
                              )
                            ],
                          borderRadius: BorderRadius.circular(1000)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(profile,fit: BoxFit.cover,width: 100,height: 100,),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10,bottom: 10),
              child: Text(name),
            )
          ],
        ),
      ),
    );
  }
}
