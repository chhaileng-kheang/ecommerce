import 'package:ecomerce/shortvideo/overlay.dart';
import 'package:ecomerce/shortvideo/videoManager.dart';
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
  final int index;
  final VideoManager videoManager;
  final List<String> videoUrls;
  final VideoPlayerController controllerVId;
  const VideoItem({super.key, required this.videoUrl, required this.width, required this.index, required this.videoManager, required this.videoUrls, required this.controllerVId});

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  bool isVisible = false;
  bool isVisiblePro = true;
  String status = "";

  bool pause = true;
  bool clickPause = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controllerVId.addListener(() {
    });
    widget.controllerVId.setLooping(true);

  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    widget.videoManager.preloadVideos(widget.index, widget.videoUrls);
    return VisibilityDetector(
        key: Key(widget.videoUrl), // You can use any unique key here
        onVisibilityChanged: (visibilityInfo) {
          if(visibilityInfo.visibleFraction >0.92) {
            if(mounted) {
              setState(() {
                isVisible = true;
                widget.controllerVId.play();
              });
            }
          }else if(visibilityInfo.visibleFraction < 0.08){
            if(mounted) {
              setState(() {
                isVisible = false;
                widget.controllerVId.pause();
                widget.controllerVId.seekTo(Duration.zero);
              });
            }
          }

        },
        child: _buildVideoPlayer(widget.width)
    );
  }

  Widget _buildVideoPlayer(double width) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.sizeOf(context).height,
      child: Stack(
        children: [
          Center(
            child: widget.controllerVId.value.isInitialized
                ? GestureDetector(
              onTap: (){
                setState(() {
                  if (clickPause == true) {
                    widget.controllerVId.play();
                    clickPause = false;
                  } else {
                    widget.controllerVId.pause();
                    clickPause = true;
                  }
                });
              },
              child: AspectRatio(
                aspectRatio: widget.controllerVId.value.aspectRatio,
                child: VideoPlayer(widget.controllerVId),
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
                    child: BasicOverlayWidget(controller: widget.controllerVId)),
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
            bottom: 200,
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
                  Icon(Icons.favorite_outline_rounded,color: Colors.white, shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 2.0)],size: 42,),
                  SizedBox(height: 15,),
                  Transform.scale(
                      scaleX: -1,
                      child: Icon(Icons.reply,color: Colors.white, shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 2.0)],size: 42,))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget buildIndicator() => VideoProgressIndicator(
    widget.controllerVId,
    allowScrubbing: true,
  );
}

