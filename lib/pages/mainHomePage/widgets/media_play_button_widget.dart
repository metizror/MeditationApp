import 'package:flutter/material.dart';
import 'package:flutter_meditaion_demo/audioManager/page_manager.dart';
import 'package:flutter_meditaion_demo/inject_dependency.dart';
import 'package:flutter_meditaion_demo/valueNotifier/play_button_notifier.dart';



class MediaPlayButtonWidget extends StatelessWidget {
  const MediaPlayButtonWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<ButtonState>(
      valueListenable: pageManager.playButtonNotifier,
      builder: (_, value, __) {
        switch (value) {
          case ButtonState.loading:
            return  Container(
              margin: const EdgeInsets.all(8.0),
              width: 35.0,
              height: 35.0,
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          case ButtonState.paused:
            return IconButton(
              icon: const Icon(Icons.play_circle_fill_outlined),
              iconSize: 35.0,
              onPressed: pageManager.play,
              color: Colors.white,
            );
          case ButtonState.playing:
            return IconButton(
              icon: const Icon(Icons.pause_circle_filled_outlined),
              iconSize: 35.0,
              onPressed: pageManager.pause,
              color: Colors.white,
            );
        }
      },
    );
  }
}