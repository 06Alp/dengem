import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:dengem/playlist_provider.dart';

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  double progress = 0.0;
  bool isShuffling = false;
  bool isRepeating = false;
  Duration duration = Duration.zero;

  @override
  void initState() {
    super.initState();

    // Listen to audio duration changes
    audioPlayer.onDurationChanged.listen((Duration newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    // Listen to audio position changes
    audioPlayer.onPositionChanged.listen((Duration newPosition) {
      setState(() {
        progress = newPosition.inMilliseconds.toDouble();
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 218, 157, 74),
        centerTitle: true,
        title: const Text('Klasik Müzik'),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            const DrawerHeader(
                child: Center(
              child: Icon(
                Icons.headphones,
                size: 30,
                color: Color.fromARGB(255, 218, 157, 74),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ListTile(
                title: const Text('DOĞA SESİ'),
                leading: Icon(Icons.nature_outlined),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MusicPlayer(),
                      ));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ListTile(
                title: const Text('KLASİK MÜZİK'),
                leading: Icon(Icons.music_note),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MusicPlayer(),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(150),
                    bottomRight: Radius.circular(150)),
                color: Color.fromARGB(255, 218, 157, 74)),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                playlist[0].albumeImagePath,
                height: 200,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            playlist[0].songName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(playlist[0].artistName),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.shuffle,
                    color: isShuffling ? Colors.blue : null),
                onPressed: () {
                  setState(() {
                    isShuffling = !isShuffling;
                  });
                },
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.skip_previous_rounded),
                iconSize: 30,
              ),
              IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  size: 50,
                ),
                onPressed: () async {
                  if (isPlaying) {
                    await audioPlayer.pause();
                  } else {
                    await audioPlayer.play(AssetSource(playlist[0].audioPath));
                  }
                  setState(() {
                    isPlaying = !isPlaying;
                  });
                },
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.skip_next_rounded),
                iconSize: 30,
              ),
              IconButton(
                icon:
                    Icon(Icons.repeat, color: isRepeating ? Colors.blue : null),
                onPressed: () {
                  setState(() {
                    isRepeating = !isRepeating;
                  });
                },
              ),
            ],
          ),
          Slider(
            value: progress,
            onChanged: (value) {
              audioPlayer.seek(Duration(milliseconds: value.toInt()));
            },
            activeColor: Color.fromARGB(255, 218, 157, 74),
            min: 0.0,
            max: duration.inMilliseconds.toDouble(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
