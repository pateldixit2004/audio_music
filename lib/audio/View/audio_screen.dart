import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_music/audio/Provider/audio_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Audio_Screen extends StatefulWidget {
  const Audio_Screen({Key? key}) : super(key: key);

  @override
  State<Audio_Screen> createState() => _Audio_ScreenState();
}

class _Audio_ScreenState extends State<Audio_Screen> {
  audioProvider? providerF;
  audioProvider? providerT;

  @override
  void initState() {
    super.initState();
    Provider.of<audioProvider>(context, listen: false).inliya();
  }

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;

    providerF = Provider.of<audioProvider>(context, listen: false);
    providerT = Provider.of<audioProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
            providerF!.stopmusic();

          }, icon: Icon(Icons.arrow_back_ios_new_outlined)),
          actions: [
            IconButton(onPressed: () {

            }, icon: Icon(Icons.more_vert))
          ],
        ),
        body: Column(
          children: [
            // Image.asset("${providerF!.imgList[index].photo}",height: 100.h,width: 100.h,fit: BoxFit.fill,),

            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'video');
                },
                child: Center(
                    child: Image.asset(
                  "${providerF!.viewList[index].img}",
                  height: 40.h,
                  width: 40.h,
                  fit: BoxFit.cover,
                ))),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () {
                  
                }, icon: Icon(Icons.thumb_down_off_alt_rounded)),
                Text("${providerT!.viewList[index].Sanme}",style: TextStyle(fontSize: 15.sp),),
                IconButton(onPressed: () {
                  
                }, icon: Icon(Icons.thumb_up_alt_outlined)),
              ],
            ),
            
            Align(
              alignment: Alignment.bottomCenter,
              child: PlayerBuilder.currentPosition(
                player: providerF!.assetsAudioPlayer,
                builder: (context, position) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Slider(
                          value: position!.inSeconds.toDouble(),
                          onChanged: (value) {
                            position = Duration(seconds: value.toInt());
                            providerF!.assetsAudioPlayer.seek(position);
                          },
                          max: providerT!.durationaudio.inSeconds.toDouble(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${position}"),
                            Text("${providerT!.durationaudio}"),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment(1, 0.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.skip_previous_outlined)),
                  FloatingActionButton(
                      backgroundColor: Colors.black,
                      onPressed: () {
                        if (providerF!.isplay) {
                          providerF!.stopmusic();
                        } else {
                          providerF!.playaudio();
                        }

                        // providerF!.playaudio();
                      },
                      child: providerT!.isplay
                          ? Icon(
                              Icons.pause,
                              color: Colors.white,
                            )
                          : Icon(Icons.play_arrow)),
                  IconButton(
                      onPressed: () {


                        providerF!.nextmusic();
                        providerT!.isplay;
                        providerT!.viewList[index].img;
                      },
                      icon: Icon(Icons.skip_next_outlined)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
