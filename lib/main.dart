import 'package:ecomerce/changePassword.dart';
import 'package:ecomerce/detail.dart';
import 'package:ecomerce/editStore.dart';
import 'package:ecomerce/login.dart';
import 'package:ecomerce/merchant.dart';
import 'package:ecomerce/profileSetting.dart';
import 'package:ecomerce/searchPage.dart';
import 'package:ecomerce/signup.dart';
import 'package:ecomerce/store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_strategy/url_strategy.dart';
import 'home.dart';
import 'staticdata.dart';
import 'mobile.dart';
import 'web.dart';
void main() {
  setPathUrlStrategy();
  runApp(
    GetMaterialApp(
        defaultTransition: Transition.noTransition, //this would be the solution
        transitionDuration: Duration(seconds: 0),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=>MyApp()),
        GetPage(name: '/product', page: ()=>detail()),
        GetPage(name: '/store', page: ()=>store()),
        GetPage(name: '/search', page: ()=>search()),
        GetPage(name: '/login', page: ()=>login()),
        GetPage(name: '/signup', page: ()=>signup()),
        GetPage(name: '/merchant', page: ()=>merchant()),
        GetPage(name: '/storelist', page: ()=>search()),
        GetPage(name: "/profilesetting", page:()=> profileSetting()),
        GetPage(name: "/editinfo", page:()=> editStore()),
        GetPage(name: "/changepassword", page:()=> changePassword1()),





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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  mobile(),
      ),
    );

  }
}



