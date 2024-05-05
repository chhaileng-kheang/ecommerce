import 'package:ecomerce/shortvideo/overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoItem extends StatefulWidget {
  final String videoUrl;
  final double width;
  const VideoItem({super.key, required this.videoUrl, required this.width});

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  bool isVisible = false;
  bool isVisiblePro = true;
  String status = "";
  late VideoPlayerController _controller;

  bool pause = true;
  bool clickPause = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoUrl));
    _controller.addListener(() {
      setState(() {
        _controller.value.isBuffering ? isVisiblePro = true : isVisiblePro = false;
      });
    });
    _controller.setLooping(true);
    _controller.initialize();
    _controller.play();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
        key: Key(widget.videoUrl), // You can use any unique key here
        onVisibilityChanged: (visibilityInfo) {
          if(visibilityInfo.visibleFraction >0.92) {
            if(mounted) {
            setState(() {
              if(_controller.value.isBuffering){
                isVisiblePro = false;
              }else{
                isVisiblePro = true;
              }
                isVisible = true;
            });
            }
          }else if(visibilityInfo.visibleFraction < 0.08){
            if(mounted) {
              setState(() {
                isVisible = false;
              });
            }
          }

        },
        child: _buildVideoPlayer(widget.width)
    );
  }

  Widget _buildVideoPlayer(double width) {
    if(isVisible == true){
      if(mounted){
        setState(() {
          status = "Playing";
          if(pause == true) {
            _controller.play();
          pause = false;
          }
        });
      }
    }else {
      if (mounted) {
        setState(() {
          status = "stop";
          _controller.pause();
        });
      }
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.sizeOf(context).height,
      child: Stack(
        children: [
          Center(
            child: _controller.value.isInitialized
                ? GestureDetector(
              onTap: (){
                setState(() {
                  if (clickPause == true) {
                    _controller.play();
                    clickPause = false;
                  } else {
                    _controller.pause();
                    clickPause = true;
                  }
                });
              },
              child: AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              ),
                ) : Container(),
          ),
          clickPause
              ?  Center(child: Icon(Icons.pause,color: Colors.white, shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 2.0)],size: 46,))
              : SizedBox(height: 0,),
          Positioned(
              bottom: 1,
              child: Visibility(
                visible: isVisiblePro,
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.sizeOf(context).width,
                    child: BasicOverlayWidget(controller: _controller)),
              )),
          Positioned(
            bottom: 20,
            left: width*0.05,
            child: Opacity(opacity: 1,
            child: Container(
              height: 60,
              width: width*0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),topLeft: Radius.circular(5)),
                  child: FadeInImage.assetNetwork(height: 60,width: 60, placeholder: "asset/aas.png", image: "https://images.pexels.com/photos/4490019/pexels-photo-4490019.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",imageCacheWidth: 500,filterQuality: FilterQuality.low,fit: BoxFit.cover,),
                ),
                SizedBox(width: 5,),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Product A"),
                      SizedBox(height: 5,),
                      Text("\$125.44",style: GoogleFonts.montserrat(textStyle : TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent)),)
                    ],
                  ),
                ),
              ],
            ),
            ),
            ),
          ),
          Positioned(
            right: 15,
            bottom: MediaQuery.sizeOf(context).height*0.35,
            child: Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                        boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2.0)]
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child:   FadeInImage.assetNetwork(height: 40,width: 40, placeholder: "asset/aas.png", image: "https://images.pexels.com/photos/9537435/pexels-photo-9537435.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",imageCacheWidth: 500,filterQuality: FilterQuality.low,fit: BoxFit.cover,),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Icon(Icons.favorite_outline_rounded,color: Colors.white, shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 2.0)],size: 42,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget buildIndicator() => VideoProgressIndicator(
    _controller,
    allowScrubbing: true,
  );
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
    mass: 5,
    stiffness: 1,
    damping: 1,
  );
}

