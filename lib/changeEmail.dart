import 'package:ecomerce/classobject/staticdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class changeEmail extends StatefulWidget {
   changeEmail({super.key});

  @override
  State<changeEmail> createState() => _changeEmailState();
}

class _changeEmailState extends State<changeEmail> {
  List<String> suggest_s = [];
  late IconData icondata =  Icons.remove_red_eye_outlined;
  TextEditingController passwordtxt = TextEditingController();
  late bool view = false;
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
          child:          Container(
              width: width*0.8,
              child:   Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  suggest_s.clear();
                  if(!textEditingValue.text.contains("@")) {
                    for (String i in Data.suggest) {
                      suggest_s.add(textEditingValue.text + i);
                    }
                    return suggest_s;
                  }else{
                    return const Iterable<String>.empty();
                  }
                },
                fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                  return TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                        border: InputBorder.none,
                        prefixIconColor: Colors.black,
                        hintText: 'E-Mail',
                        hintStyle: GoogleFonts.montserrat(
                            fontSize: 14
                        )
                    ),
                    focusNode: focusNode,
                    onFieldSubmitted: (String value) {
                      onFieldSubmitted();
                      print('You just typed a new entry  $value');
                    },
                  );
                },
                onSelected: (String selection) {
                  print('You just selected $selection');
                },
              )
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 15),
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

                    obscureText: view == true ? true : false,
                    controller: passwordtxt,
                    decoration: const InputDecoration(
                      enabled: true,
                      hintText: "Password",
                      contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                      border: InputBorder.none,
                      prefixIconColor: Colors.black,
                    )
                ),
              ),
              InkWell(
                  onTap: (){
                    setState(() {
                      if(view == true){
                        icondata = Icons.remove_red_eye_sharp;
                        view = false;
                      }else{
                        view = true;
                        icondata = Icons.remove_red_eye_outlined;
                      }
                    });
                  },
                  child: Icon(icondata))
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: width*0.9,
          height: 45,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(234, 234, 234, 1.0),
                    borderRadius: BorderRadius.circular(5)
                ),
                width: width*0.5,
                child: TextField(
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    decoration: const InputDecoration(
                      enabled: true,
                      hintText: "OTP (Send to Email)",
                      contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                      border: InputBorder.none,
                      prefixIconColor: Colors.black,
                    )
                ),
              ),
              Container(
                width:  width*0.3,
                padding: EdgeInsets.only(left: 25,right: 25,top: 15,bottom: 15),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Center(
                  child: Text(
                    "Get Code",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white)),
                  ),
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: (){

          },
          child: Container(
            width:  width*0.9,
            padding: EdgeInsets.only(left: 25,right: 25,top: 12,bottom: 12),
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
                  Get.back();

                },
                child: Icon(Icons.arrow_back_ios,size: 28,color: Color.fromRGBO(255, 75, 75, 1.0),)),
            Text("Change Email",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
            Text("        ",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
          ],
        )
    );
  }
}
