import 'package:audio_music/audio/Provider/video_provider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  videoProvider? providerF;
  videoProvider? providerT;

  @override
  void initState() {

    super.initState();
    Provider.of<videoProvider>(context,listen: false).loadVideo();
  }
  @override
  Widget build(BuildContext context) {
    providerF= Provider.of<videoProvider>(context,listen: false);
    providerT= Provider.of<videoProvider>(context,listen: true);
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Container(
            height: 30.h,
            width: 100.w,
            child: Chewie(
              controller: providerT!.chewieController!,
            ),
          )
        ],
      ),
    ));
  }
}
