import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatefulWidget {
  MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

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
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  if (isPlaying) {
                    audioPlayer.pause();
                  } else {
                    audioPlayer.play(AssetSource('N95.mp3'));
                  }
                  setState(() {
                    isPlaying = !isPlaying;
                  });
                },
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

