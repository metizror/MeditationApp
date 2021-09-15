
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditaion_demo/audioManager/page_manager.dart';
import 'package:flutter_meditaion_demo/inject_dependency.dart';
import 'package:flutter_meditaion_demo/valueNotifier/progress_notifier.dart';

class AudioProgressBarWidget extends StatelessWidget {
  const AudioProgressBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: pageManager.progressNotifier,
      builder: (_, value, __) {
        return ProgressBar(
          progress: value.current,
          buffered: value.buffered,
          total: value.total,
          onSeek: pageManager.seek,
          progressBarColor: Colors.white,
          bufferedBarColor: Colors.deepPurpleAccent,
          timeLabelTextStyle: const TextStyle(color: Colors.white),
        );
      },
    );
  }
}
