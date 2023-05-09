import 'package:audio_music/audio/Provider/audio_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home_Scrren extends StatefulWidget {
  const Home_Scrren({Key? key}) : super(key: key);

  @override
  State<Home_Scrren> createState() => _Home_ScrrenState();
}

class _Home_ScrrenState extends State<Home_Scrren> {
  audioProvider? providerF;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<audioProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Rainbow Music",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) => viile(index),
                itemCount: providerF!.viewList.length,
              ))
            ],
          )),
    );
  }

  Widget viile(int? index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {

          Navigator.pushNamed(context, 'audio', arguments: index);
          providerF!.click=index;
        },
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              color: providerF!.viewList[index!].c1,
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10),
              CircleAvatar(
                radius: 20,
                backgroundImage:
                    AssetImage("${providerF!.viewList[index!].img}"),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${providerF!.viewList[index].Sanme}"),
                  Text("${providerF!.viewList[index].Ssub}"),
                ],
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow))
            ],
          ),
        ),
      ),
    );
  }
}
