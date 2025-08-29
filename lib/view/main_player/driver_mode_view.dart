import 'package:flutter/material.dart';
import 'package:fmusic/common/color.dart';
import 'package:fmusic/common/image_asset.dart';
import 'package:fmusic/view/main_player/play_playlist_view.dart';
import 'package:get/get.dart';

class DriverModeView extends StatelessWidget {
  DriverModeView({super.key});

  final RxDouble sliderVal = 0.6.obs;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
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
              Get.to(() => PlayPlaylistView());
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
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 15,
          ),
          Stack(
            children: [
              SizedBox(
                      width: media.width * 0.4,
                      height: media.width * 0.4,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          MusicImages.juiceWrld,
                        ),
                      ),
                    ),
              Container(
                width: media.width * 0.4,
                height: media.width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(media.width * 0.4),
                    border: Border.all(width: 0.5, color: JColor.whiteColor)),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text("Conversations", style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Juice Wrld • Album • Legends never Die",
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.apply(color: JColor.whiteColor.withOpacity(0.5)),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "148/148",
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.apply(color: JColor.whiteColor.withOpacity(0.5)),
          ),
          const SizedBox(
            height: 45,
          ),
          Slider(
              value: sliderVal.value,
              activeColor: JColor.primayColor,
              inactiveColor: JColor.whiteColor.withOpacity(0.4),
              onChanged: (newVal) {
                sliderVal.value = newVal;
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "3:40",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.apply(color: JColor.whiteColor.withOpacity(0.5)),
                ),
                Text(
                  "4:01",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.apply(color: JColor.whiteColor.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                iconSize: 55,
                splashRadius: 30,
                icon: Image.asset(
                  MusicImages.forwardLeft,
                  width: 55,
                  height: 55,
                ),
              ),
              // const SizedBox(
              //   width: 25,
              // ),
              IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                iconSize: 75,
                splashRadius: 35,
                icon: Image.asset(
                  MusicImages.solidPlay,
                  width: 75,
                  height: 75,
                ),
              ),
              // const SizedBox(
              //   width: 25,
              // ),
              IconButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                iconSize: 55,
                splashRadius: 30,
                icon: Image.asset(
                  MusicImages.forwardRight,
                  width: 55,
                  height: 55,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
