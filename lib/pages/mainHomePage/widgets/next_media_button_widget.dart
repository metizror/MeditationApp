import 'package:flutter/material.dart';
import 'package:flutter_meditaion_demo/audioManager/page_manager.dart';
import 'package:flutter_meditaion_demo/inject_dependency.dart';


class NextMediaButtonWidget extends StatelessWidget {
  const NextMediaButtonWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isLastSongNotifier,
      builder: (_, isLast, __) {
        return IconButton(
          icon: const Icon(Icons.skip_next_outlined),
          onPressed: isLast ? null : pageManager.next,
          color: Colors.white,
          disabledColor: Colors.white,
        );
      },
    );
  }
}