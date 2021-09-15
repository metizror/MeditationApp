import 'package:audio_service/audio_service.dart';


abstract class PlaylistRepository {
  Future<List<MediaItem>> fetchInitialPlaylist();
}

class DemoPlaylist extends PlaylistRepository {
  @override
  Future<List<MediaItem>> fetchInitialPlaylist(
      {int length = 4}) async {
    return List.generate(length, (index) => mediaItemList[index]);
  }
}

List<MediaItem> mediaItemList = [
  MediaItem(
    id: 'https://www.helpguide.org/wp-content/uploads/sleep-meditation-using-guided-imagery.mp3',
    album: 'Album 1',
    title: 'Guided Imagery',
    artist: 'Artist name',
    duration: const Duration(milliseconds: 620000),
    artUri: Uri.parse(
      'https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg',
    ),
  ),
  MediaItem(
      id: 'https://www.helpguide.org/wp-content/uploads/coping-uncertainty-meditation-with-music.mp3',
      album: 'Album 2',
      title: 'Coping Uncertainty',
      artist: 'Artist name',
      duration: const Duration(milliseconds: 535000),
      artUri: Uri.parse('https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg')),
  MediaItem(
    id: 'https://www.helpguide.org/wp-content/uploads/inner-strength-meditation-with-music.mp3',
    album: 'Album 3',
    title: 'Inner Strength',
    artist: 'Artist name',
    duration: const Duration(milliseconds: 366000),
    artUri: Uri.parse('https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg'),
  ),
  MediaItem(
    id: 'https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3',
    album: "Science A Salute To Head-Scratching Science",
    title: "Science Friday",
    artist: "Science Friday and WNYC Studios",
    duration: const Duration(milliseconds: 5739820),
    artUri: Uri.parse('https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg'),
  )
];
