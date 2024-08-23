// import 'package:flutter/material.dart';
// import 'package:muse/Home/singertile.dart';
// import 'package:muse/model/moods.dart';

// class SingerSongsPage extends StatelessWidget {
//   final Singer singer;
//   final String userId;

//   SingerSongsPage({required this.singer, required this.userId});

//   @override
//   Widget build(BuildContext context) {
//     print("Building SingerSongsPage for ${singer.name}");
//     print("Number of songs: ${singer.songs.length}");
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(singer.name),
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
//         child: SingerTile(singer: singer.name, userId: userId),
//       ),
//     );
//   }
// }
