import 'package:ecomerce/classobject/staticdata.dart';
import 'package:ecomerce/uploadimage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
class customerInfo extends StatefulWidget {
  const customerInfo({super.key});

  @override
  State<customerInfo> createState() => _customerInfoState();
}

class _customerInfoState extends State<customerInfo> {
  @override
  Color b_color = Colors.white;

  var status = false;
  Widget build(BuildContext context) {
    late double width;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(
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
      ),
    );
  }
  mainscreen(double width, BuildContext context, int g) {

    return  Container(
      height: MediaQuery.sizeOf(context).height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 240,
              child: Stack(
                children: [
                  Container(
                    height: 170,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        color: Colors.black,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width:  width*0.85,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.arrow_back_ios,color: Colors.white,),
                                SizedBox(width: 10,),
                                Container(
                                    child: Text("Add Delivery Package",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white)),)),
                              ],
                            )),

                        SizedBox(height: 20,),
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 150,width: width*0.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 0.5,
                                      offset: Offset(0,0),
                                      blurRadius: 0.5
                                    )
                                  ]
                                ),
                                child: Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.location_on_rounded,color: Colors.redAccent,),
                                              Container(
                                                margin: EdgeInsets.only(top: 10,left: 10),
                                                width: width*0.5,
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(243, 243, 243, 1.0),
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
        
                                                child: Text("Location A"),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              Icon(Icons.my_location_outlined,color: Colors.blueAccent,),
                                              Container(
                                                margin: EdgeInsets.only(top: 10,left: 10),
                                                width: width*0.5,
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: Color.fromRGBO(243, 243, 243, 1.0),
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
        
                                                child: Text("Location B"),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(width: 10,),
                                      Icon(Icons.swap_vert,color: Colors.black,size: 32,)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: width*0.9,
                  height: 45,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(234, 234, 234, 1.0),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width*0.75,
                        child: TextField(
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            decoration: const InputDecoration(
                              enabled: true,
                              hintText: "Receiver's Name",
                              contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                              border: InputBorder.none,
                              prefixIconColor: Colors.black,
                            )
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Icon(Icons.contact_page_sharp)
                      )
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
                                fontSize: 14,
                              ),
                            ),
                            decoration: const InputDecoration(
                              enabled: true,
                              hintText: "Telegram",
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: width*0.75,
                        child: TextField(
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            decoration: const InputDecoration(
                              enabled: true,
                              hintText: "Phone Number",
                              contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                              border: InputBorder.none,
                              prefixIconColor: Colors.black,
                            )
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Icon(Icons.add_circle,color: Colors.black,)
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: width*0.9,
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(234, 234, 234, 1.0),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5,bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 20),
                                width: width*0.5,
                                child: Text("051487541")
                            ),
                            Container(
                                margin: EdgeInsets.only(right: 15),
                                child: Icon(Icons.remove_circle_outlined,color: Colors.black,)
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5,bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 20),
                                width: width*0.5,
                                child: Text("051487541")
                            ),
                            Container(
                                margin: EdgeInsets.only(right: 15),
                                child: Icon(Icons.remove_circle_outlined,color: Colors.black,)
                            )
                          ],
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
                        padding: EdgeInsets.only(top: 10),
                        width: width*0.8,
                        child: TextField(
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            maxLines: 3,
                            decoration: const InputDecoration(
                              enabled: true,
                              hintText: "Note",
                              contentPadding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
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
                                fontSize: 14,
                              ),
                            ),
                            obscureText: true,
                            decoration: const InputDecoration(
                              enabled: true,
                              hintText: "Weight (KG)",
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
                  margin: EdgeInsets.only(top: 15),
                  width: width*0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Photo of Product"),
                      Icon(Icons.add_box_outlined,color: Colors.black,size: 48,),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: width*0.9,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0,right: 0 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text("Save Customer", style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 12,
                              ),
                            ),),
                            SizedBox(width: 10,),
                            FlutterSwitch(
                              width: 40.0,
                              height: 25.0,
                              valueFontSize: 15.0,
                              toggleSize: 15.0,
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
                          ],
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 0, right: 0),
                            child: Tooltip(
                                showDuration: Duration(seconds: 5),
                                margin: EdgeInsets.only(left: 10, right: 10),
                                triggerMode: TooltipTriggerMode.tap,
                                message: "មុខងារ Save Customer សម្រាប់តែសមាជិក Premium ឡើងទៅតែប៉ុណ្ណោះ",
                                child: Icon(Icons.info_outline))),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => uploadImage()),
                    );
                  },
                  child: Container(
                    width:  width*0.9,
                    padding: EdgeInsets.only(left: 25,right: 25,top: 15,bottom: 15),
                    margin: EdgeInsets.only(left: 5,top: 10),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(
                      child: Text(
                        "Booking",
                        style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
