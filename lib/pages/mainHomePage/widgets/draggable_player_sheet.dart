import 'package:flutter/material.dart';
import 'package:flutter_meditaion_demo/inject_dependency.dart';
import 'package:flutter_meditaion_demo/valueNotifier/draggable_sheet_notifier.dart';

import 'player_widget.dart';

class DraggablePlayerSheet extends StatelessWidget {
  final double height;
  const DraggablePlayerSheet({required this.height, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final draggableSheetNotifier = getIt<DraggableSheetNotifier>();
    return ValueListenableBuilder(
      valueListenable: draggableSheetNotifier.draggableIsOpenValueNotifier,
      builder: (context, value, child) {
        final bool isOpen = value! as bool;
        debugPrint('the sheet open state : $isOpen');
        return isOpen
            ? DraggableScrollableSheet(
                initialChildSize: 0.1,
                minChildSize: 0.1,
                builder: (context, controller) {
                  calculateExpansion(controller,draggableSheetNotifier);
                  return ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    child: SizedBox(
                      height: height,
                      child: ListView.builder(
                          controller: controller,
                          itemCount: 1,
                          itemExtent: height,
                          itemBuilder: (context, index) {
                            return const PlayerWidget();
                          }),
                    ),
                  );
                })
            : const SizedBox.shrink();
      },
    );
  }
  void calculateExpansion(ScrollController controller,DraggableSheetNotifier draggableSheetNotifier){
    if (controller.hasClients) {
      final dimension = controller.position.viewportDimension;
      final _height = dimension / 0.1;
      final minScrollHeight = _height * 0.1 - 80;
      final percentageHeight = height / 9;
      debugPrint('the sheet scrolling updates : dimensions :$dimension \n minScrollHeight : $minScrollHeight \n totalHeight : $height \n percentageHeight : $percentageHeight',);
      if (minScrollHeight >= percentageHeight) {
        debugPrint("at top");
        draggableSheetNotifier.updateDraggableScrollViewPosition(true);
      } else {
        debugPrint("at bottom");
        draggableSheetNotifier.updateDraggableScrollViewPosition(false);
      }
    }
  }
}
