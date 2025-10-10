import 'package:flutter/material.dart';
import 'package:fmusic/audio/page_manager.dart';
import 'package:fmusic/common/color.dart';
import 'package:fmusic/common/image_asset.dart';

import '../audio/service_locator.dart';

class ControlButtons extends StatelessWidget {
  final bool shuffle;
  final bool miniPlayer;
  final List buttons;

  const ControlButtons(
      {super.key,
      this.shuffle = false,
      this.miniPlayer = false,
      this.buttons = const ["Previous", "Play/Pause", "Next"]});

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: buttons.map((e) {
        switch (e) {
          case "Previous":
            return ValueListenableBuilder<bool>(
                valueListenable: pageManager.isFirstSongNotifier,
                builder: (context, isFirst, _) {
                  return IconButton(
                      onPressed: isFirst ? null : pageManager.previous,
                      icon: Image.asset(
                        MusicImages.forwardLeft,
                        width: miniPlayer ? 20 : 50,
                        height: miniPlayer ? 20 : 50,
                      ));
                });
                
          case "Play/Pause":
            return SizedBox(
              width: miniPlayer ? 40 : 70,
              height: miniPlayer ? 40 : 70,
              child: ValueListenableBuilder<ButtonState>(
                  valueListenable: pageManager.playButtonNotifier,
                  builder: (context, value, __) {
                    return Stack(
                      children: [
                        if (value == ButtonState.loading)
                          Center(
                            child: SizedBox(
                              width: miniPlayer ? 40 : 70,
                              height: miniPlayer ? 40 : 70,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    JColor.whiteColor.withOpacity(0.4)),
                              ),
                            ),
                          ),
                        if (miniPlayer)
                          Center(
                            child: value == ButtonState.playing
                                ? IconButton(
                                    onPressed: pageManager.pause,
                                    icon: Image.asset(
                                      MusicImages.pause,
                                      width: 30,
                                      height: 30,
                                      color: JColor.whiteColor,
                                    ))
                                : IconButton(
                                    onPressed: pageManager.play,
                                    icon: Image.asset(
                                      MusicImages.play,
                                      width: 30,
                                      height: 30,
                                      color: JColor.whiteColor,
                                    )),
                          )
                        else
                          Center(
                            child: value == ButtonState.playing
                                ? IconButton(
                                    onPressed: pageManager.pause,
                                    icon: Image.asset(
                                      MusicImages.pause,
                                      width: 50,
                                      height: 50,
                                      color: JColor.whiteColor,
                                    ))
                                : IconButton(
                                    onPressed: pageManager.play,
                                    icon: Image.asset(
                                      MusicImages.play,
                                      width: 50,
                                      height: 50,
                                      color: JColor.whiteColor,
                                    )),
                          )
                      ],
                    );
                  }),
            );
          case "Next":
            return ValueListenableBuilder<bool>(
                valueListenable: pageManager.isLastSongNotifier,
                builder: (context, isLast, _) {
                  return IconButton(
                      onPressed: isLast ? null : pageManager.next,
                      icon: Image.asset(
                        MusicImages.forwardRight,
                        width: miniPlayer ? 20 : 50,
                        height: miniPlayer ? 20 : 50,
                      ));
                });
          default:
            return Container();
        }
      }).toList(),
    );
  }
}
