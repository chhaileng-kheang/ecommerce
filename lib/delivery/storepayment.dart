import 'package:ecomerce/delivery/withdraw.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class paymentStore extends StatelessWidget {
  const paymentStore({super.key});

  @override
  Widget build(BuildContext context) {
    double width;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
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
}
Header(double width,context) {
  return Container(
      color: Colors.white,
      height: 50,
      padding: const EdgeInsets.only(left: 15,right: 15,top: 10,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.close,size: 28,color: Colors.black,)),
          Text("Balance",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16)),),
          InkWell(
            onTap: (){
              Get.toNamed("/login");
            },
            child: SizedBox(width: 30,)
          )
        ],
      )
  );
}
mainscreen(double width, BuildContext context, int g) {
  return Container(
    child: Column(
      children: [
        Header(width, context),
        balancecard(width,context,"Vetana","275.00"),
        Expanded(child: Container(height: MediaQuery.sizeOf(context).height - 200,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15,),
              Container(
                height: 1,
                width: width*0.9,
                color: Colors.grey,
              ),
              history(width,context,"300","12/05/2025 - 12:00AM","pending"),
              history(width,context,"300","12/05/2025 - 12:00AM","failed"),
              history(width,context,"500","12/05/2025 - 12:00AM","success"),
              history(width,context,"100","12/05/2025 - 12:00AM","success"),
              history(width,context,"200","12/05/2025 - 12:00AM","success"),
              history(width,context,"600","12/05/2025 - 12:00AM","success"),
              history(width,context,"200","12/05/2025 - 12:00AM","success"),
              history(width,context,"800","12/05/2025 - 12:00AM","success"),
              history(width,context,"100","12/05/2025 - 12:00AM","failed"),
              history(width,context,"900","12/05/2025 - 12:00AM","failed"),
              history(width,context,"500","12/05/2025 - 12:00AM","success"),
              history(width,context,"400","12/05/2025 - 12:00AM","success"),
              history(width,context,"200","12/05/2025 - 12:00AM","success"),
              history(width,context,"200","12/05/2025 - 12:00AM","success"),
              history(width,context,"100","12/05/2025 - 12:00AM","success"),
              SizedBox(height: 50,)

            ],
          ),
        ),
        ))

      ],
    ),
  );

}

history(double width, BuildContext context,String price, String dt, String status) {
  return Container(
    width: width*0.9,
    child: Column(
      children: [

        Container(
          padding: EdgeInsets.only(top: 10,bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$$price",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 16))),
              Text("$dt",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 12)))

            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              status == "success"
                  ? Text("$status",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.green,fontWeight: FontWeight.w400,fontSize: 14)))
                  : status == "failed"
                    ? Text("$status",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.red,fontWeight: FontWeight.w400,fontSize: 14)))
                    : Text("$status",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.orange,fontWeight: FontWeight.w400,fontSize: 14))),
            ],
        ),
        ),
        SizedBox(height: 10,),
        Container(
          height: 1,
          width: width,
          color: Colors.grey,
        ),
      ],
    ),
  );
}

balancecard(double width, BuildContext context, String name, String balance) {
  return Container(
      width: width,
      padding: EdgeInsets.only(bottom: 20),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 200,
          width: width*0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
              gradient:  LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(8, 24, 51, 1.0),
                  Color.fromRGBO(16, 67, 114, 1.0),

                ],
              )
          ),
          child: Stack(
            children: [
              Positioned(
                  top: 20,
                  left: 30,
                  child: Text("APP_Name",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),)),
              Positioned(
                  bottom: 20,
                  left: 30,
                  right: 20,
                  child:   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Balance : ",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 12)),),
                          SizedBox(width: 3,),
                          Text("\$500.00",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold,fontSize: 14)))
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => withdraw(),));
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 15,right: 15,bottom: 10,top: 10),
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child:  Text("Withdraw",style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12))),),
                      )
                    ],
                  ),
              ),
              Positioned(
                  top: 70,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Account Number (ABA)",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 10)),),
                          SizedBox(width: 10,),
                          Text("100 991 990",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 12)),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text("Account Holder Name",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 10)),),
                          SizedBox(width: 10,),
                          Text("Vong Vothana",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 12)),),
                        ],
                      ),
                    ],
                  )
        ),
            ],
          ),
        ),
      ],
    ),
  );
}
