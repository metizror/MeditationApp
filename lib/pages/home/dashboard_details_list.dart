import 'package:flutter/material.dart';
import 'package:flutter_meditaion_demo/data/new_data.dart';
import 'package:flutter_meditaion_demo/data/popular_data.dart';

class DashboardDetails extends StatefulWidget {

  const DashboardDetails({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _DashboardDetailsState createState() => _DashboardDetailsState();
}

class _DashboardDetailsState extends State<DashboardDetails> {
  List listPopularMoodModel = [];
  List listNewModel = [];

  @override
  void initState() {
    // TODO: implement initState
    listPopularMoodModel = PopularMoodModel.items;
    listNewModel = NewModel.items_new;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.title == "Popular") {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return _buildListViewPopular(context, listPopularMoodModel[index] as Item);
          },
          itemCount: listNewModel.length,
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return _buildListViewNew(context, listNewModel[index] as ItemNew);
          },
          itemCount: listNewModel.length,
        ),
      );
     // return _buildListViewNew(context);
    }
  }

  Widget _buildListViewPopular(BuildContext context, Item item) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Container(
          width: 90,
          height: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(item.image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        title: Text(
          item.mood_tilte,
          style: TextStyle(fontSize: 16),
        ),
        subtitle: Text(item.mood_sub_tilte),
        trailing: Icon(
          Icons.favorite_border_outlined,
        ),
      ),
    );
  }

  Widget _buildListViewNew(BuildContext context, ItemNew itemNew) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Container(
          width: 90,
          height: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(itemNew.image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        title: Text(
          itemNew.mood_tilte,
          style: TextStyle(fontSize: 16),
        ),
        subtitle: Text(itemNew.mood_sub_tilte),
        trailing: Icon(
          Icons.favorite_border_outlined,
        ),
      ),
    );
  }
}
