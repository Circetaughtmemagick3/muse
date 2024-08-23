import 'package:flutter/material.dart';
import 'package:muse/Home/dialogbox.dart';
import 'package:muse/Home/moodspage.dart';
import 'package:muse/model/moods.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.blue.shade900],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.headphones,
                            size: 60,
                            color: Colors.tealAccent,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Welcome to Muse',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.tealAccent,
                              fontFamily: 'PlayfairDisplay',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Moods',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: MoodsData.moods.length + 1,
                        itemBuilder: (context, index) {
                          if (index == MoodsData.moods.length) {
                            return Center(
                              child: TextButton(
                                onPressed: () {
                                  // Handle 'View All' action for Moods
                                },
                                child: Text(
                                  'View All',
                                  style: TextStyle(
                                      color: Colors.tealAccent, fontSize: 16),
                                ),
                              ),
                            );
                          }
                          Mood mood = MoodsData.moods[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MoodsPage(
                                    moodName: mood.name,
                                    allSongs: [],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 160,
                              margin: EdgeInsets.only(right: 16),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      mood.imagePath,
                                      height: 200,
                                      width: 160,
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
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SongInputDialog(
                onSave: () {
                  setState(() {}); // Refresh state after saving
                },
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.tealAccent,
      ),
    );
  }
}
