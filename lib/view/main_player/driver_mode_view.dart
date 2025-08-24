import 'package:flutter/material.dart';
import 'package:fmusic/common/color.dart';
import 'package:fmusic/common/image_asset.dart';
import 'package:fmusic/view/main_player/play_playlist_view.dart';
import 'package:get/get.dart';

class DriverModeView extends StatelessWidget {
  const DriverModeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: JColor.bgColor,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Image.asset(
            HomeViewImages.close,
            width: 25,
            height: 25,
            fit: BoxFit.cover,
          ),
        ),
        elevation: 0,
        title:
            Text("Driver Mode", style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(()=> PlayPlaylistView());
            },
            icon: Image.asset(
              MusicImages.playlistIcon,
              width: 25,
              height: 25,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
