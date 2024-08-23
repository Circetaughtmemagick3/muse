// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:muse/model/moods.dart';

// class FirestoreService {
//   static Future<List<Mood>> fetchMoods() async {
//     final QuerySnapshot snapshot =
//         await FirebaseFirestore.instance.collection('moods').get();
//     return snapshot.docs.map((doc) {
//       final data = doc.data() as Map<String, dynamic>;
//       return Mood(
//         name: data['name'],
//         imagePath: data['imagePath'],
//         songs: [],
//       );
//     }).toList();
//   }

//   static Future<List<Singer>> fetchSingers() async {
//     final QuerySnapshot snapshot =
//         await FirebaseFirestore.instance.collection('singers').get();
//     return Future.wait(snapshot.docs.map((doc) async {
//       final data = doc.data() as Map<String, dynamic>;
//       final songsSnapshot = await FirebaseFirestore.instance
//           .collection('singers')
//           .doc(doc.id)
//           .collection('songs')
//           .get();
//       final songs = songsSnapshot.docs.map((songDoc) {
//         final songData = songDoc.data() as Map<String, dynamic>;
//         return Song(
//           name: songData['name'],
//           imagePath: songData['imagePath'],
//           singerName: data['name'],
//           moodName: songData[
//               'moodName'], // Make sure this field exists in your Firestore document
//         );
//       }).toList();
//       return Singer(
//         name: data['name'],
//         imagePath: data['imagePath'],
//         songs: songs,
//       );
//     }).toList());
//   }
// }
