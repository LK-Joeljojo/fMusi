import 'package:flutter/material.dart';
import 'package:fmusic/common/color.dart';
import 'package:fmusic/common/image_asset.dart';
import 'package:fmusic/view_model/home_view_model.dart';
import 'package:fmusic/widgets/playlist_song.dart';
import 'package:fmusic/widgets/recently_song.dart';
import 'package:fmusic/widgets/recommanded_song.dart';

import '../../widgets/title_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: JColor.bgColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Image.asset(
              HomeViewImages.more,
              width: 25,
              height: 25,
            )),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: JColor.blackColor.withOpacity(0.50),
          ),
          child: TextField(
            style: TextStyle(
                color: JColor.whiteColor.withOpacity(0.70), fontSize: 12),
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: "Search album song",
              hintStyle: TextStyle(
                  color: JColor.whiteColor.withOpacity(0.70), fontSize: 12),
              prefixIcon: Container(
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  width: 30,
                  // height: 20,
                  //color: JColor.primayColor,
                  child: Image.asset(
                    HomeViewImages.search,
                    width: 20,
                    height: 20,
                    fit: BoxFit.contain,
                  )),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            const TitleSection(
              title: 'Hot Recommanded',
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 180,
              //color: JColor.primayColor,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 15),
                itemCount: HomeVM.hotRecommanded.length,
                itemBuilder: (context, index) {
                  final obj = HomeVM.hotRecommanded[index];
                  return RecommandedSong(objet: obj);
                }),
            ),
            
            Divider(color: JColor.dividerColor.withOpacity(0.2),indent: 15,endIndent: 15,),
            const SizedBox(
              height: 15,
            ),
             const TitleSection(
              title: 'Playlist', hasViewAll: true, trailing: "View all",
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
                itemCount: HomeVM.playList.length,
                itemBuilder: (context, index) {
                  final obj = HomeVM.playList[index];
                  return PlaylistSong(objet: obj);
                }),
            ),
            Divider(color: JColor.dividerColor.withOpacity(0.2),indent: 15,endIndent: 15,),
            const SizedBox(
              height: 15,
            ),
           
            const TitleSection(
              title: 'Recently Played', hasViewAll: true, trailing: "View all",
            ),
            const SizedBox(
              height: 15,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: HomeVM.recentlyPlayed.length,
                itemBuilder: (context, index) {
                  final obj = HomeVM.recentlyPlayed[index];
                  return RecentlySong(objet: obj);
                }),
          ],
        ),
      ),
    );
  }
}
