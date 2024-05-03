import 'package:ecomerce/merchanttab.dart';
import 'package:ecomerce/storelist.dart';
import 'package:ecomerce/whitelist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'home.dart';
class mobile extends StatelessWidget {
  mobile({super.key});
  late double width;
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: GetBuilder<ProductController>(
            builder: (_) {
              return Scaffold(
                  bottomNavigationBar: Container(
                    height: 60,
                    child: BottomNavigationBar(
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: controller.home == Icons.home ?Icon(controller.home) : Container(margin: EdgeInsets.only(bottom: 10), height: 26,width: 35,child:  Lottie.asset("asset/Animation - 1714655758814.json",animate: true,fit: BoxFit.cover),),
                          label: controller.home_title,
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.store),
                          label: 'Store',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.favorite),
                          label: 'Whitelist',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.person),
                          label: 'Profile',
                        ),
                      ],
                      currentIndex: controller.currentIndex.value,
                      unselectedItemColor: Colors.black,
                      selectedFontSize: 10,
                      unselectedFontSize: 10,
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.amber[800],
                      onTap: (index) {
                        if (index == 0) {
                          if(controller.home != Icons.home) {
                           controller.goUp();

                          }
                          if(controller.Scroll_controller.position.pixels >=2000){
                            controller.changeHome();
                          }
                        } else{
                          controller.changeToHome();
                        }
                        return Get.find<ProductController>().changePage(index);
                      },
                    ),
                  ),
                  backgroundColor: Color.fromRGBO(234, 234, 234, 1.0),
                  body: LayoutBuilder(builder: (BuildContext context,
                      BoxConstraints constraints) {
                    if (constraints.maxWidth < 800) {
                      width = MediaQuery
                          .sizeOf(context)
                          .width;
                      return IndexedStack(
                        index: Get
                            .find<ProductController>()
                            .currentIndex
                            .value,
                        children: [
                          homePaage(controller: controller),
                          storeList(),
                          whitelist(),
                          merchantTab(),

                        ],
                      );
                    } else {
                      width = 800;
                      return Center(
                        child: Container(
                            color: const Color.fromRGBO(255, 255, 255, 1.0),
                            width: MediaQuery
                                .sizeOf(context)
                                .width,
                            child: IndexedStack(
                              index: Get
                                  .find<ProductController>()
                                  .currentIndex
                                  .value,
                              children: [
                                homePaage(controller: controller),
                                storeList(),
                                whitelist(),
                                merchantTab(),
                              ],
                            )

                        ),

                      );
                    }
                  },
                  )
              );
            },
          )
      ),
    );
  }
}


