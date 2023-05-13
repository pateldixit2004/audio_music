
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_music/audio/Modal/audioModal.dart';
import 'package:flutter/material.dart';

class audioProvider extends ChangeNotifier
{

  AssetsAudioPlayer assetsAudioPlayer =AssetsAudioPlayer();
  bool isplay =false;

  Duration durationaudio= Duration(seconds: 0);
  int click=0;
List<audioModal> viewList=[
    audioModal(Sanme: "Kesariya",Ssub: "aliay",c1: Colors.blue ,img: 'assets/image/img.png'),
    audioModal(Sanme: "Kgf",Ssub: "Rocky bhai",c1: Colors.red ,img: 'assets/image/img_1.png'),
    audioModal(Sanme: "आरंभ है प्रचंड बोले मस्तको के झुंड",Ssub: "आरंभ है प्रचंड बोले मस्तको के झुंड",c1: Colors.black54 ,img: 'assets/image/img_2.png'),
    audioModal(Sanme: "Maan Meri Jaan",Ssub: "Maan Meri Jaan",c1: Colors.pink ,img: 'assets/image/maan.png'),
    audioModal(Sanme: "Raataan Lambiyan",Ssub: "Raataan Lambiyan",c1: Colors.redAccent ,img: 'assets/image/img_3.png'),
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
        Audio("assets/audio/maan.mp3"),
        Audio("assets/audio/Raataan Lambiyan .mp3"),
      ],startIndex: click,),autoStart: false,
      showNotification:true,
    );
    audiolen();
  }

  void playaudio()
  {
    assetsAudioPlayer.play();
    isplay =true;
    notifyListeners();
  }

  stopmusic()
  {
    assetsAudioPlayer.pause();
    isplay=false;
    notifyListeners();
  }
  void nextmusic()
  {
    assetsAudioPlayer.next();
    notifyListeners();
    imgList;
  }
  void audiolen()
  {
    assetsAudioPlayer.current.listen((event) {
      durationaudio=event!.audio.duration;
    });
  }
}