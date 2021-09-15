import 'package:flutter/material.dart';
import 'package:flutter_meditaion_demo/common/app_colors.dart';
import 'package:flutter_meditaion_demo/data/popular_data.dart';
import 'package:flutter_meditaion_demo/pages/home/widgets/seel_all_list_item_widget.dart';

import 'dashboard_details_list.dart';

const listItem = ['Mental Training', 'Gratitude', 'Free will 1', 'Free will 2'];
List<Item> listPopularMoodModel = PopularMoodModel.items;

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        children: <Widget>[
          // Container(
          //   height: 250,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       fit: BoxFit.cover,
          //       image: NetworkImage(
          //           'https://media.istockphoto.com/vectors/young-female-character-sitting-in-a-lotus-position-relaxation-and-vector-id1191578737?k=20&m=1191578737&s=612x612&w=0&h=j7H-vJXHOYOsVoFAZcNmDdk8u_T7lA0pfL0YpKhk6f4='),
          //     ),
          //   ),
          // ),
          Container(
            width: double.infinity,
            height: 250,
            color: Colors.white,
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage('assets/icon/home_header.png'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, right: 15),
            child: Row(children: [
              const Text(
                "Popular",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DashboardDetails(title: "Popular")),
                  );
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
            ]),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return SeeAllListItemWidget(listPopularMoodModel[index]);
              },
              itemCount: listPopularMoodModel.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 15),
            child: Row(children: [
              Text(
                "New",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
              ),
              Spacer(),
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardDetails(title: "New")),
                  );
                },
                child: Text(
                  "See All",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return SeeAllListItemWidget(listPopularMoodModel[index]);
              },
              itemCount: listItem.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
