import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  bool status = false;
  late ProductController controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {

    return Drawer(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0)
      ),

      child: GetBuilder<ProductController>(
        builder: (_) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 45,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Show Hidden Price",
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(fontSize: 14),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Tooltip(
                              showDuration: Duration(seconds: 5),
                              margin: EdgeInsets.only(left: 10, right: 10),
                              triggerMode: TooltipTriggerMode.tap,
                              message: "ប្រើសម្រាប់ បើកឬបិទ ផលិតផលដែលមិនបង្អាញតម្លៃ",
                              child: Icon(Icons.info_outline),
                            ),
                          ),
                        ],
                      ),
                      FlutterSwitch(
                        width: 50.0,
                        height: 30.0,
                        valueFontSize: 25.0,
                        toggleSize: 25.0,
                        value:  controller.status,
                        activeColor: Colors.black,
                        inactiveColor: Colors.black12,
                        inactiveToggleColor: Colors.black,
                        activeToggleColor: Colors.white,
                        borderRadius: 30.0,
                        showOnOff: false,
                        onToggle: (val) {
                          setState(() {
                            if(controller.status == false){
                              controller.status = true;
                            }else{
                              controller.status = false;
                            }
                            controller.update();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.sizeOf(context).height -100,
                  width: MediaQuery.sizeOf(context).width,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children:[


                      Container(
                          margin: EdgeInsets.only(top: 30),
                          width: MediaQuery.sizeOf(context).width,
                          child: Center(child: Text("Categories",style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w800,color: Colors.black),))),
                      Container(
                        height: 3,
                        width:10,
                        margin: EdgeInsets.only(left: 50,right: 50,top: 12),
                        decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(50)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      )
    );
  }
}