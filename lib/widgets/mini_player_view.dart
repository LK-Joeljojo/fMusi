import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fmusic/audio/page_manager.dart';
import 'package:fmusic/audio/service_locator.dart';
import 'package:fmusic/view/main_player/main_player_view.dart';
import 'package:fmusic/widgets/control_buttons.dart';
import '../common/color.dart';
import 'dart:ui' as ui;

class MiniPlayerView extends StatefulWidget {
  static const MiniPlayerView _instance = MiniPlayerView._internal();

  factory MiniPlayerView() {
    return _instance;
  }

  const MiniPlayerView._internal();

  @override
  State<MiniPlayerView> createState() => _MiniPlayerViewState();
}

class _MiniPlayerViewState extends State<MiniPlayerView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();

    return ValueListenableBuilder<AudioProcessingState>(
      builder: (context, processingState, _) {
        if (processingState == AudioProcessingState.idle) {
          return const SizedBox();
        }
        return ValueListenableBuilder<MediaItem?>(
            valueListenable: pageManager.currentSongNotifier,
            builder: (context, mediaItem, _) {
              if (mediaItem == null) return const SizedBox();
              return Dismissible(
                key: const Key("mini_player"),
                direction: DismissDirection.down,
                onDismissed: (direction) {
                  Feedback.forLongPress(context);
                  pageManager.stop();
                },
                child: Dismissible(
                  key: Key(mediaItem.id),
                  confirmDismiss: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      pageManager.previous();
                    } else {
                      pageManager.next();
                    }
                    return Future.value(false);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: JColor.blackColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(50)),
                    //color: Colors.white10,
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ui.ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                                end: Alignment.topCenter,
                                begin: Alignment.bottomCenter,
                                colors: [
                                  JColor.blackColor,
                                  JColor.blackColor,
                                  Colors.black45
                                ]).createShader(
                                Rect.fromLTRB(0, 0, rect.right, rect.height));
                          },
                          blendMode: BlendMode.dstIn,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                dense: false,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          opaque: false,
                                          pageBuilder: (context, _, __) =>
                                              const MainPlayerView()));
                                },
                                title: Text(
                                  mediaItem.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                subtitle: Text(
                                  mediaItem.artist ?? "",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.apply(
                                          color: JColor.whiteColor
                                              .withOpacity(0.7)),
                                ),
                                leading: Hero(
                                    tag: "currentArtWork",
                                    child: Card(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child: SizedBox.square(
                                        dimension: 40,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  mediaItem.artUri.toString(),
                                              fit: BoxFit.cover,
                                              errorWidget:
                                                  (context, url, error) {
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
                                              width: 40,
                                              height: 40,
                                            )),
                                      ),
                                    )),
                                trailing: const ControlButtons(
                                  miniPlayer: true,
                                  buttons: ["Previous","Play/Pause", "Next"],
                                ),
                              ),
                              Container(
                                color: JColor.whiteColor.withOpacity(0.2),
                                child: ValueListenableBuilder<ProgressBarState>(
                                  valueListenable: pageManager.progressNotifier,
                                  builder: (context, value, __) {
                                    final position = value.current;
                                    final totalDuration = value.total;

                                    return position == null
                                        ? const SizedBox()
                                        : (position.inSeconds.toDouble() <
                                                    0.0 ||
                                                (position.inSeconds.toDouble() >
                                                    totalDuration.inSeconds
                                                        .toDouble()))
                                            ? const SizedBox()
                                            : SliderTheme(
                                                data: const SliderThemeData(
                                                  activeTrackColor:
                                                      JColor.primayColor,
                                                  inactiveTrackColor:
                                                      Colors.transparent,
                                                  trackHeight: 2,
                                                  thumbColor:
                                                      JColor.primayColor,
                                                  thumbShape:
                                                      RoundSliderOverlayShape(
                                                          overlayRadius: 0),
                                                  overlayColor:
                                                      JColor.whiteColor,
                                                  overlayShape:
                                                      RoundSliderOverlayShape(
                                                          overlayRadius: 0),
                                                ),
                                                child: Center(
                                                  child: Slider(
                                                      inactiveColor:
                                                          Colors.transparent,
                                                      max: totalDuration
                                                          .inSeconds
                                                          .toDouble(),
                                                      value: position.inSeconds
                                                          .toDouble(),
                                                      onChanged: (newPosition) {
                                                        pageManager.seek(Duration(
                                                            seconds: newPosition
                                                                .round()));
                                                      }),
                                                ));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            });
      },
      valueListenable: pageManager.playbackStatNotifier,
    );
  }
}
