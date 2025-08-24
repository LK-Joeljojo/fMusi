import 'package:flutter/material.dart';
import 'package:fmusic/common/image_asset.dart';
import 'package:fmusic/view/main_player/driver_mode_view.dart';
import 'package:fmusic/view/main_player/play_playlist_view.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../common/color.dart';
import '../../widgets/text_icon_button.dart';

class MainPlayerView extends StatelessWidget {
  final Function(int)? onTapMenu;

  const MainPlayerView({super.key, this.onTapMenu});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final List<Map<String, dynamic>> menuItems = [
      {"id": 1, "ontap": () {}, "title": "Social Share"},
      {"id": 2, "ontap": () {}, "title": "Playing queue"},
      {"id": 4, "ontap": () {}, "title": "Add to playlist queue"},
      {"id": 5, "ontap": () {}, "title": "Add to playlist"},
      {"id": 6, "ontap": () {}, "title": "Lyrics"},
      {"id": 7, "ontap": () {}, "title": "Volume"},
      {"id": 8, "ontap": () {}, "title": "Details"},
      {"id": 9, "ontap": () {}, "title": "Equaliser"},
      {"id": 10, "ontap": () {}, "title": "Ringtone Cutter"},
      {"id": 11, "ontap": () {}, "title": "Player theme"},
      {
        "id": 12,
        "ontap": () {
          Get.to(() => const DriverModeView());
        },
        "title": "Driver mode"
      },
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: JColor.bgColor,
        automaticallyImplyLeading: true,
        elevation: 0,
        title:
            Text("Now Playing", style: Theme.of(context).textTheme.titleLarge),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: SizedBox(
              height: 25,
              width: 25,
              child: PopupMenuButton(
                  color: JColor.popupColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  icon: Image.asset(
                    MusicImages.more,
                    width: 25,
                    height: 25,
                    fit: BoxFit.cover,
                  ),
                  padding: EdgeInsets.zero,
                  onSelected: onTapMenu,
                  offset: const Offset(-5, 45),
                  itemBuilder: (context) {
                    return menuItems.map((item) {
                      return PopupMenuItem<int>(
                          value: item["id"],
                          onTap: item["ontap"],
                          height: 30,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 0),
                          child: Text(item["title"],
                              style: Theme.of(context).textTheme.labelLarge));
                    }).toList();
                  }),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(media.width * 0.6),
                  child: Image.asset(
                    MusicImages.juiceWrld,
                    width: media.width * 0.6,
                    height: media.width * 0.6,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.61,
                  width: media.width * 0.61,
                  child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                      customWidths: CustomSliderWidths(
                        trackWidth: 4,
                        progressBarWidth: 5,
                        shadowWidth: 7,
                      ),
                      customColors: CustomSliderColors(
                        dotColor: Colors.transparent,
                        trackColor: Colors.transparent,
                        progressBarColors: [
                          JColor.primayColor,
                          JColor.primayColor
                        ],
                        // shadowColor: JColor.blackColor,
                        // shadowMaxOpacity: 0.05,
                      ),
                      infoProperties: InfoProperties(
                        topLabelStyle: const TextStyle(
                          color: Colors.transparent,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        topLabelText: 'Elapsed',
                        bottomLabelStyle: const TextStyle(
                          color: Colors.transparent,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        bottomLabelText: 'time',
                        mainLabelStyle: const TextStyle(
                          color: Colors.transparent,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w600,
                        ),
                        // modifier: (double value) {
                        //   final time =
                        //       printDuration(Duration(seconds: value.toInt()));
                        //   return time;
                        // },
                      ),
                      startAngle: 270,
                      angleRange: 360,
                      size: 350.0,
                    ),
                    min: 0,
                    max: 100,
                    initialValue: 42,
                    onChange: (double value) {
                      // callback providing a value while its being changed (with a pan gesture)
                    },
                    onChangeStart: (double startValue) {
                      // callback providing a starting value (when a pan gesture starts)
                    },
                    onChangeEnd: (double endValue) {
                      // ucallback providing an ending value (when a pan gesture ends)
                    },
                    // innerWidget: (double value) {
                    //   // use your custom widget inside the slider (gets a slider value from the callback)
                    // },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "2:30 | 4:04",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.apply(color: JColor.whiteColor.withOpacity(0.5)),
            ),
            const SizedBox(
              height: 15,
            ),
            Text("Conversations",
                style: Theme.of(context).textTheme.titleLarge),
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
              height: 25,
            ),
            Image.asset(
              MusicImages.wave,
              width: media.width * 0.8,
              height: 60,
            ),
            const SizedBox(
              height: 25,
            ),
            const Divider(
              height: 20,
              thickness: 0.1,
              color: JColor.dividerColor,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  iconSize: 45,
                  splashRadius: 25,
                  icon: Image.asset(
                    MusicImages.forwardLeft,
                    width: 45,
                    height: 45,
                  ),
                ),
                // const SizedBox(
                //   width: 25,
                // ),
                IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  iconSize: 60,
                  splashRadius: 30,
                  icon: Image.asset(
                    MusicImages.solidPlay,
                    width: 60,
                    height: 60,
                  ),
                ),
                // const SizedBox(
                //   width: 25,
                // ),
                IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  iconSize: 45,
                  splashRadius: 25,
                  icon: Image.asset(
                    MusicImages.forwardRight,
                    width: 45,
                    height: 45,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextIconButton(
                    text: 'Playlist',
                    icon: MusicImages.playlistIcon,
                    onTap: () {
                      Get.to(() => PlayPlaylistView());
                    },
                  ),
                  TextIconButton(
                    text: 'Shuffle',
                    icon: MusicImages.shuffleIcon,
                  ),
                  TextIconButton(
                    text: 'Repeat',
                    icon: MusicImages.repeatIcon,
                  ),
                  TextIconButton(
                    text: 'EQ',
                    icon: MusicImages.equalizerIcon,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
