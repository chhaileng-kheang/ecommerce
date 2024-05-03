import 'package:ecomerce/shortvideo/videoItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class videoShort extends StatefulWidget {
  const videoShort({super.key});

  @override
  State<videoShort> createState() => _videoShortState();
}

class _videoShortState extends State<videoShort> {
  List<String> videoUrl = ['Video 1', 'Video 2', 'Video 3','Video 4', 'Video 5', 'Video 6'];
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
        backgroundColor: Colors.white,
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
              child: PageView.builder(
                physics: CustomPageViewScrollPhysics(),
                controller: _pageController,
                itemCount: videoUrl.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Container(
                    color: index % 2 == 0 ? Colors.blueGrey : Colors.grey,
                    child: AspectRatio(
                        aspectRatio: 9/16,
                        child: VideoItem(videoUrl: videoUrl[index]))
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
