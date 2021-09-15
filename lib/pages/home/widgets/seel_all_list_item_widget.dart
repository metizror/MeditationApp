import 'package:flutter/material.dart';
import 'package:flutter_meditaion_demo/data/popular_data.dart';

class SeeAllListItemWidget extends StatefulWidget {

  Item items;

  SeeAllListItemWidget(this.items);



  @override
  _SeeAllListItemState createState() => _SeeAllListItemState();
}

class _SeeAllListItemState extends State<SeeAllListItemWidget>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (BuildContext ctx, BoxConstraints constraints) {
      return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        margin: const EdgeInsets.fromLTRB(20, 10, 0, 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: SizedBox(
            height: 270,
            width: width * 0.8,
            child: Stack(fit: StackFit.expand, children: [
              Image.asset(
                "assets/icon/temp_img.jpg",
                fit: BoxFit.cover,
              ),
              Container(color: Colors.black26),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: constraints.maxHeight * 0.3,
                      child: Text(
                        widget.items.mood_tilte,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.3,
                      child: Text(
                        widget.items.mood_sub_tilte,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    Text(
                      widget.items.desc.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      );
    });
  }

}

// const SeeAllListItemWidget({Key? key}) : super(key: key);

