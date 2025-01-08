import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatelessWidget {
  const MusicPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/clad.jpg'),
          SizedBox(height: 20),
          Text(
            'Song Title',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text('Artist Name'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.skip_previous),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.skip_next),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PlaylistScreen extends StatelessWidget {
  final List<Song> songs; // Replace Song with your song model

  const PlaylistScreen({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playlist'),
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(songs[index].title),
            subtitle: Text(songs[index].artist),
            onTap: () {
              // Navigate to the Play Screen with the selected song
            },
          );
        },
      ),
    );
  }
}

// Example Song class (replace this with your actual model)
class Song {
  final String title;
  final String artist;

  Song(this.title, this.artist);
}

// FlutterError