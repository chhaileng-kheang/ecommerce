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
          DrawerHeader(
            decoration: const BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('https://images.unsplash.com/photo-1528698827591-e19ccd7bc23d?q=80&w=2676&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'))
            ),
            child: Text(
              'Chhaileng',
              style: TextStyle(fontSize: 25,
                foreground: Paint()
                  ..strokeWidth = 2
                  ..color = Colors.white
                  ..style = PaintingStyle.stroke,
                shadows: const <Shadow>[
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 5.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 5.0,
                  color: Color.fromARGB(125, 0, 0, 0),
                ),
              ],),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.exit_to_app,color: Colors.red),
            title: const Text('Logout',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800)),
            onTap: () => {Navigator.of(context).pop()},
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: MediaQuery.sizeOf(context).width,
              child: Center(child: Text("Categories",style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w800,color: Colors.black),)))
        ],
      ),
    );
  }
}