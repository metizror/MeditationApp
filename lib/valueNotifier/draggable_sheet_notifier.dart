import 'package:flutter/foundation.dart';

class DraggableSheetNotifier {
  final ValueNotifier _draggableExpansionValueNotifier = ValueNotifier(false);
  final ValueNotifier _draggableIsOpenValueNotifier = ValueNotifier(true);

  Future<void> updateDraggableScrollViewPosition(bool isExpanded) async => _draggableExpansionValueNotifier.value = isExpanded;

  Future<void> updateDraggableShouldOpen(bool open) async => _draggableIsOpenValueNotifier.value = open;

  ValueNotifier get draggableIsOpenValueNotifier => _draggableIsOpenValueNotifier;

  ValueNotifier get draggableExpansionValueNotifier => _draggableExpansionValueNotifier;


}
