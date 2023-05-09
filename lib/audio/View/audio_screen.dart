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
    Provider.of<audioProvider>(context,listen: false).inliya();
  }

  @override
  Widget build(BuildContext context) {
    int index =ModalRoute.of(context)!.settings.arguments as int;

    providerF =Provider.of<audioProvider>(context,listen: false);
    providerT =Provider.of<audioProvider>(context,listen: true);

    return SafeArea(child: Scaffold(
      body: Stack(
        children: [
          Image.asset("${providerF!.imgList[index].photo}",height: 100.h,width: 100.h,fit: BoxFit.fill,),

          Center(child: Image.asset("${providerF!.viewList[index].img}",height: 40.h,width: 40.h,fit: BoxFit.cover,)),
          Align(
            alignment: Alignment(1, 0.7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {



                }, icon: Icon(Icons.refresh)),
                IconButton(
                    onPressed: () {


                    }, icon: Icon(Icons.skip_previous_outlined)),
                FloatingActionButton(
                  backgroundColor: Colors.black,
                  onPressed: () {

                    if(providerT!.isplay)
                      {
                        providerF!.playaudio();
                      }
                    else
                      {
                        providerF!.stopmusic();
                      }

                    // providerF!.playaudio();

                  },
                  child: providerT!.isplay?Icon(
                    Icons.pause,
                    color: Colors.white,
                  ): Icon(Icons.play_arrow)
                ),
                IconButton(
                    onPressed: () {


                      providerF!.nextmusic();
                    },
                    icon: Icon(Icons.skip_next_outlined)),
                IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
              ],
            ),
          )
        ],
      ),
    ),);
  }
}
