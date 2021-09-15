import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalItem extends StatelessWidget {
  final String item;

  const HorizontalItem({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      margin: const EdgeInsets.fromLTRB(20, 10, 0, 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: SizedBox(
          height: 185,
          width: width * 0.8,
          child: Image.asset(
            "assets/icon/temp_img.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
