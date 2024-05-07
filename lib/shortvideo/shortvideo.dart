import 'package:ecomerce/shortvideo/videoItem.dart';
import 'package:ecomerce/shortvideo/videoManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
class videoShort extends StatefulWidget {
  const videoShort({super.key});

  @override
  State<videoShort> createState() => _videoShortState();
}

class _videoShortState extends State<videoShort> {
  VideoManager videoManager = VideoManager(preloadCount: 5);
  List<String> videoUrl = [
    'https://static.vecteezy.com/system/resources/previews/035/502/391/a-woman-s-hand-is-using-a-spoon-to-stir-things-into-a-drink-glass-free-video.webm',
    'https://videos.pexels.com/video-files/7219299/7219299-hd_1080_1920_24fps.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4',
    'https://static.vecteezy.com/system/resources/previews/022/517/055/mp4/vr-headset-and-controllers-under-neon-light-vertical-3d-animation-video.mp4',
    'https://videos.pexels.com/video-files/7198553/7198553-uhd_2160_3840_25fps.mp4',
    'https://videos.pexels.com/video-files/4380323/4380323-hd_1080_1920_30fps.mp4',
    'https://videos.pexels.com/video-files/5741115/5741115-uhd_2160_4096_25fps.mp4'
  ];
  late PageController _pageController;
  List<VideoPlayerController> _controllers = [];
  late VideoPlayerController videoController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1);
      _controllers  =  videoUrl.map((url) => VideoPlayerController.networkUrl(Uri.parse(url))
        ..initialize().then((_) {
          setState(() {

          }); // Update UI once video is loaded
        })).toList();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

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
              child: Stack(
              children: [
                PageView.builder(
                  physics: CustomPageViewScrollPhysics(),
                  controller: _pageController,
                  itemCount: _controllers.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Container(
                      color: Colors.black,
                      child: VideoItem(videoUrl: videoUrl[index],width : width,index: index,videoUrls: videoUrl,videoManager: videoManager,controllerVId : _controllers[index])
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
              )
          )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CustomPageViewScrollPhysics extends ScrollPhysics {
  const CustomPageViewScrollPhysics({ScrollPhysics? parent})
      : super(parent: parent);

  @override
  CustomPageViewScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomPageViewScrollPhysics(parent: buildParent(ancestor)!);
  }

  @override
  SpringDescription get spring => const SpringDescription(
    mass: 50,
    stiffness: 100,
    damping: 0.8,
  );
}
