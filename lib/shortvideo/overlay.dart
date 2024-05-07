import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BasicOverlayWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const BasicOverlayWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) => Stack(
    children: <Widget>[
      buildPlay(),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: buildIndicator(),
      ),
    ],
  );

  Widget buildIndicator() => Container(
    height: 8,
    child: VideoProgressIndicator(
      controller,
      allowScrubbing: true,
    ),
  );

  Widget buildPlay() => controller.value.isPlaying
      ? Container()
      : Container(
    //thumnailhandler

  );
}