import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meditaion_demo/audioManager/page_manager.dart';
import 'package:flutter_meditaion_demo/inject_dependency.dart';
import 'package:flutter_meditaion_demo/pages/mainHomePage/widgets/media_play_button_widget.dart';
import 'package:flutter_meditaion_demo/pages/mainHomePage/widgets/media_progress_bar_widget.dart';
import 'package:flutter_meditaion_demo/pages/mainHomePage/widgets/previous_media_button_widget.dart';

import 'package:flutter_meditaion_demo/valueNotifier/draggable_sheet_notifier.dart';

import 'media_title_widget.dart';
import 'next_media_button_widget.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final draggableSheetNotifier = getIt<DraggableSheetNotifier>();
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/icon/temp_img_2.png',
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
          child: Column(
            children: [
              _buildPlayerControlOrHeaderView(draggableSheetNotifier),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 30,
                  ),
                  PreviousMediaButtonWidget(),
                  MediaPlayButtonWidget(),
                  NextMediaButtonWidget(),
                  Icon(
                    Icons.shuffle_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const AudioProgressBarWidget(),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPlayerControlOrHeaderView(DraggableSheetNotifier draggableSheetNotifier) {
    return ValueListenableBuilder(
      valueListenable: draggableSheetNotifier.draggableExpansionValueNotifier,
      builder: (context, value, child) {
        final bool isExpanded = value! as bool;
        return isExpanded
            ? Stack(children: [
                const Align(
                  child: MediaTitleWidget(),
                ),
                Positioned(
                  right: 10,
                  child: _buildMediaClearIcon(),
                )
              ])
            : Row(
                children: [
                  const MediaTitleWidget(),
                  const Spacer(),
                  const MediaPlayButtonWidget(),
                  const SizedBox(
                    width: 10,
                  ),
                  _buildMediaClearIcon(),
                ],
              );
      },
    );
  }

  Widget _buildMediaClearIcon() {
    final draggableSheetNotifier = getIt<DraggableSheetNotifier>();
    final pageHandler = getIt<PageManager>();
    return InkWell(
        onTap: () {
          draggableSheetNotifier.updateDraggableShouldOpen(false);
          draggableSheetNotifier.updateDraggableScrollViewPosition(false);
          pageHandler.stop();
        },
        child: const Icon(
          Icons.clear,
          color: Colors.white,
        ));
  }
}
