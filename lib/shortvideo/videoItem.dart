import 'package:ecomerce/shortvideo/overlay.dart';
import 'package:ecomerce/shortvideo/videoManager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'videoManager.dart';

class VideoItem extends StatefulWidget {
  final double width;
  final VideoManager videoManager;
  final List<String> videoUrls;
  final int index;
  final VideoPlayerController controllerVId;
  const VideoItem({super.key,  required this.width, required this.videoManager, required this.videoUrls, required this.controllerVId, required this.index});

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> with SingleTickerProviderStateMixin{
  bool isVisible = false;
  bool isVisiblePro = true;

  String status = "";
  late AnimationController _controller;
  bool pause = true;
  bool clickPause = false;
  @override
  void initState() {
    widget.controllerVId.addListener(() {
   if(mounted){
     setState(() {

     });

   }
    });

    widget.controllerVId.setLooping(true);
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    widget.controllerVId.removeListener(() {
      if(mounted){
        setState(() {

        });
      }

    });
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    widget.controllerVId.value.isBuffering ? setState(() {
      isVisiblePro = true;
    }) : setState(() {
      isVisiblePro = false;
    });

    return VisibilityDetector(

        key: Key(widget.controllerVId.dataSource), // You can use any unique key here
        onVisibilityChanged: (visibilityInfo) {
          if(visibilityInfo.visibleFraction > 0.95) {
            if(mounted) {
              setState(() {
                isVisible = true;
                widget.controllerVId.play();
              });
            }
          }else if(visibilityInfo.visibleFraction <= 0.05){
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
          widget.controllerVId.value.isInitialized
              ? Center(
                child: GestureDetector(
                  onTap: (){
                if(mounted) {
                  setState(() {
                    if (clickPause == true) {
                      widget.controllerVId.play();
                      clickPause = false;
                    } else {
                      clickPause = true;
                      widget.controllerVId.pause();

                    }
                  });
                }
                },
                  child: AspectRatio(
                aspectRatio: widget.controllerVId.value.aspectRatio,
                child: VideoPlayer(widget.controllerVId,key: Key(widget.controllerVId.dataSource),),
                  ),
                ),
              ) :
          Positioned(
              bottom: 1,
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.sizeOf(context).width,
                  child: BasicOverlayWidget(controller: widget.controllerVId))),
          Visibility(
              visible: clickPause,
              child: Center(child: Icon(Icons.pause,color: Colors.white, shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 2.0)],size: 60,))),
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
            bottom: 50,
            left: width*0.05,
            child: Opacity(opacity: 1,
              child: Container(
                height: 60,
                width: width*0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.transparent
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 1.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ]
                      ),
                      padding: EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: FadeInImage.assetNetwork(height: 50,width: 50, placeholder: "asset/aas.png", image: "https://images.pexels.com/photos/4490019/pexels-photo-4490019.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",imageCacheWidth: 500,filterQuality: FilterQuality.low,fit: BoxFit.cover,),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Product A",style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,
                              shadows: [
                                Shadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 1.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ], fontSize: 12)),),
                          SizedBox(height: 5,),
                          Text("\$ 125.44",style: GoogleFonts.montserrat(textStyle : TextStyle(fontWeight: FontWeight.bold,color: Colors.redAccent,shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 2.0)],)),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: 65,
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
                  SizedBox(height: 25,),
                  Column(
                    children: [
                      Icon(Icons.favorite_outline_rounded,color: Colors.white, shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 2.0)],size: 35,),
                      Text("10.2K",style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 0),
                              blurRadius: 1.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ], fontSize: 12)),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Transform.scale(
                      scaleX: -1,
                      child: Icon(Icons.reply,color: Colors.white, shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 2.0)],size: 36,)),
                  SizedBox(height: 50,),
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Center(
                      child: AnimatedBuilder(
                        animation: _controller,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/music_disc.jpg'), // Your disc image asset
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: _controller.value * 2 * 3.14159, // Rotates full 360 degrees
                            child: Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('asset/gramophone.png')),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: FadeInImage.assetNetwork(placeholder: "asset/aas.png", image: "https://images.unsplash.com/photo-1487180144351-b8472da7d491?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTN8fHxlbnwwfHx8fHw%3D",imageCacheWidth: 500,filterQuality: FilterQuality.low,fit: BoxFit.cover,),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
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



