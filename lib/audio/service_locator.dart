import 'package:audio_service/audio_service.dart';
import 'package:fmusic/audio/audio_handler.dart';
import 'package:fmusic/audio/page_manager.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
Future<void> setupServiceLocator() async {
  getIt.registerSingleton<AudioHandler>(await initAudioService());
  getIt.registerLazySingleton<PageManager> (() => PageManager());
}