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
    'https://videos.pexels.com/video-files/9071009/9071009-hd_1080_1920_25fps.mp4',
    'https://videos.pexels.com/video-files/8128342/8128342-uhd_2160_3840_25fps.mp4',
    'https://videos.pexels.com/video-files/7047255/7047255-uhd_2160_3840_25fps.mp4',
    'https://videos.pexels.com/video-files/8128343/8128343-uhd_2160_3840_25fps.mp4',
    'https://videos.pexels.com/video-files/5076790/5076790-hd_1080_1920_30fps.mp4',
    'https://videos.pexels.com/video-files/5386411/5386411-uhd_2160_4096_25fps.mp4',
    'https://videos.pexels.com/video-files/6853337/6853337-uhd_2160_4096_25fps.mp4',
    'https://videos.pexels.com/video-files/12902487/12902487-hd_1080_1920_30fps.mp4',
    'https://videos.pexels.com/video-files/6546116/6546116-uhd_2160_3840_30fps.mp4',
    'https://videos.pexels.com/video-files/15157247/15157247-uhd_1776_3840_30fps.mp4',
    'https://videos.pexels.com/video-files/4942046/4942046-hd_1080_1920_30fps.mp4'

  ];
  bool breakl = false;
  int? currentPageIndex;
  bool scollState = false;
  bool isloading = false;
  bool checkbot = false;
  @override
  Stream<List<String>> getVideo() async*{
    while(true){
      await Future.delayed(Duration(milliseconds: 1500));
      yield videoUrl;
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(viewportFraction: 1);
    currentPageIndex = 0;
    for (String url in videoUrl) {
      VideoPlayerController controller = VideoPlayerController.networkUrl(Uri.parse(url));


      controller.initialize().then((_) {
   setState(() {
     controllers.add(controller);
     isloading = false;
   });
      }).catchError((error) {
        // Handle initialization error, e.g., log it or show an error message
        print('Error initializing video: $error');
        breakl = true;
      });

    }
  }
  void streamVideo (){
    subscription = getVideo().listen((videolink) {

      videolink.add("https://videos.pexels.com/video-files/7219299/7219299-hd_1080_1920_24fps.mp4");

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
                                    updateLoading();
                                    checkbot = false;
                                  }else{
                                    updateLoadingfalse();
                                    checkbot = true;
                                  }
                                }
                              }
                              }
                            return false;
                        },
                          child: PageView(
                            controller: pageController,
                            scrollDirection: Axis.vertical,
                            onPageChanged: (index){
                              if(index >= controllers.length-1){
                                checkbot = true;

                              }
                              if (index > currentPageIndex!) {

                              } else {
                              updateLoadingfalse();
                              }
                              currentPageIndex = index; // Update the current page index

                              },
                            children: controllers.length > 0 ? controllers.map((e) {
                              return Container(
                                child: VideoItem(width : width,videoUrls: videoUrl,videoManager: videoManager,controllerVId : e),

                              );
                            }).toList() : [Center(child: Container( child: Text("initilizing",style: TextStyle(color: Colors.white,),)))]
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

