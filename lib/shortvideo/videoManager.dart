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
    int startIndex = max(0, currentIndex - preloadCount);
    int endIndex = min(videoUrls.length, currentIndex + preloadCount + 1);

    // Dispose controllers not in the current preload range
    _controllers.keys.where((index) => index < startIndex || index > endIndex).toList().forEach(disposeController);

    for (int i = startIndex; i < endIndex; i++) {
      if (!_controllers.containsKey(i)) {
        _controllers[i] = VideoPlayerController.networkUrl(Uri.parse(videoUrls[i]))..initialize();
      }
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
