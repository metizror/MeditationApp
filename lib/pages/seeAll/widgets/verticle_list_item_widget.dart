import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meditaion_demo/audioManager/page_manager.dart';

import '../../../inject_dependency.dart';

class VerticalListItemWidget extends StatelessWidget {
  final String item;
  final int index;

  const VerticalListItemWidget({
    required this.index,
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playerManager = getIt<PageManager>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      child: InkWell(
        onTap: () {
          playerManager.playSpecificSong(index);
        },
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: SizedBox(
                      width: 100,
                      height: 70,
                      child: Image.asset('assets/icon/temp_img.jpg', fit: BoxFit.cover),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              item.toString(),
                              maxLines: 2,
                              softWrap: true,
                              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              '2 min 33 sec',
                              softWrap: true,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  height: 1,
                  color: Colors.black26,
                ))
          ],
        ),
      ),
    );
  }
}
