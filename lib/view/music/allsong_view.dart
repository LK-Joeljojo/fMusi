import 'package:flutter/material.dart';
import 'package:fmusic/audio/player_invoke.dart';
import 'package:fmusic/view_model/allsong_view_model.dart';
import 'package:fmusic/widgets/allsong_row.dart';
import 'package:get/get.dart';

class AllsongView extends StatelessWidget {
  AllsongView({super.key});
  final allSC = Get.put(AllsongViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return ListView.builder(
            itemCount: allSC.allSongs.length,
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final obj = allSC.allSongs[index];
              return Column(
                children: [
                  AllsongRow(
                    objet: obj,
                    isWeb: true,
                    onTapPlay: (){
                      // Get.to(()=>  const MainPlayerView());
                      playerPlayProcessDebounce(allSC.allSongs.map((obj) => {
                        "id": obj["id"].toString(),
                        "title": obj["name"].toString(),
                        "artist": obj["artists"].toString(),
                        "album": obj["album"].toString(),
                        "genre": obj["language"].toString(),
                        "image": obj["image"].toString(),
                        "url": obj["downloadUrl"].toString(),

                      }).toList(), index);
                    },
                  ),
                ],
              );
            });
      }),
    );
  }
}
