class Mood {
  final String name;
  final String imagePath;
  final List<Song> songs;

  Mood({required this.name, required this.imagePath, required this.songs});
}

class Singer {
  final String name;
  final String imagePath;
  List<Song> songs;

  Singer({required this.name, required this.imagePath, required this.songs});
}

class MoodsData {
  static List<Mood> moods = [
    Mood(name: 'Happy', imagePath: 'lib/assets/songs/happy.jpeg', songs: []),
    Mood(name: 'Lofi', imagePath: 'lib/assets/songs/lofi.jpeg', songs: []),
    Mood(
        name: 'Nostalgic',
        imagePath: 'lib/assets/songs/nostalgic.jpeg',
        songs: []),
    Mood(name: 'Party', imagePath: 'lib/assets/songs/party.jpeg', songs: []),
    Mood(
        name: 'Romantic',
        imagePath: 'lib/assets/songs/romantic.jpeg',
        songs: []),
    Mood(name: 'Sad', imagePath: 'lib/assets/songs/sad.jpeg', songs: []),
  ];
}

class Song {
  final String name;
  final String imagePath;
  final String singerName;
  final String moodName;

  Song({
    required this.name,
    required this.imagePath,
    required this.singerName,
    required this.moodName,
  });
}
