import 'package:ecomerce/shortvideo/videoItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class videoShort extends StatefulWidget {
  const videoShort({super.key});

  @override
  State<videoShort> createState() => _videoShortState();
}

class _videoShortState extends State<videoShort> {
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
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _pageController = PageController(
      viewportFraction: 1, // Ensures only one item is visible at a time
    );
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
              child: PageView.builder(
                physics: CustomPageViewScrollPhysics(),
                controller: _pageController,
                itemCount: videoUrl.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Container(
                    color: Colors.black,
                    child: VideoItem(videoUrl: videoUrl[index],width : width)
                ),
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
