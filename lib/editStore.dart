import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class editStore extends StatefulWidget {
  const editStore({super.key});

  @override
  State<editStore> createState() => _editStoreState();
}

class _editStoreState extends State<editStore> {
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
  mainscreen(double width, BuildContext context, int g){
    return Column(
      children: [
        Header(width),
        SizedBox(height: 50,),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: width*0.9,
          height: 45,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(234, 234, 234, 1.0),
              borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            children: [
              Container(
                width: width*0.8,
                child: TextField(
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    decoration: const InputDecoration(
                      enabled: true,
                      hintText: "Store Name",
                      contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                      border: InputBorder.none,
                      prefixIconColor: Colors.black,
                    )
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: width*0.9,
          height: 45,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(234, 234, 234, 1.0),
              borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            children: [
              Container(
                width: width*0.8,
                child: TextField(
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    decoration: const InputDecoration(
                      enabled: true,
                      hintText: "Facebook's URL",
                      contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                      border: InputBorder.none,
                      prefixIconColor: Colors.black,
                    )
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: width*0.9,
          height: 45,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(234, 234, 234, 1.0),
              borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            children: [
              Container(
                width: width*0.8,
                child: TextField(
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    decoration: const InputDecoration(
                      enabled: true,
                      hintText: "Telegram's URL",
                      contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                      border: InputBorder.none,
                      prefixIconColor: Colors.black,
                    )
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: width*0.9,
          height: 45,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(234, 234, 234, 1.0),
              borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            children: [
              Container(
                width: width*0.8,
                child: TextField(
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    decoration: const InputDecoration(
                      enabled: true,
                      hintText: "Phone number (1)",
                      contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                      border: InputBorder.none,
                      prefixIconColor: Colors.black,
                    )
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: width*0.9,
          height: 45,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(234, 234, 234, 1.0),
              borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            children: [
              Container(
                width: width*0.8,
                child: TextField(
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    decoration: const InputDecoration(
                      enabled: true,
                      hintText: "Phone number (2)",
                      contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                      border: InputBorder.none,
                      prefixIconColor: Colors.black,
                    )
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: width*0.9,
          height: 45,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(234, 234, 234, 1.0),
              borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            children: [
              Container(
                width: width*0.8,
                child: TextField(
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    decoration: const InputDecoration(
                      enabled: true,
                      hintText: "E-mail",
                      contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                      border: InputBorder.none,
                      prefixIconColor: Colors.black,
                    )
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: width*0.9,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(234, 234, 234, 1.0),
              borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            children: [
              Container(
                width: width*0.8,
                margin: EdgeInsets.only(top: 10),
                child: TextField(
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    maxLines: 5,
                    decoration: const InputDecoration(
                      enabled: true,
                      hintText: "Address",
                      contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                      border: InputBorder.none,
                      prefixIconColor: Colors.black,
                    )
                ),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: (){

          },
          child: Container(
            width:  width*0.9,
            padding: EdgeInsets.only(left: 25,right: 25,top: 8,bottom: 8),
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5)
            ),
            child: Center(
              child: Text(
                "Save",
                style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
      ],
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
                child: Icon(Icons.arrow_back_ios,size: 28,color: Color.fromRGBO(255, 75, 75, 1.0),)),
            Text("Edit Store",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
            Text("",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
          ],
        )
    );
  }
}
