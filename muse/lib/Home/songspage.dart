// // lib/Home/songs_page.dart
// import 'package:flutter/material.dart';
// import 'package:muse/model/moods.dart';

// class SongsPage extends StatelessWidget {
//   final List<Song> songs;

//   SongsPage({required this.songs});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Songs'),
//         backgroundColor: Colors.blue.shade900,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.black, Colors.blue.shade900],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: ListView.builder(
//           itemCount: songs.length,
//           itemBuilder: (context, index) {
//             final song = songs[index];
//             return Card(
//               color: Colors.teal.shade100,
//               margin: EdgeInsets.all(10),
//               child: ListTile(
//                 title: Text(song.name, style: TextStyle(color: Colors.black)),
//                 subtitle: Text(song.singerName,
//                     style: TextStyle(color: Colors.black)),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
