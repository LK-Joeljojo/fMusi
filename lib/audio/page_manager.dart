import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:fmusic/audio/service_locator.dart';
import 'package:just_audio/just_audio.dart';

enum ButtonState {
  paused,
  playing,
  loading,
}

enum RepeatState {
  off,
  repeatSong,
  repeatPlaylist,
}

class PlayButtonNotifier extends ValueNotifier<ButtonState> {
  PlayButtonNotifier() : super(initialValue);
  static const initialValue = ButtonState.paused;
}

class RepeatButtonNotifier extends ValueNotifier<RepeatState> {
  RepeatButtonNotifier() : super(initialValue);
  static const initialValue = RepeatState.off;

  void nextState() {
    final next = (value.index + 1) % RepeatState.values.length;
    value = RepeatState.values[next];
  }
}

class ProgressBarState {
  final Duration current;
  final Duration buffered;
  final Duration total;

  ProgressBarState(
      {required this.current, required this.buffered, required this.total});
}

class ProgressNotifier extends ValueNotifier<ProgressBarState> {
  ProgressNotifier() : super(initialValue);
  static final initialValue = ProgressBarState(
      current: Duration.zero, buffered: Duration.zero, total: Duration.zero);
}

class PageManager {
  final currentSongNotifier = ValueNotifier<MediaItem?>(null);
  final playbackStatNotifier =
      ValueNotifier<AudioProcessingState>(AudioProcessingState.idle);
  final playlistNotifier = ValueNotifier<List<MediaItem>>([]);
  final progressNotifier = ProgressNotifier();
  final repeatButtonNotifier = RepeatButtonNotifier();
  final playButtonNotifier = PlayButtonNotifier();
  final isFirstSongNotifier = ValueNotifier<bool>(true);
  final isLastSongNotifier = ValueNotifier<bool>(true);
  final isShuffleModeEnableNotifier = ValueNotifier<bool>(true);

  final audioHandler = getIt<AudioHandler>();

  void init() async {
    listenToChangeInPlaylist();
    listenToPlayBackState();
  }

  void listenToChangeInPlaylist() {
    audioHandler.queue.listen((playlist) {
      if (playlist.isEmpty) {
        playlistNotifier.value = [];
        currentSongNotifier.value = null;
      } else {
        playlistNotifier.value = playlist;
      }
      updateSkipButton();
    });
  }

  updateSkipButton() {
    final mediaItem = audioHandler.mediaItem.value;
    final playlist = audioHandler.queue.value;

    if (playlist.length < 2 || mediaItem == null) {
      isFirstSongNotifier.value = true;
      isLastSongNotifier.value = true;
    } else {
      isFirstSongNotifier.value = playlist.first == mediaItem;
      isLastSongNotifier.value = playlist.last == mediaItem;
    }
  }

  void listenToPlayBackState() {
    audioHandler.playbackState.listen((playbackState) {
      final isPlaying = playbackState.playing;
      final processingState = playbackState.processingState;

      if (processingState == AudioProcessingState.loading ||
          processingState == AudioProcessingState.buffering) {
        playButtonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        playButtonNotifier.value = ButtonState.paused;
      } else if (processingState != AudioProcessingState.completed) {
        playButtonNotifier.value = ButtonState.playing;
      } else {
        audioHandler.seek(Duration.zero);
        audioHandler.pause();
      }
    });
  }

  listenToCurrentPosition() {
    AudioService.position.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
          current: position,
          buffered: oldState.buffered,
          total: oldState.total);
    });
  }

  listenToBufferedPosition() {
    audioHandler.playbackState.listen((playbackState) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
          current: oldState.current,
          buffered: playbackState.bufferedPosition,
          total: oldState.total);
    });

  }

  listenToTotalPosition() {
    audioHandler.playbackState.listen((playbackState) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
          current: oldState.current,
          buffered: playbackState.bufferedPosition,
          total: oldState.total);
    });

  }
}
