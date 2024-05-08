import 'dart:math';

import 'package:video_player/video_player.dart';

class VideoManager {
  VideoManager({required this.preloadCount});
  Map<int, VideoPlayerController> _controllers = {};
  int preloadCount = 5;
  VideoPlayerController? getController(int index, List<String> videoUrls) {
    if (_controllers.containsKey(index) && !_controllers[index]!.hasListeners) {
      // Controller is disposed, so recreate it
      _controllers[index] = createController(videoUrls[index]);
    } else if (!_controllers.containsKey(index)) {
      _controllers[index] = createController(videoUrls[index]);
    }
    return _controllers[index];
  }

  VideoPlayerController createController(String url) {
    var controller = VideoPlayerController.networkUrl(Uri.parse(url));
    controller.initialize().then((_) => controller.setLooping(true));
    return controller;
  }

  void preloadVideos(int currentIndex, List<String> videoUrls) {

      if (!_controllers.containsKey(currentIndex)) {
        _controllers[currentIndex] = VideoPlayerController.networkUrl(Uri.parse(videoUrls[currentIndex]))..initialize();
    }
  }

  void disposeController(int index) {
    if (_controllers.containsKey(index)) {
      _controllers[index]?.dispose();
      _controllers.remove(index);
    }
  }

  void disposeAll() {
    _controllers.forEach((_, controller) => controller.dispose());
    _controllers.clear();
  }
}
