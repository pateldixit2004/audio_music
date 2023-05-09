
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_music/audio/Modal/audioModal.dart';
import 'package:flutter/material.dart';

class audioProvider extends ChangeNotifier
{

  AssetsAudioPlayer assetsAudioPlayer =AssetsAudioPlayer();
  bool isplay =false;




  int click=0;


  List<audioModal> viewList=[

    audioModal(Sanme: "Kesariya",Ssub: "aliay",c1: Colors.blue ,img: 'assets/image/img.png'),
    audioModal(Sanme: "Kgf",Ssub: "Rocky bhai",c1: Colors.red ,img: 'assets/image/img_1.png'),
    audioModal(Sanme: "आरंभ है प्रचंड बोले मस्तको के झुंड",Ssub: "आरंभ है प्रचंड बोले मस्तको के झुंड",c1: Colors.black54 ,img: 'assets/image/img_2.png'),
  ];

  List<audioModal> imgList=[
    audioModal(photo: 'assets/image/kesa.png'),
    audioModal(photo: 'assets/image/kgf1.png'),
    audioModal(photo: 'assets/image/arabha.png'),
  ];
  void inliya()
  {
    assetsAudioPlayer.open(
      Playlist(audios: [
        Audio("assets/audio/k1.mp3"),
        Audio("assets/audio/kgf.mp3"),
        Audio("assets/audio/arabha.mp3"),
      ],startIndex: click,),autoStart: true,
      showNotification:true,
    );
  }

  void playaudio()
  {
    isplay =true;
    assetsAudioPlayer.play();
    notifyListeners();
  }

  stopmusic()
  {
    isplay=false;
    assetsAudioPlayer.pause();
    notifyListeners();
  }
  void nextmusic()
  {
    assetsAudioPlayer.next();
    notifyListeners();
  }
}