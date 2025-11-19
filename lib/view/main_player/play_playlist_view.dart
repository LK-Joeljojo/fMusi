import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:fmusic/audio/page_manager.dart';
import 'package:fmusic/audio/service_locator.dart';
import 'package:fmusic/widgets/playplaylist_song_view.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../common/color.dart';
import '../../common/image_asset.dart';

class PlayPlaylistView extends StatelessWidget {
  const PlayPlaylistView({super.key});

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    var media = MediaQuery.sizeOf(context);
    return Dismissible(
      key: const Key("playplaylistScreen"),
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
            title:
                Text("Playlist", style: Theme.of(context).textTheme.titleLarge),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Image.asset(
                  HomeViewImages.search,
                  width: 25,
                  height: 25,
                  color: JColor.whiteColor,
                  fit: BoxFit.contain,
                ),
              ),
            ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  Container(
                    color: Colors.red,
                    child: Stack(
                      children: [
                        Hero(
                          tag: "currentArtWork",
                          child: ValueListenableBuilder(
                              valueListenable: pageManager.currentSongNotifier,
                              builder: (context, mediaItem, child) {
                                return ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(media.width * 0.6),
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
                                    width: media.width * 0.4,
                                    height: media.width * 0.4,
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          width: media.width * 0.4,
                          height: media.width * 0.4,
                          child: CircleAvatar(
                            backgroundColor: JColor.blackColor.withOpacity(0.4),
                          ),
                        ),
                        ValueListenableBuilder(
                            valueListenable: pageManager.progressNotifier,
                            builder: (context, valueState, child) {
                              // RxDouble? dragValue;
                              bool dragging = false;
                              final totalMs =
                                  valueState.total.inMilliseconds.toDouble();
                              final currentMs =
                                  valueState.current.inMilliseconds.toDouble();
                    
                              final safeTotal = (totalMs.isNaN ||
                                      totalMs.isInfinite ||
                                      totalMs <= 0)
                                  ? 1.0
                                  : totalMs;
                              final safeCurrent = (currentMs.isNaN ||
                                      currentMs.isInfinite ||
                                      currentMs < 0)
                                  ? 0.0
                                  : currentMs;
                    
                              final maxValue = safeTotal;
                              final value = min(safeCurrent, safeTotal);
                              valueState.total.inMilliseconds.toDouble();
                              // if (dragValue?.value != null && dragging)
                              //   dragValue = null;)
                              return Container(
                                height: 50,
                                width: 50,
                                padding: EdgeInsets.only(bottom: 20),
                                color: Colors.blueAccent,
                                child: SleekCircularSlider(
                                  appearance: CircularSliderAppearance(
                                    customWidths: CustomSliderWidths(
                                        trackWidth: 3,
                                        progressBarWidth: 3,
                                        shadowWidth: 7,
                                        handlerSize: 3),
                                    customColors: CustomSliderColors(
                                      dotColor: JColor.primayColor,
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
                                    ),
                                    startAngle: 270,
                                    angleRange: 360,
                                    size: 50,
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
                            }),
                      ],
                    ),
                  ),
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
              ValueListenableBuilder(
                valueListenable: pageManager.playlistNotifier,
                builder: (context, queue, child) {
                  final int queueStateIndex =
                      pageManager.currentSongNotifier.value == null
                          ? 0
                          : queue
                              .indexOf(pageManager.currentSongNotifier.value!);
                  final num queuePosition = queue.length - queueStateIndex;
                  return Theme(
                    data: Theme.of(context).copyWith(
                        canvasColor: Colors.transparent,
                        hoverColor: Colors.transparent),
                    child: ReorderableListView.builder(
                        itemCount: queue.length,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        shrinkWrap: true,
                        onReorder: (oldIndex, newIndex) {
                          if (oldIndex < newIndex) {
                            newIndex--;
                          }
                          pageManager.moveMediaItem(oldIndex, newIndex);
                        },
                        itemBuilder: (context, index) {
                          final obj = queue[index];
                          return Dismissible(
                            key: ValueKey(obj.id),
                            direction: index == queue
                                ? DismissDirection.none
                                : DismissDirection.horizontal,
                            onDismissed: (direction) {
                              pageManager.removeQueueItemAt(index);
                            },
                            child: Column(
                              children: [
                                PlayplaylistSongView(
                                  objet: obj,
                                  rigth: (index == queueStateIndex)
                                      ? const Icon(
                                          Icons.bar_chart_rounded,
                                          color: JColor.primayColor,
                                        )
                                      : ReorderableDragStartListener(
                                          key: Key(obj.id),
                                          enabled: index != queueStateIndex,
                                          index: index,
                                          child: const Icon(
                                            Icons.drag_handle_rounded,
                                            color: Colors.white10,
                                          )),
                                  onTap: () {
                                    pageManager.skipToQueueItem(index);
                                    if (pageManager.playButtonNotifier.value ==
                                        ButtonState.paused) {
                                      pageManager.play();
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                        }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
