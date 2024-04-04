import 'dart:convert';
import 'package:ecomerce/createmerchant.dart';
import 'package:ecomerce/merchant.dart';
import 'package:ecomerce/signup.dart';
import 'package:ecomerce/staticdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class login extends StatefulWidget {
  const login({super.key});
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  final String apiUrl = Data.ip + "/eiivanapiserver/loginuser.php";
  bool islogin = false;
  final TextEditingController usernametxt = TextEditingController();
  final TextEditingController passwordtxt = TextEditingController();
  late IconData icondata =  Icons.remove_red_eye_outlined;
  late bool view = false;
  Future<List<dynamic>> postData(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'accesstoken_auth': '0cB!d*oKx291-D8%D&Ji+a2I!KcqSJn\$-#ns2j2%lmowH2H1NjdK3*jd2n3sd3xHS291e+uj2^!dfcfh-*hjd\$8#dhbhc-)uAh+!@lJ7-#LzV4jx%1k!k1ow-#ns2j2%9e+ujf\$8#df='
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        islogin = true;
        final responseBody = jsonDecode(response.body);
        final singleValue = responseBody['data'] as List<dynamic>;
        return singleValue;


      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to post data');
      }
    } catch (error) {
      throw Exception('Failed to post data: $error');
    }
  }

  Widget build(BuildContext context) {
    double width;

    return SafeArea(
        child: Scaffold(
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
    )
    );
  }

  mainscreen(double width, BuildContext context,int g){
    double height = MediaQuery.sizeOf(context).height;
    return Container(
      height: height,
      width: width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                    ),
                  ),
                  Positioned(
                    top: 100,
                    child: Hero(
                      tag: "heads",
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network("https://plus.unsplash.com/premium_photo-1661914978519-52a11fe159a7?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",fit: BoxFit.cover,),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              width: width *0.9,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: "text",
                    child: Text("Login",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w500
                    )

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
                              controller: usernametxt,
                              decoration: const InputDecoration(
                                enabled: true,
                                hintText: "Username",
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
                    margin: const EdgeInsets.only(top: 15),
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

                              obscureText: view == true ? true : false,
                              controller: passwordtxt,
                              decoration: const InputDecoration(
                                enabled: true,
                                hintText: "Password",
                                contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                                border: InputBorder.none,
                                prefixIconColor: Colors.black,
                              )
                          ),
                        ),
                        InkWell(
                            onTap: (){
                           setState(() {
                             if(view == true){
                               icondata = Icons.remove_red_eye_sharp;
                               view = false;
                             }else{
                               view = true;
                               icondata = Icons.remove_red_eye_outlined;
                             }
                           });
                            },
                            child: Icon(icondata))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    width: width*0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: ElevatedButton(onPressed: () async{

                            if(usernametxt.text.isNotEmpty && passwordtxt.text.isNotEmpty){
                              final responseData = await postData(usernametxt.text.trim().toLowerCase(),passwordtxt.text);
                              for (var data in responseData) {
                                if(data["loginAccess"].toString() == "successfully"){
                                  Get.toNamed("/merchant");
                                }else {
                                  Get.snackbar(
                                      'Login Failed', // SnackBar title
                                      'Incorrect Password/Username', // SnackBar message
                                      snackPosition: SnackPosition.BOTTOM, // SnackBar position
                                      backgroundColor: Colors.grey, // SnackBar background color
                                      colorText: Colors.white, // SnackBar text color
                                      margin: EdgeInsets.only(bottom: 20,left: 20,right: 20)
                                  );

                                }
                              }
                            }

                          }, child: Text("Login",style: TextStyle(color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.only(left: 50,right: 50),
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)
                            )
                          ),),
                        ),
                        Text("Forgot Password!")
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 80),
                    width: width*0.9,
                    child: Column(

                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => signup()),
                            );
                          },
                          child: Text("Create New Account!",style: GoogleFonts.montserrat(textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14

                          )),),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30,bottom: 30),
                          width: 5,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => merchantReg()),
                            );
                          },
                          child: Text("Register As Merchant!",style: GoogleFonts.montserrat(textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14

                          )),),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            )

          ],
        ),
      ),
    );

  }
}
