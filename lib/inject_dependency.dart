import 'package:audio_service/audio_service.dart';
import 'package:flutter_meditaion_demo/valueNotifier/draggable_sheet_notifier.dart';
import 'package:get_it/get_it.dart';

import 'audioManager/audio_player_handler.dart';
import 'audioManager/page_manager.dart';
import 'audioManager/playlist_repository.dart';

GetIt getIt = GetIt.instance;

Future<void> injectAllTheDependencies() async {
  /// initializing the audio service class creating the singleton for it.
  getIt.registerSingleton<AudioHandler>(await initAudioService());

  /// creating instance of PlaylistRepository abstract class by implementing DemoPlayList class by abstraction.
  getIt.registerLazySingleton<PlaylistRepository>(() => DemoPlaylist());

  /// initializing instance for Draggable sheet for player controls and current playlist view class state.
  getIt.registerLazySingleton<DraggableSheetNotifier>(() => DraggableSheetNotifier());

  /// creating instance of PageManager for managing the all audio player controls and the audio service state.
  getIt.registerLazySingleton<PageManager>(() => PageManager());
}
