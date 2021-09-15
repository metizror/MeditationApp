import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditaion_demo/audioManager/page_manager.dart';
import 'package:flutter_meditaion_demo/inject_dependency.dart';


class MediaTitleWidget extends StatelessWidget {
  const MediaTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<String>(
      valueListenable: pageManager.currentSongTitleNotifier,
      builder: (_, title, __) {
        return Text(
          title,
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.normal),
        );
      },
    );
  }
}
