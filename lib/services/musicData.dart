class SongData {
  SongData({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.genre,
    required this.imgUrl,
    required this.lasteditUser,
    required this.premium,
    required this.songUrl,
    required this.trending,
  });

  String id;
  String title;
  String subTitle;
  String genre;
  String imgUrl;
  String lasteditUser;
  bool premium;
  String songUrl;
  String trending;

  factory SongData.fromJson(Map<String, dynamic> json, String id) {
    return SongData(
      id: id,
      title: json['title'] ?? '...',
      subTitle: json['subTitle'] ?? '...',
      genre: json['genre'] ?? '...',
      imgUrl: json['imgUrl'] ?? '...',
      lasteditUser: json['lastEditBy'] ?? '...',
      premium: json['premium'] ?? true,
      songUrl: json['songUrl'] ?? '...',
      trending: json['trending'] ?? '...',
    );
  }

  static SongData invalid(String id) {
    return SongData(
      id: id,
      title: 'Error',
      subTitle: 'Error',
      genre: 'Error',
      imgUrl: 'Error',
      lasteditUser: 'Error',
      premium: false,
      songUrl: 'Error',
      trending: 'Error',
    );
  }
}
