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
  double progress = 0.0;
  Duration totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    // Listen for position changes
    audioPlayer.onPositionChanged.listen((Duration newPosition) {
      setState(() {
        progress = newPosition.inMilliseconds.toDouble();
      });
    });

    // Listen for duration updates
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        totalDuration = newDuration;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose(); // Release resources when the widget is destroyed
    super.dispose();
  }

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
          Slider(
            value: (totalDuration.inMilliseconds > 0)
                ? progress
                : 0.0, // Prevent invalid value
            min: 0.0,
            max: (totalDuration.inMilliseconds > 0)
                ? totalDuration.inMilliseconds.toDouble()
                : 1.0, // Avoid division by zero; default to a safe non-zero value
            onChanged: (value) async {
              if (totalDuration.inMilliseconds > 0) {
                await audioPlayer.seek(Duration(milliseconds: value.toInt()));
                setState(
                  () {
                    progress = value;
                  },
                );
              }
            },
          ),
          Text(
            '${formatDuration(Duration(milliseconds: progress.toInt()))} / ${formatDuration(totalDuration)}',
            style: TextStyle(fontSize: 16),
          ),
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

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return '$minutes:$seconds';
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

