import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class web extends StatelessWidget {
  const web({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: const Color(0xFF251901),
      body:  SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          child: Stack(
            children: [
              Positioned(
                  top: 30,
                  left: 30,
                  child: Text("APP-Name",style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
                  ))),
              Positioned(
                  top: 30,
                  right: 30,
                  child: Row(
                    children: [
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                          backgroundColor: Colors.transparent,
                          shape: const StadiumBorder(
                            side: BorderSide(
                              color: Colors.white,
                              width: 2
                            )
                          )
                        ),
                        onPressed: (){},
                        child: Row(
                          children: [
                            const Icon(Icons.font_download,color: Colors.white),
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: Text("App Store",style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w400),
                              )),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10,),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                            backgroundColor: Colors.transparent,
                            shape: const StadiumBorder(
                                side: BorderSide(
                                    color: Colors.yellow,
                                    width: 2
                                )
                            )
                        ),
                        onPressed: (){},
                        child: Row(
                          children: [
                            const Icon(Icons.play_circle_outline,color: Colors.yellow),
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: Text("Play Store",style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(color: Colors.yellow,fontSize: 16,fontWeight: FontWeight.w400),
                              )),
                            ),
                          ],
                        ),
                      ),
        
                    ],
                  )),
              Center(
                child: Stack(
                  children: [
        
        
                    Container(
                      width: 700,
                      child: Column(
                        children: [
                          Image.asset("asset/logo.png",height: 700,   width: 600,fit: BoxFit.contain),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 600),
                      child: Column(
                        children: [
                          Container(
                              child: Text("Best Thing Bring for cambodian's Business",style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.bold)
                              ),
                              )
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 40),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(padding: const EdgeInsets.only(top: 30,bottom: 30,left: 20,right: 20), backgroundColor: Colors.orange) ,
                            child: Text("Explore Mobile Experience now",style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
                            ),),
                            onPressed: (){},
                          ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 40),
                              child: Text("What We Are?",style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.bold)
                              ),
                              )
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width*0.4,
                              margin: EdgeInsets.only(top: 10,left: MediaQuery.sizeOf(context).width*0),
                              child: Text("We are a dynamic e-commerce platform facilitating seamless market transactions. Empowering businesses, we offer a user-friendly interface, secure payment solutions, and a diverse marketplace to showcase products. Elevate your online presence with our comprehensive tools, driving success and connectivity in the digital marketplace.",
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w200),
                              ),textAlign: TextAlign.center,
                              )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
