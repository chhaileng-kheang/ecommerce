import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:ecomerce/customWidget/widgetSize.dart';
import 'package:ecomerce/imageManager.dart';
import 'package:ecomerce/classobject/staticdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class uploadProduct extends StatefulWidget {
  uploadProduct({super.key});
  late double size = 10;
  late double size2 = 10;
  late bool vi = true;
  late bool hiz = false;
  late double thumbnail = 10;
  late double thumbnail1 = 10;
  late bool isImageDES = false;


  @override
  State<uploadProduct> createState() => _uploadProductState();
}

class _uploadProductState extends State<uploadProduct> {
  @override
  bool status = false;

  var status2 = false;
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
                child: Icon(Icons.arrow_back_ios_sharp,size: 28,color: Color.fromRGBO(255, 75, 75, 1.0),)),
            Container(
                margin: EdgeInsets.only(left: 10),
                child: Text("Upload",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),)),
            InkWell(
              onTap: (){
                Get.toNamed("/login");
              },
              child: Container(
                padding: EdgeInsets.only(left: 15,bottom: 8,top: 8,right: 15),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Text("Post",style: GoogleFonts.montserrat(textStyle : TextStyle(
                  color: Colors.white

                )),),
              )
            )
          ],
        )
    );
  }
  mainscreen(double width, BuildContext context, int i) {

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Header(width),
          SizedBox(height: 20,),
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        WidgetSize(
                          onChange: (Size size){
                            setState(() {
                              widget.size2 = size.width.toDouble();
                            });


                          },
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                widget.vi = true;
                                widget.hiz = false;
                              });

                            },
                            child: Text("3:4 (vertical)"),
                          ),
                        ),
                        Visibility(
                          visible: widget.vi == true ? true : false ,
                          child: Container(
                            margin: EdgeInsets.only(top: 5),
                            width: widget.size,
                            height: 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 15,),
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      width: 5, height: 20,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)
                      ),

                    ),
                    SizedBox(width: 15,),
                    Column(
                      children: [
                        WidgetSize(
                          onChange: (Size size){
                            setState(() {
                              widget.size = size.width.toDouble();
                            });


                          },
                          child: InkWell(
                            onTap: (){

                              setState(() {
                                widget.vi = false;
                                widget.hiz = true;

                              });

                            },
                            child: Text("4:3 (horizontal)"),
                          ),
                        ),
                        Visibility(
                          visible: widget.hiz == true ? true : false ,
                          child: Container(
                            margin: EdgeInsets.only(top: 5),
                            width: widget.size,
                            height: 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                if(widget.vi == true)...[
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    width: width * 0.9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Stack(
                        children: [

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              WidgetSize(onChange: (Size size){
                                widget.thumbnail1 = size.height.toDouble();
                              },
                                child: Container(
                                  width: width*0.6,
                                  child: AspectRatio(
                                    aspectRatio: 3/4,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network("https://images.unsplash.com/photo-1622434641406-a158123450f9?q=80&w=2048&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",fit: BoxFit.cover),
                                    ),
                                  ),
                                ),

                              ),
                              Expanded(
                                child: Container(
                                  height:  widget.thumbnail1,
                                  margin: EdgeInsets.only(left: 10),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom:width*0.02),
                                          width: width*0.28,
                                          child: AspectRatio(
                                            aspectRatio: 3/4,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.network("https://images.unsplash.com/photo-1622434641406-a158123450f9?q=80&w=2048&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",fit: BoxFit.cover,),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom:width*0.02),
                                          width: width*0.28,
                                          child: AspectRatio(
                                            aspectRatio: 3/4,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.network("https://images.unsplash.com/photo-1622434641406-a158123450f9?q=80&w=2048&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",fit: BoxFit.cover,),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom:width*0.02),
                                          width: width*0.28,
                                          child: AspectRatio(
                                            aspectRatio: 3/4,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.network("https://images.unsplash.com/photo-1622434641406-a158123450f9?q=80&w=2048&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",fit: BoxFit.cover,),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(left: 10,top: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                color: Colors.black38,
                                offset: Offset(1,1),
                                spreadRadius: 1,
                                blurRadius: 1
                              )]
                            ),
                            child: Icon(Icons.edit_rounded),
                          ),
                        ],
                      ),
                    ),
                  )

                ]else...[
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    width: width * 0.9,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => imageManagerHorizontal()),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                WidgetSize(onChange: (Size size){
                                  widget.thumbnail = size.width.toDouble();
                                },
                                  child: Container(
                                    width: width*0.9,
                                    child: AspectRatio(
                                      aspectRatio: 4/3,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network("https://images.unsplash.com/photo-1622434641406-a158123450f9?q=80&w=2048&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),

                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right:width*0.01),
                                          width: width*0.3,
                                          child: AspectRatio(
                                            aspectRatio: 4/3,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.network("https://images.unsplash.com/photo-1622434641406-a158123450f9?q=80&w=2048&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",fit: BoxFit.cover,),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right:width*0.01),
                                          width: width*0.3,
                                          child: AspectRatio(
                                            aspectRatio: 4/3,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.network("https://images.unsplash.com/photo-1622434641406-a158123450f9?q=80&w=2048&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",fit: BoxFit.cover,),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(right:width*0.01),
                                          width: width*0.3,
                                          child: AspectRatio(
                                            aspectRatio: 4/3,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.network("https://images.unsplash.com/photo-1622434641406-a158123450f9?q=80&w=2048&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",fit: BoxFit.cover,),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(left: 10,top: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black38,
                                        offset: Offset(1,1),
                                        spreadRadius: 1,
                                        blurRadius: 1
                                    )]
                              ),
                              child: Icon(Icons.edit_rounded),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: width*0.9,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                          color: Colors.black38,
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                          offset: Offset(0,0)
                      )],
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
                              hintText: "Product title",
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
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                          color: Colors.black38,
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                          offset: Offset(0,0)
                      )],
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    children: [
                      Container(
                          width: width*0.4,
                          child:   Autocomplete<String>(
                            optionsBuilder: (TextEditingValue textEditingValue) {
                              if (textEditingValue.text == '') {
                                return Data.category;
                              }
                              return Data.category.where((element) {
                                return element.contains(textEditingValue.text.toLowerCase());
                              }
                              );
                            },
                            fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                              return TextFormField(
                                controller: textEditingController,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                                    border: InputBorder.none,
                                    prefixIconColor: Colors.black,
                                    hintText: 'Category',
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

                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: width*0.9,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                          color: Colors.black38,
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                          offset: Offset(0,0)
                      )],
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width*0.6,
                        child: TextField(
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            decoration: const InputDecoration(
                              enabled: true,
                              hintText: "Price",
                              contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                              border: InputBorder.none,
                              prefixIconColor: Colors.black,
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: FlutterSwitch(
                          width: 50.0,
                          height: 30.0,
                          valueFontSize: 25.0,
                          toggleSize: 25.0,
                          value: status2,
                          activeColor: Colors.black,
                          inactiveColor: Colors.black12,
                          inactiveToggleColor: Colors.black,
                          activeToggleColor: Colors.white,
                          borderRadius: 30.0,
                          showOnOff: false,
                          onToggle: (val) {
                            setState(() {
                              status2 = val;
                            });
                          },
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
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                          color: Colors.black38,
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                          offset: Offset(0,0)
                      )],
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width*0.6,
                        child: TextField(
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            decoration: const InputDecoration(
                              enabled: true,
                              hintText: "Discount Price",
                              contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                              border: InputBorder.none,
                              prefixIconColor: Colors.black,
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: FlutterSwitch(
                          width: 50.0,
                          height: 30.0,
                          valueFontSize: 25.0,
                          toggleSize: 25.0,
                          value: status,
                          activeColor: Colors.black,
                          inactiveColor: Colors.black12,
                          inactiveToggleColor: Colors.black,
                          activeToggleColor: Colors.white,
                          borderRadius: 30.0,
                          showOnOff: false,
                          onToggle: (val) {
                            setState(() {
                              status = val;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width*0.9,
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 15,right: 15,bottom: 8,top: 8),
                        decoration: BoxDecoration(
                          color: widget.isImageDES == false ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: WidgetSize(
                          onChange: (Size size){
                            setState(() {
                              widget.size2 = size.width.toDouble();
                            });


                          },
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                widget.isImageDES = false;
                              });

                            },
                            child: Text("Text Description",style: GoogleFonts.montserrat(textStyle : TextStyle(
                              color: widget.isImageDES != false ? Colors.black : Colors.white,
                              fontSize: 10
                            )),),
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Container(
                        margin: EdgeInsets.only(top: 2),
                        width: 5, height: 30,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)
                        ),

                      ),
                      SizedBox(width: 15,),
                      Container(
                        padding: EdgeInsets.only(left: 15,right: 15,bottom: 8,top: 8),
                        decoration: BoxDecoration(
                            color: widget.isImageDES != false ? Colors.black : Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: WidgetSize(
                          onChange: (Size size){
                            setState(() {
                              widget.size2 = size.width.toDouble();
                            });


                          },
                          child: InkWell(
                            onTap: (){
                              setState(() {

                                widget.isImageDES = true;
                              });

                            },
                            child: Text("Image Description",style: GoogleFonts.montserrat(textStyle : TextStyle(
                                color: widget.isImageDES == false ? Colors.black : Colors.white,
                              fontSize: 10
                            )),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if(widget.isImageDES == false)...[
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: width*0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                            color: Colors.black38,
                            blurRadius: 0.5,
                            spreadRadius: 0.5,
                            offset: Offset(0,0)
                        )],
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: width*0.89,
                          margin: EdgeInsets.only(top: 15),
                          child: TextField(
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              maxLines: 15,
                              decoration: const InputDecoration(
                                enabled: true,
                                hintText: "Description",
                                contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                                border: InputBorder.none,
                                prefixIconColor: Colors.black,
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ]else...[
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: width*0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                            color: Colors.black38,
                            blurRadius: 0.5,
                            spreadRadius: 0.5,
                            offset: Offset(0,0)
                        )],
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: width*0.89,
                          margin: EdgeInsets.only(top: 15),
                          child: TextField(
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              maxLines: 5,
                              decoration: const InputDecoration(
                                enabled: true,
                                hintText: "Short Description",
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
                    width: width*0.9,
                    margin: EdgeInsets.only(top: 15),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network("https://i.ibb.co/Hh8RLKJ/Facebook-image-sizes.png")),
                  )

                ],
                SizedBox(height: 150,)
              ],
            ),
          ) )
        ],

      ),
    );

  }
}
