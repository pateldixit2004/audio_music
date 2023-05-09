import 'package:audio_music/audio/Provider/audio_provider.dart';
import 'package:audio_music/audio/View/Home_Screen.dart';
import 'package:audio_music/audio/View/audio_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
void main()
{
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return  MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => audioProvider(),)
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/':(context)=> Home_Scrren(),
              'audio':(context)=> Audio_Screen(),
            },
          ),
        );
      },

    )
  );
}