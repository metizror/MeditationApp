class NewModel {
  static final items_new = [
    ItemNew(
        id: 1,
        mood_tilte: "Anxiety",
        mood_sub_tilte: "Turn down the stress volume",
        desc: "7 steps | 5-11 min ",
        image: "assets/icon/temp_img.jpg"),
    ItemNew(
        id: 2,
        mood_tilte: "Mental training",
        mood_sub_tilte: "Turn down the stress volume",
        desc: "7 steps | 5-11 min ",
        image: "assets/icon/temp_img.jpg"),
    ItemNew(
        id: 3,
        mood_tilte: "Gratitude",
        mood_sub_tilte: "Turn down the stress volume",
        desc: "7 steps | 5-11 min ",
        image: "assets/icon/temp_img.jpg"),
    ItemNew(
        id: 3,
        mood_tilte: "Gratitude",
        mood_sub_tilte: "Turn down the stress volume",
        desc: "7 steps | 5-11 min ",
        image: "assets/icon/temp_img.jpg"),
  ];
}

class ItemNew {
  final int id;
  final String mood_tilte;
  final String mood_sub_tilte;
  final String desc;
  final String image;

  ItemNew({
    required this.id,
    required this.mood_tilte,
    required this.mood_sub_tilte,
    required this.desc,
    required this.image,
  });
}
