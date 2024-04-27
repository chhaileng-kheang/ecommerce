import 'dart:convert';

import 'package:ecomerce/changeEmail.dart';
import 'package:ecomerce/changePassword.dart';
import 'package:ecomerce/delivery/customerinfo.dart';
import 'package:ecomerce/delivery/dvHome.dart';
import 'package:ecomerce/delivery/payment.dart';
import 'package:ecomerce/delivery/storepayment.dart';
import 'package:ecomerce/delivery/trackdetail.dart';
import 'package:ecomerce/delivery/trackinglist.dart';
import 'package:ecomerce/detail.dart';
import 'package:ecomerce/editStore.dart';
import 'package:ecomerce/login.dart';
import 'package:ecomerce/merchant.dart';
import 'package:ecomerce/productOwn.dart';
import 'package:ecomerce/profileSetting.dart';
import 'package:ecomerce/qrscanner.dart';
import 'package:ecomerce/searchPage.dart';
import 'package:ecomerce/signup.dart';
import 'package:ecomerce/store.dart';
import 'package:ecomerce/subcription.dart';
import 'package:ecomerce/uploadProduct.dart';
import 'package:ecomerce/viewimg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:http/http.dart' as http;
import 'detail_store.dart';
import 'home.dart';
import 'classobject/staticdata.dart';
import 'mobile.dart';
void main() {
  setPathUrlStrategy();
  runApp(
    GetMaterialApp(
      color: Colors.white,
        defaultTransition: Transition.noTransition, //this would be the solution
        transitionDuration: Duration(seconds: 0),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=>MyApp()),
        GetPage(name: '/product', page: ()=>detail()),
        GetPage(name: '/productstore', page: ()=>detail_store()),
        GetPage(name: '/store', page: ()=>store()),
        GetPage(name: '/search', page: ()=>search()),
        GetPage(name: '/login', page: ()=>login()),
        GetPage(name: '/signup', page: ()=>signup()),
        GetPage(name: '/merchant', page: ()=>merchant()),
        GetPage(name: '/storelist', page: ()=>search()),
        GetPage(name: "/profilesetting", page:()=> profileSetting()),
        GetPage(name: "/editinfo", page:()=> editStore()),
        GetPage(name: "/changepassword", page:()=> changePassword1()),
        GetPage(name: "/uploadproduct", page:()=> uploadProduct()),
        GetPage(name: "/subscription", page:()=> subscrption()),
        GetPage(name: "/delivery", page:()=> dvHome()),
        GetPage(name: "/productOwner", page:()=> detailOwn()),
        GetPage(name: "/emailchange", page:()=> changeEmail()),
        GetPage(name: "/customerinfo", page:()=> customerInfo()),
        GetPage(name: "/imgview", page:()=> viewImg()),
        GetPage(name: "/trackinglist", page:()=> trackinglist()),
        GetPage(name: "/tracking", page:()=> trackDetail()),
        GetPage(name: "/deliverypayment", page:()=> paymentDelivery()),
        GetPage(name: "/storepayment", page:()=> paymentStore()),
        GetPage(name: "/qrscanner", page:()=> qrCam()),





      ],
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EC Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          cardTheme: CardTheme(
            surfaceTintColor: Colors.white,
          ),
          textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme)
      ),
      home: const homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  mobile(),
      ),
    );

  }
}



