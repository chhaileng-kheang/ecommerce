import 'dart:async';

import 'package:ecomerce/shortvideo/videoItem.dart';
import 'package:ecomerce/shortvideo/videoManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:video_player/video_player.dart';
class videoShort extends StatefulWidget {
  videoShort({super.key});

  @override
  State<videoShort> createState() => _videoShortState();
}

class _videoShortState extends State<videoShort> {
  VideoManager videoManager = VideoManager(preloadCount: 5);
  late PageController pageController;
  List<VideoItem> vidItem = [];
  List<VideoPlayerController> controllers = [];
  StreamSubscription<List<String>>? subscription;
  late VideoPlayerController videoController;
  List<String> videoUrl = [
    'https://static.vecteezy.com/system/resources/previews/020/156/568/diverse-female-fashion-designers-at-work-with-tailor-centimeters-on-necks-and-holds-tablet-and-notepad-independent-creative-design-business-free-video.webm',
    'https://static.vecteezy.com/system/resources/previews/026/764/908/mp4/caucasian-female-fashion-designer-works-in-studio-by-idea-drawing-sketches-with-digital-tablet-and-colorful-fabric-for-a-dress-design-collection-choose-clothing-colors-for-tailoring-and-designing-free-video.mp4',
    'https://static.vecteezy.com/system/resources/previews/024/705/766/mp4/happy-asian-teen-girl-holding-pad-computer-gadget-using-digital-tablet-technology-sitting-on-the-couch-at-home-smiling-young-woman-using-apps-shopping-online-reading-news-browsing-internet-on-sofa-free-video.mp4',
    'https://static.vecteezy.com/system/resources/previews/019/028/714/mp4/self-drawing-animation-of-one-single-line-draw-happy-young-man-wearing-headset-playing-online-game-on-his-smartphone-e-sports-game-concept-full-length-animation-illustration-high-quality-4k-free-video.mp4',
    'https://static.vecteezy.com/system/resources/previews/042/672/398/mp4/asian-woman-tourist-is-taking-picture-with-mobile-phone-and-panning-for-record-the-beauty-of-rocky-cliff-covered-by-green-plants-during-summer-outdoor-pursuit-hobbies-and-leisure-parallax-shot-free-video.mp4',
    'https://static.vecteezy.com/system/resources/previews/001/623/357/mp4/bokeh-of-city-lights-free-video.mp4',
    'https://static.vecteezy.com/system/resources/previews/035/444/198/mp4/hot-smolder-coals-in-a-metal-brazier-barbecue-grill-kindling-preparing-for-outdoors-kebab-cooking-and-heating-the-mangal-dynamic-top-view-free-video.mp4',
    'https://static.vecteezy.com/system/resources/previews/037/762/739/mp4/down-view-of-a-bottle-with-oil-opening-and-the-oil-drips-in-a-salad-bowl-unusual-angle-free-video.mp4'

  ];
  bool breakl = false;
  int? currentPageIndex;
  bool scollState = false;
  bool isloading = false;
  bool checkbot = false;
  bool len = false;
  int startLen = 0;
  bool startStream = false;
  bool checkstream = false;
  @override

  @override
  void dispose() {
    // TODO: implement dispose
    print("Depose");
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    startLen = videoUrl.length;
    super.initState();
    pageController = PageController(viewportFraction: 1);
    currentPageIndex = 0;
    controllers = videoUrl.map((url) => VideoPlayerController.networkUrl(Uri.parse(url))
      ..initialize().then((_) {
        setState(() {
           if(controllers.length>1){
             if(controllers[0].value.isInitialized) {
               if(controllers[1].value.isInitialized) {
                 if(controllers[2].value.isInitialized) {
                   len = true;
                 }
               }
             }
               if (controllers[controllers.length-1].value.isInitialized == true &&
                   startStream == false) {
                 startStream = true;
               }

           }

        }); // Update UI once video is loaded
      })).toList();
    streamVideo();

  }
  Stream<List<String>> getVideo() async*{
    while(true){
      await Future.delayed(Duration(seconds: 5));
      yield videoUrl;
    }

  }
  void streamVideo () {
    subscription = getVideo().listen((videolink) {
      if(currentPageIndex == 50) {
        if (controllers.length >= 50) {
          controllers.removeRange(0, 2);
        }
      }

      if(startStream && checkstream){
        videolink.clear();
            videolink = [
              'https://static.vecteezy.com/system/resources/previews/020/156/568/diverse-female-fashion-designers-at-work-with-tailor-centimeters-on-necks-and-holds-tablet-and-notepad-independent-creative-design-business-free-video.webm',
              'https://static.vecteezy.com/system/resources/previews/005/206/808/mp4/close-up-cook-cut-steak-with-blood-freshly-grilled-meat-free-video.mp4',
              'https://static.vecteezy.com/system/resources/previews/020/724/764/mp4/food-appetizer-for-party-with-friends-free-video.mp4',
              'https://static.vecteezy.com/system/resources/previews/001/785/930/mp4/slow-motion-chefs-is-preparing-and-cooking-food-at-the-kitchen-of-a-restaurant-free-video.mp4',
            ];



        for (int i = 0 ; i < videolink.length ; i++) {
          setState(() {
            videoManager.preloadVideos(i, videolink);
            if(i<0) {
              if (controllers[controllers.length - 1].value.isInitialized) {
                controllers.add(videoManager.getController(i, videolink)!);
              }
            }else{
              controllers.add(videoManager.getController(i, videolink)!);
            }
          });

        }
        setState(() {
          checkstream = false;
          isloading = false;
        });

      }
    });

  }


