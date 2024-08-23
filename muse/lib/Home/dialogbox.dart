import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SongInputDialog extends StatefulWidget {
  final VoidCallback onSave;

  SongInputDialog({required this.onSave});

  @override
  _SongInputDialogState createState() => _SongInputDialogState();
}

class _SongInputDialogState extends State<SongInputDialog> {
  final TextEditingController _singerController = TextEditingController();
  final TextEditingController _songController = TextEditingController();
  String _selectedCategory = 'Select Category';

  List<String> categories = [
    'Select Category',
    'Sad/Melancholic',
    'Happy/Joyful',
    'Motivational',
    'Romantic',
    'Aggressive',
    'Nostalgic'
  ];

  void _saveSong() async {
    String singer = _singerController.text.trim();
    String song = _songController.text.trim();
    String category = _selectedCategory;

    if (singer.isNotEmpty && song.isNotEmpty && category != 'Select Category') {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        // Save the singer
        List<String> singers = prefs.getStringList('singers') ?? [];
        if (!singers.contains(singer)) {
          singers.add(singer);
          await prefs.setStringList('singers', singers);
        }

        // Save the song
        List<String> singerSongs = prefs.getStringList(singer) ?? [];
        singerSongs.add('$song|$category');
        await prefs.setStringList(singer, singerSongs);

        widget.onSave();
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Song added successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      } catch (e) {
        print('Error saving song: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occurred: $e'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all fields and select a category'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFF2E3A59), // Dark blue background
      title: Text('Add New Song', style: TextStyle(color: Colors.tealAccent)),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _singerController,
              decoration: InputDecoration(
                hintText: "Enter singer name",
                hintStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Color(0xFF1C2630), // Darker grey background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _songController,
              decoration: InputDecoration(
                hintText: "Enter song name",
                hintStyle: TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Color(0xFF1C2630), // Darker grey background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              items: categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category, style: TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCategory = newValue!;
                });
              },
              dropdownColor: Color(0xFF1C2630), // Darker grey background
              style: TextStyle(color: Colors.white),
              isExpanded: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF1C2630), // Darker grey background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel', style: TextStyle(color: Colors.tealAccent)),
        ),
        TextButton(
          onPressed: _saveSong,
          child: Text('Save', style: TextStyle(color: Colors.tealAccent)),
        ),
      ],
    );
  }
}

extension StringCasing on String {
  String capitalize() {
    if (this == null || this.isEmpty) return '';
    return '${this[0].toUpperCase()}${this.substring(1).toLowerCase()}';
  }
}
