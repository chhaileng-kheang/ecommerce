import 'package:flutter/material.dart';
class viewimg extends StatelessWidget {
  viewimg({super.key, required this.img});
  String img;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        color: Colors.black,
      child: Image.network(img,fit: BoxFit.cover,),
      ),
    );
  }
}
