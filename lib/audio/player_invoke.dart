import 'dart:async';
import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:fmusic/audio/mediaitem_converter.dart';
import 'package:fmusic/audio/page_manager.dart';
import 'package:fmusic/audio/service_locator.dart';

DateTime playerTapTime = DateTime.now();
bool get isProcessForPlay {
  return DateTime.now().difference(playerTapTime).inMilliseconds > 600;
}

Timer? debounce;

void playerPlayProcessDebounce(List songsList, int index) {
  debounce?.cancel();
  debounce = Timer(const Duration(milliseconds: 600), () {});
}

class PlayerInvoke {
  static final pageManager = getIt<PageManager>();

  static Future<void> init({
    required List songsList,
    required int index,
    bool fromMiniPlayer = false,
    bool shuffle = false,
    String? playlistBox,
  }) async {
    final int globalIndex = index < 0 ? 0 : index;
    final List finalList = songsList.toList();
    if (shuffle) finalList.shuffle();
    if (!fromMiniPlayer) {
      if (!Platform.isAndroid) {
        await pageManager.stop();
      }

      setValues(finalList, globalIndex);
    }
  }

  static setValues(List arr, int index, {recommend = false}) {
    final List<MediaItem> queue = [];
    final Map playItem = arr[index] as Map;
    final Map? nextItem =
        index == arr.length - 1 ? null : arr[index + 1] as Map;
    queue.addAll(arr.map(
      (song) =>
          MediaitemConverter.mapToMediaItem(song as Map, autoPlay: recommend),
    ));
  }

  static Future<void> updateNPlay(List<MediaItem> queue, int index) async {
    try {
      await pageManager.setShuffleMode(AudioServiceShuffleMode.none);
      await pageManager.adds(queue, index);
      await pageManager.playAS();

    } catch (e) {
      print("error: $e");
    }
  }
}
