import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_meditaion_demo/audioManager/playlist_repository.dart';
import 'package:flutter_meditaion_demo/pages/seeAll/widgets/horizontal_list_item_widget.dart';
import 'package:flutter_meditaion_demo/pages/seeAll/widgets/verticle_list_item_widget.dart';

import '../../inject_dependency.dart';

const listItem = ['Mental Training', 'Gratitude', 'Free will 1', 'Free will 2'];

class SeeAllWidget extends StatelessWidget {
  const SeeAllWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final songRepository = getIt<PlaylistRepository>();
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Practices",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return HorizontalItem(item: listItem[index]);
              },
              itemCount: listItem.length,
              shrinkWrap: true,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "All Practices",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          _buildMainListView(songRepository),
        ],
      ),
    );
  }

  Widget _buildMainListView(PlaylistRepository songRepository) {
    return FutureBuilder<List<MediaItem>>(
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return VerticalListItemWidget(index: index, item: snapshot.data![index].title.toString());
              },
              itemCount: snapshot.data?.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(bottom: 70),
              physics: const NeverScrollableScrollPhysics(),
            );
          } else {
            return const SizedBox.shrink();
          }
        } else {
          return const SizedBox.shrink();
        }
      },
      future: songRepository.fetchInitialPlaylist(),
    );
  }
}
