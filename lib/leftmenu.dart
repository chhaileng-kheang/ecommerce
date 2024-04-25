import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Drawer(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0)
      ),

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
    );
  }
}