  void updateLoading() {
    isloading = true;
  }
  void updateLoadingfalse() {
    isloading = false;
  }

  @override
  Widget build(BuildContext context) {
    double width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints){
          if(constraints.maxWidth < 800){
            width = MediaQuery.sizeOf(context).width;
            if(constraints.maxWidth<350) {
              return mainscreen(width, context, 1);
            }else{
              return mainscreen(width, context, 2);
            }
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
        }
        )
    );
  }

  mainscreen(double width, BuildContext context, int j) {

    return Scaffold(
      body: Center(
          child: Container(
              height: MediaQuery.sizeOf(context).height,
              color: Colors.black,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: MediaQuery.sizeOf(context).height,
                      color: Colors.black,
                      child: Stack(
                      children: [
                        NotificationListener<ScrollNotification>(
                      onNotification: (scrollState){
                            if (scrollState is ScrollStartNotification) {
                              if(pageController.position.pixels == pageController.position.maxScrollExtent) {
                                if (currentPageIndex! >= controllers.length-1) {
                                  if (checkbot == true) {
                                  setState(() {
                                    updateLoading();
                                    checkbot = false;
                                  });
                                  }else{
                                    setState(() {
                                      updateLoadingfalse();
                                      checkbot = true;

                                    });
                                   }
                                }
                              }
                              }
                            return false;
                        },
                          child: len ? StreamBuilder<List<String>>(
                            stream: getVideo(),
                            builder: (context, snapshot) {
                              return PageView.builder(
                                controller: pageController,
                                physics: HighScrollResistancePhysics(), // Your custom scroll physics
                                scrollDirection: Axis.vertical,
                                onPageChanged: (index) {
                                  if (index >= controllers.length - 1) {
                                    setState(() {
                                      checkbot = true; // Assuming this variable is meant to check something at the last index
                                    });
                                  }

                                  if (index > currentPageIndex!) {
                                    if ((index + 1) < videoUrl.length-1) {
                                      for (int i = (index + 1); i < videoUrl.length; i++) {
                                        if (!controllers[i].value.isInitialized) {
                                          videoManager.preloadVideos(i, videoUrl);
                                        }
                                      }
                                    }
                                  } else {
                                    setState(() {
                                      updateLoadingfalse(); // Custom method to handle loading states
                                    });
                                  }
                                  setState(() {
                                    currentPageIndex = index; // Update the current page index
                                    checkstream = true;
                                  });
                                },
                                itemCount: controllers.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var controller = controllers[index]; // Controller at the given index

                                  return Container(
                                    child: VideoItem(
                                      width: width,
                                      videoUrls: videoUrl,
                                      videoManager: videoManager,
                                      controllerVId: controller,
                                      index: index,
                                    ),
                                  );
                                },
                              );
                            },
                          )
                              :  Center(
                            child: LoadingAnimationWidget.prograssiveDots(
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 30,
                          child: Container(
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Category",style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(
                                    175, 175, 175, 1.0),
                                  shadows: [
                                  Shadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 1.0,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ],
                                  fontSize: 16
                                )
                                ),),
                                SizedBox(width: 10,),
                                Container(
                                  width: 3,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 0),
                                        blurRadius: 1.0,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      )
                                    ]
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text("Explore",style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(0, 0),
                                      blurRadius: 1.0,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ], fontSize: 16)),)
                              ],
                            ),
                          ),
                        ),

                      ],
                      ),
                    ),
                  ),
                 isloading == true  ? Expanded(
                    flex: 0,
                    child: Visibility(
                      visible: isloading,
                      child:Center(
                        child: LoadingAnimationWidget.prograssiveDots(
                          color: Colors.white,
                          size: 25,
                        ),
                    ),
                  )
                  ) : SizedBox(height: 0,)
                 ],
              )
          )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class HighScrollResistancePhysics extends PageScrollPhysics {
  const HighScrollResistancePhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  HighScrollResistancePhysics applyTo(ScrollPhysics? ancestor) {
    return HighScrollResistancePhysics(parent: buildParent(ancestor));
  }

  // Override the `getMinFlingVelocity` to increase the minimum velocity required for page change
  @override
  double getMinFlingVelocity() => 2000.0;  // Adjust this value as needed
  @override
  double getMinFlingDistance() => 5000.0; // Adjust this value as needed
  // Override `applyPhysicsToUserOffset` to apply a resistance effect on scrolling
  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    // Increase resistance for vertical scroll
    return offset /2.2; // Adjust this division factor to control resistance
  }
}

