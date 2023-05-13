import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class videoProvider extends ChangeNotifier {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  void loadVideo() {

    videoPlayerController =
        VideoPlayerController.asset("assets/video/kesariya.mp4");
    videoPlayerController!.initialize();
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController!, autoPlay: true);
    
  }
}
