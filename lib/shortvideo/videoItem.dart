import 'package:ecomerce/shortvideo/overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoItem extends StatefulWidget {
  final String videoUrl;

  const VideoItem({super.key, required this.videoUrl});

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  bool isVisible = false;
  bool isVisiblePro = false;
  String status = "";
  late VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoUrl));
    _controller.addListener(() {
      setState(() {

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
          if(visibilityInfo.visibleFraction >=1){
            if(mounted){
              setState(() {
                isVisiblePro = true;
              });
            }
          }else {
            if (mounted) {
              setState(() {
                isVisiblePro = false;
              });
            }
          }
          if(visibilityInfo.visibleFraction >0.92) {
            if(mounted) {
            setState(() {
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
        child: _buildVideoPlayer()
    );
  }

  Widget _buildVideoPlayer() {
    if(isVisible == true){
      if(mounted){
        setState(() {
          status = "Playing";
          _controller.play();
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
                ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ) : Container(),
          ),
          Positioned(
            bottom: 1,
            child: Visibility(
              visible: isVisiblePro,
              child: Container(
                height: MediaQuery.of(context).size.height,
                  width: MediaQuery.sizeOf(context).width,
                  child: BasicOverlayWidget(controller: _controller)),
            ))
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

