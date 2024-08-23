// import 'package:flutter/material.dart';
// import 'package:muse/model/moods.dart';

// class MoodsPage extends StatelessWidget {
//   final String moodName;
//   final List<Song> allSongs;

//   MoodsPage({required this.moodName, required this.allSongs});

//   @override
//   Widget build(BuildContext context) {
//     List<Song> filteredSongs =
//         allSongs.where((song) => song.moodName == moodName).toList();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$moodName Songs'),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       extendBodyBehindAppBar: true,
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Colors.blue.shade900, Colors.purple.shade900],
//           ),
//         ),
//         child: filteredSongs.isEmpty
//             ? Center(
//                 child: Text(
//                   'No songs found for this mood.',
//                   style: TextStyle(color: Colors.white, fontSize: 18),
//                 ),
//               )
//             : ListView.builder(
//                 itemCount: filteredSongs.length,
//                 itemBuilder: (context, index) {
//                   final song = filteredSongs[index];
//                   return Card(
//                     color: Colors.white.withOpacity(0.1),
//                     margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: ListTile(
//                       contentPadding: EdgeInsets.all(16),
//                       leading: ClipRRect(
//                         borderRadius: BorderRadius.circular(8),
//                         child: Image.asset(
//                           song.imagePath,
//                           width: 60,
//                           height: 60,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       title: Text(
//                         song.name,
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.bold),
//                       ),
//                       subtitle: Text(
//                         'Singer: ${song.singerName}',
//                         style: TextStyle(color: Colors.white.withOpacity(0.7)),
//                       ),
//                       onTap: () {
//                         // Handle song tap
//                       },
//                     ),
//                   );
//                 },
//               ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:muse/model/moods.dart';

class MoodsPage extends StatelessWidget {
  final String moodName;
  final List<dynamic> allSongs;

  MoodsPage({required this.moodName, required this.allSongs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(moodName),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.blue.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GridView.builder(
          padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: MoodsData.moods.length,
          itemBuilder: (context, index) {
            Mood mood = MoodsData.moods[index];
            return GestureDetector(
              onTap: () {
                // Handle the tap event to navigate to another page or play songs related to the mood
                // For example:
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => SongsPage(mood: mood),
                //   ),
                // );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    Image.asset(
                      mood.imagePath,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned.fill(
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.black.withOpacity(0.4),
                        child: Text(
                          mood.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
