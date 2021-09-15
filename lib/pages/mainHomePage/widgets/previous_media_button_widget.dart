import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditaion_demo/audioManager/page_manager.dart';
import 'package:flutter_meditaion_demo/inject_dependency.dart';

class PreviousMediaButtonWidget extends StatelessWidget {
  const PreviousMediaButtonWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isFirstSongNotifier,
      builder: (_, isFirst, __) {
        return IconButton(
          icon: const Icon(Icons.skip_previous_outlined),
          onPressed: isFirst ? null : pageManager.previous,
          color: Colors.white,
          disabledColor: Colors.white,
        );
      },
    );
  }
}