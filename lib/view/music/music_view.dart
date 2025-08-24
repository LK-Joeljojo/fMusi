import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:fmusic/view/music/albums_view.dart';
import 'package:fmusic/view/music/allsong_view.dart';
import 'package:fmusic/view/music/artists_view.dart';
import 'package:fmusic/view/music/genres_view.dart';
import 'package:fmusic/view/music/playlist_view.dart';
import 'package:fmusic/view_model/music_view_model.dart';
import 'package:get/get.dart';
import '../../common/color.dart';
import '../../common/image_asset.dart';
import '../../view_model/drawer_view_model.dart';

class MusicView extends StatelessWidget {
  MusicView({super.key});
  final mVMcontroller = Get.put(MusicViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: JColor.bgColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.find<DrawerViewModel>().openDrawer();
            },
            icon: SizedBox(
              height: 35,
              width: 35,
              child: CircleAvatar(
                  backgroundColor: JColor.bgColor,
                  backgroundImage: AssetImage(HomeViewImages.profilImg)),
            )),
        title: Text("Songs", style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Image.asset(
              HomeViewImages.search,
              width: 25,
              height: 25,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ButtonsTabBar(
            controller: mVMcontroller.controller,
            borderColor: JColor.bgColor,
            unselectedBorderColor: JColor.bgColor,
            backgroundColor: JColor.primayColor,
            buttonMargin: const EdgeInsets.only(left: 10,right: 5),
            radius: 50,
            height: 35,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 0),
            unselectedBackgroundColor: Colors.transparent,
            unselectedLabelStyle: const TextStyle(color: Colors.white),
            labelStyle:
                const TextStyle(color: JColor.blackColor, fontWeight: FontWeight.normal,fontSize: 10),
            tabs: const [
              Tab(
                text: "All songs",
              ),
              Tab(
                text: "Playlists",
              ),
              Tab(
                text: "Albums",
              ),
              Tab(
                text: "Artistes",
              ),
              Tab(
                text: "Genres",
              ),
            ],
          ),
                Expanded(
                child: TabBarView(
                  controller: mVMcontroller.controller,
                  children: <Widget>[
                    AllsongView(),
                    PlaylistView(),
                    AlbumsView(),
                    ArtistsView(),
                    GenresView()
                  ]
                )
               ),
        ],
      ),
    );
  }
}
