import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drums_pad/services/musicData.dart';
import 'package:rxdart/rxdart.dart';

class MusicDataService {
  MusicDataService._();
  static Map<String, SongData> songDataCache = {};

  static Stream<List<SongData>> getSongs() {
    Query<dynamic> q = FirebaseFirestore.instance.collection('DemoSongs');
    return q
        .get()
        .asStream()
        .map(
          (event) => event.docs
              .map((e) =>
                  songDataCache[e.id] = SongData.fromJson(e.data(), e.id))
              .toList(),
        )
        .shareValue();
  }

  static Stream<SongData> streamSongs(String? id) {
    if (id == null) return Stream.value(SongData.invalid('unspecified'));
    final songStream = FirebaseFirestore.instance
        .collection('DemoSongs')
        .doc(id)
        .snapshots()
        .map((snap) {
      if (!snap.exists) return SongData.invalid(id);
      return songDataCache[id] = SongData.fromJson(snap.data()!, id);
    });

    if (songDataCache.containsKey(id)) {
      return ConcatEagerStream([
        Stream.value(songDataCache[id]!),
        songStream,
      ]);
    }
    return songStream;
  }
}
