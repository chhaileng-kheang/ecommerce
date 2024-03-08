import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class search extends StatelessWidget {
  const search({super.key});

  @override
  Widget build(BuildContext context) {
    double width;
    return Scaffold(
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

    );
  }

 mainscreen(double width, BuildContext context, int i) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        children: [
          Header(width),
        ],
      ),
    );

  }
  Header(double width) {
    return Container(
        height: 50,
        margin: const EdgeInsets.only(left: 15,right: 15,top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
                onTap: (){

                },
                child: Icon(Icons.menu,size: 28,color: Color.fromRGBO(255, 75, 75, 1.0),)),
            SizedBox(width: 15,),
            SearchBars(width*0.9)
          ],

        )
    );
  }
  SearchBars(double width){
    return   Hero(
        tag: 'search',
      child: Container(
        margin: const EdgeInsets.only(top: 5),
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
      ),
    );
  }
}
