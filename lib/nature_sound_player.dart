import 'package:audioplayers/audioplayers.dart';
import 'package:dengem/classic_music_player.dart';
import 'package:dengem/home.dart';
import 'package:dengem/nature_sound_provider.dart';
import 'package:flutter/material.dart';

class NatureSoundPlayer extends StatefulWidget {
  const NatureSoundPlayer({super.key});

  @override
  _NatureSoundPlayer createState() => _NatureSoundPlayer();
}

class _NatureSoundPlayer extends State<NatureSoundPlayer> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  double progress = 0.0;
  bool isShuffling = false;
  bool isRepeating = false;
  Duration duration = Duration.zero;
  int musicIndex = 1;
  Color themeColor = const Color.fromARGB(255, 76, 116, 109);

  List<String> songs = [
    natureList[0].audioPath,
    natureList[1].audioPath,
    natureList[2].audioPath,
  ];

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
        backgroundColor: themeColor,
        title: const Text('Doğa Sesleri',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ));
              },
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
            DrawerHeader(
                child: Center(
              child: Icon(
                Icons.headphones,
                size: 30,
                color: themeColor,
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ListTile(
                title: const Text('DOĞA SESİ'),
                leading: const Icon(Icons.nature_outlined),
                onTap: () {
                  audioPlayer.stop();
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NatureSoundPlayer(),
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
                  audioPlayer.stop();
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ClassicMusicPlayer(),
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
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(150),
                      bottomRight: Radius.circular(150)),
                  color: themeColor),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    natureList[musicIndex].albumeImagePath,
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
                    natureList[musicIndex].songName,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(natureList[musicIndex].artistName),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (musicIndex == 0) {
                              musicIndex = natureList.length - 1;
                            } else {
                              musicIndex--;
                            }
                            audioPlayer.play(
                                AssetSource(natureList[musicIndex].audioPath));
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
                                AssetSource(natureList[musicIndex].audioPath));
                          }
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (musicIndex == natureList.length - 1) {
                              musicIndex = 0;
                            } else {
                              musicIndex++;
                            }
                            audioPlayer.play(
                                AssetSource(natureList[musicIndex].audioPath));
                          });
                        },
                        icon: const Icon(Icons.skip_next_rounded),
                        iconSize: 30,
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
                    activeColor: themeColor,
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
