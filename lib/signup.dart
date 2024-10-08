import 'package:ecomerce/classobject/staticdata.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class signup extends StatefulWidget {
  signup({super.key});
  @override
  State<signup> createState() => _signupState();

}

class _signupState extends State<signup> {
  @override
  Color b_color = Colors.white;
  Widget build(BuildContext context) {
    late double width;

    return SafeArea(
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
    );
  }
  mainscreen(double width, BuildContext context, int g) {

    return  Column(
      children: [
        SizedBox(
          height: 150,
          child: Stack(
            children: [
              Container(
                height: 100,
                width: MediaQuery.sizeOf(context).width,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                ),
              ),
              Positioned(
                top: 50,
                child: Hero(
                  tag: "heads",
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,width: 100,
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
          margin: const EdgeInsets.only(top: 15,bottom: 30),
          child: Hero(
              tag: "text",
              child: Text("Create New Account",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w500
                  )

              ),
        ),
        ),
        Expanded(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height - 300,
            child: SingleChildScrollView(
              child:Column(
                children: [
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
                        SizedBox(
                          width: width*0.8,
                          child: TextField(
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
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
                    margin: const EdgeInsets.only(top: 10),
                    width: width*0.9,
                    height: 45,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(234, 234, 234, 1.0),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width*0.8,
                          child: TextField(
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              decoration: const InputDecoration(
                                enabled: true,
                                hintText: "Phone Number",
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
                    margin: const EdgeInsets.only(top: 10),
                    width: width*0.9,
                    height: 45,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(234, 234, 234, 1.0),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                            width: width*0.8,
                            child:   Autocomplete<String>(
                              optionsBuilder: (TextEditingValue textEditingValue) {
                                List<String> suggest_s = [];
                                if (textEditingValue.text == '') {
                                  return const Iterable<String>.empty();
                                }
                                suggest_s.clear();
                                if(!textEditingValue.text.contains("@")) {
                                  for (String i in Data.suggest) {
                                    suggest_s.add(textEditingValue.text + i);
                                  }
                                  return suggest_s;
                                }else{
                                  return const Iterable<String>.empty();
                                }
                              },
                              fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                                return TextFormField(
                                  controller: textEditingController,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                                      border: InputBorder.none,
                                      prefixIconColor: Colors.black,
                                      hintText: 'E-Mail',
                                      hintStyle: GoogleFonts.montserrat(
                                          fontSize: 14
                                      )
                                  ),
                                  focusNode: focusNode,
                                  onFieldSubmitted: (String value) {
                                    onFieldSubmitted();
                                    print('You just typed a new entry  $value');
                                  },
                                );
                              },
                              onSelected: (String selection) {
                                print('You just selected $selection');
                              },
                            )
                        ),
                      ],
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
                        SizedBox(
                          width: width*0.8,
                          child: TextField(
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              obscureText: true,
                              decoration: const InputDecoration(
                                enabled: true,
                                hintText: "Password",
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
                    margin: const EdgeInsets.only(top: 10),
                    width: width*0.9,
                    height: 45,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(234, 234, 234, 1.0),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width*0.8,
                          child: TextField(
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              obscureText: true,
                              decoration: const InputDecoration(
                                enabled: true,
                                hintText: "Re-enter Password",
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
                    margin: const EdgeInsets.only(top: 10),
                    width: width*0.9,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(234, 234, 234, 1.0),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width*0.8,
                          child: TextField(
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              maxLines: 3,
                              decoration: const InputDecoration(
                                enabled: true,
                                hintText: "Address",
                                contentPadding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                border: InputBorder.none,
                                prefixIconColor: Colors.black,
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: width*0.9,
                    height: 45,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(234, 234, 234, 1.0),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          width: width*0.5,
                          child: TextField(
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              decoration: const InputDecoration(
                                enabled: true,
                                hintText: "OTP (Send to Email)",
                                contentPadding: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 10),
                                border: InputBorder.none,
                                prefixIconColor: Colors.black,
                              )
                          ),
                        ),
                        Container(
                          width:  width*0.3,
                          padding: const EdgeInsets.only(left: 25,right: 25,top: 15,bottom: 15),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Center(
                            child: Text(
                              "Get Code",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.white)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: width*0.9,
                    height: 45,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Container(
                                  margin: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child:  InkWell(
                                    onTap: (){
                                      setState(() {
                                        if(b_color == Colors.black){
                                          b_color = Colors.white;
                                        }else{
                                          b_color = Colors.black;
                                        }

                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: b_color,
                                        borderRadius: BorderRadius.circular(100),
                                      ),

                                    ),
                                  ),
                                )
                            ),
                            const SizedBox(width: 10,),
                            const Text("Agree Policy and Term of Use")
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width:  width*0.9,
                    padding: const EdgeInsets.only(left: 25,right: 25,top: 15,bottom: 15),
                    margin: const EdgeInsets.only(left: 5,top: 5),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(
                      child: Text(
                        "Sing Up",
                        style: GoogleFonts.montserrat(textStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100,)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
