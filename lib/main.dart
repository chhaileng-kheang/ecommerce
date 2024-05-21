
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
import 'package:ecomerce/prmoteLink.dart';
import 'package:ecomerce/productOwn.dart';
import 'package:ecomerce/profileSetting.dart';
import 'package:ecomerce/qrscanner.dart';
import 'package:ecomerce/searchPage.dart';
import 'package:ecomerce/signup.dart';
import 'package:ecomerce/store.dart';
import 'package:ecomerce/subcription.dart';
import 'package:ecomerce/uploadProduct.dart';
import 'package:ecomerce/viewimg.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_strategy/url_strategy.dart';
import 'detail_store.dart';
import 'leading/leadingPage.dart';
import 'mobile.dart';
void main() {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(
      GetMaterialApp(
        color: Colors.white,
        defaultTransition: Transition.noTransition, //this would be the solution
        transitionDuration: const Duration(seconds: 0),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: [


          if (!kIsWeb) ...[
            GetPage(name: '/', page: () => const MyApp()),
            GetPage(name: '/product', page: ()=>detail()),
            GetPage(name: '/productstore', page: ()=>detail_store()),
            GetPage(name: '/store', page: ()=>store()),
            GetPage(name: '/search', page: ()=>const search()),
            GetPage(name: '/login', page: ()=>const login()),
            GetPage(name: '/signup', page: ()=>signup()),
            GetPage(name: '/merchant', page: ()=>merchant()),
            GetPage(name: '/storelist', page: ()=>const search()),
            GetPage(name: "/profilesetting", page:()=> const profileSetting()),
            GetPage(name: "/editinfo", page:()=> editStore()),
            GetPage(name: "/changepassword", page:()=> const changePassword1()),
            GetPage(name: "/uploadproduct", page:()=> uploadProduct()),
            GetPage(name: "/subscription", page:()=> subscrption()),
            GetPage(name: "/delivery", page:()=> const dvHome()),
            GetPage(name: "/productOwner", page:()=> const detailOwn()),
            GetPage(name: "/emailchange", page:()=> changeEmail()),
            GetPage(name: "/customerinfo", page:()=> const customerInfo()),
            GetPage(name: "/imgview", page:()=> viewImg()),
            GetPage(name: "/trackinglist", page:()=> const trackinglist()),
            GetPage(name: "/tracking", page:()=> const trackDetail()),
            GetPage(name: "/deliverypayment", page:()=> const paymentDelivery()),
            GetPage(name: "/storepayment", page:()=> const paymentStore()),
            GetPage(name: "/qrscanner", page:()=> const qrCam()),
            GetPage(name: '/contact', page: () => const promoteLink()),
          ]else...[
             GetPage(name: '/', page: () => leadingPage()),
            GetPage(name: '/contact', page: () => const promoteLink()),
          ],

          // Redirect web routes to leading page

        ],

      )
  ));


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
          cardTheme: const CardTheme(
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



