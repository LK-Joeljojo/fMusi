import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fmusic/audio/page_manager.dart';
import 'package:fmusic/common/image_asset.dart';
import 'package:fmusic/view/main_player/driver_mode_view.dart';
import 'package:fmusic/view/main_player/play_playlist_view.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../audio/service_locator.dart';
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
          Get.to(() => DriverModeView());
        },
        "title": "Driver mode"
      },
    ];
    final pageManager = getIt<PageManager>();
    return Dismissible(
      key: const Key("playScreen"),
      direction: DismissDirection.down,
      background: const ColoredBox(color: Colors.transparent),
      onDismissed: (direction) {
        Get.back();
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: JColor.bgColor,
            automaticallyImplyLeading: true,
            elevation: 0,
            title: Text("Now Playing",
                style: Theme.of(context).textTheme.titleLarge),
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
                                  style:
                                      Theme.of(context).textTheme.labelLarge));
                        }).toList();
                      }),
                ),
              ),
            ],
          ),
          body: ValueListenableBuilder(
              valueListenable: pageManager.currentSongNotifier,
              builder: (context, mediaItem, child) {
                if (mediaItem == null) return SizedBox();
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Stack(
                        children: [
                          Hero(
                            tag: "currentArtWork",
                            child: ValueListenableBuilder(
                                valueListenable:
                                    pageManager.currentSongNotifier,
                                builder: (context, mediaItem, child) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        media.width * 0.6),
                                    child: CachedNetworkImage(
                                      imageUrl: mediaItem!.artUri.toString(),
                                      fit: BoxFit.cover,
                                      errorWidget: (context, url, error) {
                                        return Image.asset(
                                          "assets/images/close.png",
                                          fit: BoxFit.cover,
                                        );
                                      },
                                      placeholder: (context, url) {
                                        return Image.asset(
                                          "assets/images/close.png",
                                          fit: BoxFit.cover,
                                        );
                                      },
                                      width: media.width * 0.6,
                                      height: media.width * 0.6,
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            width: media.width * 0.6,
                            height: media.width * 0.6,
                            child: CircleAvatar(
                              backgroundColor:
                                  JColor.blackColor.withOpacity(0.4),
                            ),
                          ),
                          ValueListenableBuilder(
                              valueListenable: pageManager.progressNotifier,
                              builder: (context, valueState, child) {
                                // RxDouble? dragValue;
                                bool dragging = false;
                                final totalMs = valueState.total.inMilliseconds.toDouble();
                                final currentMs = valueState.current.inMilliseconds.toDouble();

                                final safeTotal = (totalMs.isNaN || totalMs.isInfinite ||totalMs <= 0)
                                    ? 1.0
                                    : totalMs;
                                final safeCurrent = (currentMs.isNaN ||currentMs.isInfinite ||currentMs < 0)
                                    ? 0.0
                                    : currentMs;

                                final maxValue = safeTotal;
                                final value = min(safeCurrent, safeTotal);
                                valueState.total.inMilliseconds.toDouble();
                                // if (dragValue?.value != null && dragging)
                                //   dragValue = null;

                                return SizedBox(
                                  height: media.width * 0.61,
                                  width: media.width * 0.61,
                                  child: SleekCircularSlider(
                                    appearance: CircularSliderAppearance(
                                      customWidths: CustomSliderWidths(
                                          trackWidth: 3,
                                          progressBarWidth: 3,
                                          shadowWidth: 7,
                                          handlerSize: 4),
                                      customColors: CustomSliderColors(
                                        dotColor: JColor.primayColor,
                                        trackColor: Colors.transparent,
                                        progressBarColors: [
                                          JColor.primayColor,
                                          JColor.primayColor
                                        ],
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
                                      ),
                                      startAngle: 270,
                                      angleRange: 360,
                                      size: 350.0,
                                    ),
                                    min: 0,
                                    max: maxValue,
                                    initialValue: value,
                                    onChange: (double value) {
                                      if (!dragging) {
                                        dragging = true;
                                      }
                                      // dragValue = value.obs;
                                      pageManager.seek(Duration(
                                        milliseconds: value.round(),
                                      ));
                                    },
                                    onChangeStart: (double startValue) {},
                                    onChangeEnd: (double endValue) {
                                      pageManager.seek(Duration(
                                        milliseconds: endValue.round(),
                                      ));
                                      dragging = false;
                                    },
                                  ),
                                );
                              })
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ValueListenableBuilder(
                          valueListenable: pageManager.progressNotifier,
                          builder: (context, value, child) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  RegExp(r'((^0*(1-9)\d*:)?\d{2}:\d{2})\.\d+$')
                                          .firstMatch('${value.current}')
                                          ?.group(1) ??
                                      '${value.current}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.apply(
                                          color: JColor.whiteColor
                                              .withOpacity(0.5)),
                                ),
                                Text(
                                  " | ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.apply(
                                          color: JColor.whiteColor
                                              .withOpacity(0.5)),
                                ),
                                Text(
                                  RegExp(r'((^0*(1-9)\d*:)?\d{2}:\d{2})\.\d+$')
                                          .firstMatch('${value.total}')
                                          ?.group(1) ??
                                      '${value.total}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.apply(
                                          color: JColor.whiteColor
                                              .withOpacity(0.5)),
                                ),
                              ],
                            );
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: media.width * 0.9,
                        child: Text(mediaItem.title,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: media.width * 0.7,
                        child: Text(
                          "${mediaItem.artist} • Album • ${mediaItem.album}",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium?.apply(
                              color: JColor.whiteColor.withOpacity(0.5)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Image.asset(
                        MusicImages.wave,
                        width: media.width * 0.8,
                        height: 60,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Divider(
                        height: 20,
                        thickness: 0.1,
                        color: JColor.dividerColor,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //mainAxisSize: MainAxisSize.min,
                        children: [
                          ValueListenableBuilder(
                              valueListenable: pageManager.isFirstSongNotifier,
                              builder: (context, isFirst, child) {
                                return IconButton(
                                  onPressed:
                                      (isFirst) ? null : pageManager.previous,
                                  padding: EdgeInsets.zero,
                                  iconSize: 45,
                                  splashRadius: 25,
                                  icon: Image.asset(
                                    MusicImages.forwardLeft,
                                    width: 45,
                                    height: 45,
                                    color: isFirst
                                        ? JColor.whiteColor.withOpacity(0.1)
                                        : JColor.whiteColor,
                                  ),
                                );
                              }),

                          // const SizedBox(
                          //   width: 25,
                          // ),
                          ValueListenableBuilder<ButtonState>(
                              valueListenable: pageManager.playButtonNotifier,
                              builder: (context, isPlay, child) {
                                return SizedBox(
                                  width: 75,
                                  height: 75,
                                  child: Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      if (isPlay == ButtonState.loading)
                                        CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(
                                              JColor.whiteColor
                                                  .withOpacity(0.5)),
                                        ),
                                      SizedBox(
                                        height: 60,
                                        width: 60,
                                        child: isPlay == ButtonState.playing
                                            ? IconButton(
                                                onPressed: pageManager.pause,
                                                padding: EdgeInsets.zero,
                                                iconSize: 60,
                                                splashRadius: 30,
                                                icon: Image.asset(
                                                  MusicImages.iconpause,
                                                  width: 60,
                                                  height: 60,
                                                ),
                                              )
                                            : IconButton(
                                                onPressed: pageManager.play,
                                                padding: EdgeInsets.zero,
                                                iconSize: 60,
                                                splashRadius: 30,
                                                icon: Image.asset(
                                                  MusicImages.solidPlay,
                                                  width: 60,
                                                  height: 60,
                                                ),
                                              ),
                                      )
                                    ],
                                  ),
                                );
                              }),

                          // const SizedBox(
                          //   width: 25,
                          // ),
                          ValueListenableBuilder(
                              valueListenable: pageManager.isLastSongNotifier,
                              builder: (context, isLast, child) {
                                return IconButton(
                                  onPressed: (isLast) ? null : pageManager.next,
                                  padding: EdgeInsets.zero,
                                  iconSize: 45,
                                  splashRadius: 25,
                                  icon: Image.asset(
                                    MusicImages.forwardRight,
                                    width: 45,
                                    height: 45,
                                    color: isLast
                                        ? JColor.whiteColor.withOpacity(0.1)
                                        : JColor.whiteColor,
                                  ),
                                );
                              }),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
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
                      )
                    ],
                  ),
                );
              })),
    );
  }
}
