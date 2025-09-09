import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fmusic/audio/page_manager.dart';
import 'package:fmusic/audio/service_locator.dart';
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
    final double screenWith = MediaQuery.sizeOf(context).width;

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
                  child: Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
                    elevation: 0,
                    color: JColor.whiteColor.withOpacity(0.1),
                    //color: Colors.white10,
                    child: SizedBox(
                      height: 76,
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
                                    Colors.transparent
                                  ]).createShader(
                                  Rect.fromLTRB(0, 0, rect.right, rect.height));
                            },
                            blendMode: BlendMode.dstIn,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  dense: false,
                                  onTap: () {},
                                  title: Text(
                                    mediaItem.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Text(
                                    mediaItem.artist ?? "",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  leading: Hero(
                                      tag: "currentArtWork",
                                      child: Card(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        child: SizedBox.square(
                                          dimension: 40,
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                mediaItem.artUri.toString(),
                                            fit: BoxFit.cover,
                                            errorWidget: (context, url, error) {
                                              return Image.asset(
                                                "assets/images/999animé.jpg",
                                                fit: BoxFit.cover,
                                              );
                                            
                                            },
                                            placeholder: (context, url) {
                                              return Image.asset(
                                                "assets/images/999animé.jpg",
                                                fit: BoxFit.cover,
                                              );
                                            },
                                          ),
                                        ),
                                      )),
                                  trailing: Container(),
                                )
                              ],
                            ),
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
