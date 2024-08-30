import 'package:audioplayers/audioplayers.dart';
import 'package:dengem/playlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:dengem/playlist_provider.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  _MusicPlayer createState() => _MusicPlayer();
}

class _MusicPlayer extends State<MusicPlayer> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  double progress = 0.0;
  bool isShuffling = false;
  bool isRepeating = false;
  Duration duration = Duration.zero;
  int musicIndex = 1;

  @override
  void initState() {
    super.initState();

    audioPlayer.onDurationChanged.listen((Duration newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((Duration newPosition) {
      setState(() {
        progress = newPosition.inMilliseconds.toDouble();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 218, 157, 74),
        centerTitle: true,
        title: const Text('Klasik Müzik'),
        actions: [
          IconButton(
              onPressed: () {} /*send to home page*/,
              icon: const Icon(
                Icons.close_rounded,
                size: 25,
              ))
        ],
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
                leading: const Icon(Icons.nature_outlined),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MusicPlayer(),
                      ));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ListTile(
                title: const Text('KLASİK MÜZİK'),
                leading: const Icon(Icons.music_note),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MusicPlayer(),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(150),
                      bottomRight: Radius.circular(150)),
                  color: Color.fromARGB(255, 218, 157, 74)),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    playlist[musicIndex].albumeImagePath,
                    height: 250,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    playlist[musicIndex].songName,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(playlist[musicIndex].artistName),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                        onPressed: () {
                          setState(() {
                            if (musicIndex == 0) {
                              musicIndex = playlist.length - 1;
                            } else {
                              musicIndex--;
                            }
                            audioPlayer.play(
                                AssetSource(playlist[musicIndex].audioPath));
                          });
                        },
                        icon: const Icon(Icons.skip_previous_rounded),
                        iconSize: 30,
                      ),
                      IconButton(
                        icon: Icon(
                          isPlaying
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          size: 50,
                        ),
                        onPressed: () async {
                          if (isPlaying) {
                            await audioPlayer.pause();
                          } else {
                            await audioPlayer.play(
                                AssetSource(playlist[musicIndex].audioPath));
                          }
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (musicIndex == playlist.length - 1) {
                              musicIndex = 0;
                            } else {
                              musicIndex++;
                            }
                            audioPlayer.play(
                                AssetSource(playlist[musicIndex].audioPath));
                          });
                        },
                        icon: const Icon(Icons.skip_next_rounded),
                        iconSize: 30,
                      ),
                      IconButton(
                        icon: Icon(Icons.repeat,
                            color: isRepeating ? Colors.blue : null),
                        onPressed: () {
                          setState(() {
                            isRepeating = !isRepeating;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Slider(
                    value: progress,
                    onChanged: (value) {
                      audioPlayer.seek(Duration(milliseconds: value.toInt()));
                    },
                    activeColor: const Color.fromARGB(255, 218, 157, 74),
                    min: 0.0,
                    max: duration.inMilliseconds.toDouble(),
                  ),
                ),
              ],
            ),
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
