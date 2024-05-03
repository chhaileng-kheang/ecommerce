import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoItem extends StatefulWidget {
  final String videoUrl;

  const VideoItem({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  bool isVisible = false;
  String status = "";

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
        key: Key(widget.videoUrl), // You can use any unique key here
        onVisibilityChanged: (visibilityInfo) {
          if(visibilityInfo.visibleFraction >0.90) {
            setState(() {
              isVisible = true;
            });
          }else{
            isVisible = false;
          }
        },
        child: _buildVideoPlayer()
    );
  }

  Widget _buildVideoPlayer() {
    if(isVisible == true) {
      print(widget.videoUrl + " is Playing");
      setState(() {
        status = "Playing";
      });
    } else{
      print(widget.videoUrl + " is off");
      setState(() {
        status = "stop";
      });
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.sizeOf(context).height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Video Player Placeholder ' + widget.videoUrl,
              style: TextStyle(color: Colors.white),
            ),
          Text(status),
          ],
        ),
      ),
    );
  }
}
