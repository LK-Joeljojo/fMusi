import 'package:flutter/material.dart';
import 'package:fmusic/common/color.dart';
import 'package:fmusic/view_model/home_view_model.dart';
import 'package:fmusic/view_model/playlists_view_model.dart';
import 'package:fmusic/widgets/playlist_type.dart';
import 'package:get/get.dart';

import '../../widgets/playlist_song.dart';
import '../../widgets/title_section.dart';

class PlaylistView extends StatelessWidget {
  PlaylistView({super.key});

  final plVM = Get.put(PlaylistsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,                 
                  childAspectRatio: 1.2,
                ),
                itemCount: plVM.playListArr.length,
                itemBuilder: (context, index) {
                  final obj = plVM.playListArr[index];
                  return PlaylistType(objet: obj);
                  
                })),
            const TitleSection(
              title: 'My Playlists',
              hasViewAll: true,
              trailing: "View all",
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 160,
              //color: JColor.primayColor,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 15),
                  itemCount: plVM.myPlayList.length,
                  itemBuilder: (context, index) {
                    final obj = plVM.myPlayList[index];
                    return PlaylistSong(
                      objet: obj,
                      hasArtists: false,
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: Card(
        color: JColor.bgColor,
        elevation: 8,
        child: Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
              color: JColor.bgColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: JColor.blackColor.withOpacity(0.3),
                    blurRadius: 5,
                    offset: const Offset(0, 0))
              ]),
          child: const Center(
            child: Icon(
              Icons.add,
              color: JColor.primayColor,
            ),
          ),
        ),
      ),
    );
  }
}
