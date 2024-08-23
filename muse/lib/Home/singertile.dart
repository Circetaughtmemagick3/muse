// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

// class SingerTile extends StatelessWidget {
//   final String singer;
//   final String userId;

//   SingerTile({required this.singer, required this.userId});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseDatabase.instance
//           .ref('users/$userId/playlists/default_playlist_id/moods')
//           .onValue,
//       builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
//         if (snapshot.hasData && !snapshot.hasError && snapshot.data != null) {
//           Map<dynamic, dynamic>? moods = snapshot.data!.snapshot.value as Map?;

//           if (moods == null || moods.isEmpty) {
//             return ListTile(
//               title: Text('No songs by $singer'),
//               tileColor: Colors.grey[800],
//             );
//           }

//           List<Map<String, dynamic>> singerSongs = [];

//           moods.forEach((mood, moodData) {
//             if (moodData['songs'] != null) {
//               (moodData['songs'] as Map<dynamic, dynamic>).forEach((key, song) {
//                 if (song['singer'].toLowerCase() == singer.toLowerCase()) {
//                   singerSongs.add({...song, 'mood': mood});
//                 }
//               });
//             }
//           });

//           if (singerSongs.isEmpty) {
//             return ListTile(
//               title: Text('No songs by $singer'),
//               tileColor: Colors.grey[800],
//             );
//           }

//           return ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: singerSongs.length,
//             itemBuilder: (context, index) {
//               var song = singerSongs[index];
//               return ListTile(
//                 title:
//                     Text(song['song'], style: TextStyle(color: Colors.white)),
//                 subtitle: Text('${song['mood']}',
//                     style: TextStyle(color: Colors.white70)),
//                 tileColor: Colors.grey[800],
//                 trailing: Icon(Icons.music_note, color: Colors.white),
//               );
//             },
//           );
//         } else if (snapshot.hasError) {
//           return ListTile(
//             title: Text('Error: ${snapshot.error}'),
//             tileColor: Colors.grey[800],
//           );
//         } else {
//           return ListTile(
//             title: Text('Loading...'),
//             tileColor: Colors.grey[800],
//           );
//         }
//       },
//     );
//   }
// }
