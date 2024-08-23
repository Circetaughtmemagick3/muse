// import 'package:flutter/material.dart';
// import 'package:muse/model/moods.dart';
// import 'package:muse/Home/singersongs.dart';

// class ViewAllSingersPage extends StatelessWidget {
//   final List<Singer> singers;

//   ViewAllSingersPage({required this.singers});

//   get userId => null;

//   @override
//   Widget build(BuildContext context) {
//     print("Building ViewAllSingersPage with ${singers.length} singers");
//     for (var singer in singers) {
//       print("${singer.name}: ${singer.songs.length} songs");
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('All Singers'),
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
//           itemCount: singers.length,
//           itemBuilder: (context, index) {
//             final singer = singers[index];
//             return Card(
//               color: Colors.blue.shade700.withOpacity(0.5),
//               margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: ListTile(
//                 leading: CircleAvatar(
//                   radius: 30,
//                   backgroundImage: AssetImage(singer.imagePath),
//                 ),
//                 title: Text(
//                   singer.name,
//                   style: TextStyle(color: Colors.white, fontSize: 18),
//                 ),
//                 subtitle: Text(
//                   '${singer.songs.length} songs',
//                   style: TextStyle(color: Colors.white70),
//                 ),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           SingerSongsPage(singer: singer, userId: userId),
//                     ),
//                   );
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
