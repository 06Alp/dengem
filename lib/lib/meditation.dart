import 'package:audioplayers/audioplayers.dart';
import 'package:untitled6/ana_sayfa.dart';
import 'package:untitled6/meditation_provider.dart';
import 'package:flutter/material.dart';

class Meditation extends StatefulWidget {
  const Meditation({super.key});

  @override
  _Meditation createState() => _Meditation();
}

class _Meditation extends State<Meditation> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  double progress = 0.0;
  bool isShuffling = false;
  bool isRepeating = false;
  Duration duration = Duration.zero;
  int musicIndex = 0;
  Color themeColor = const Color.fromARGB(255, 247, 218, 186);


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
      backgroundColor: const Color.fromARGB(255, 247, 218, 186),
      appBar: AppBar(
        backgroundColor: themeColor,
        title: const Text('Ses Meditasyonu', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnaSayfa(),
                    ));
              } /*send to home page*/,
              icon: const Icon(
                Icons.close_rounded,
                size: 25,
              ))
        ],
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
                    'assets/images/meditation.png',
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
                    meditationList[musicIndex].songName,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (musicIndex == 0) {
                              musicIndex = meditationList.length - 1;
                            } else {
                              musicIndex--;
                            }
                            if (isPlaying == true) {
                              audioPlayer.play(AssetSource(
                                  meditationList[musicIndex].audioPath));
                            } else {
                              audioPlayer.pause();
                            }
                          });
                        },
                        icon: const Icon(Icons.skip_previous_rounded),
                        iconSize: 30,
                      ),
                      IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause_circle : Icons.play_circle,
                          size: 80,
                        ),
                        onPressed: () async {
                          if (isPlaying) {
                            await audioPlayer.pause();
                          } else {
                            await audioPlayer.play(
                                AssetSource(meditationList[musicIndex].audioPath));
                          }
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (musicIndex == meditationList.length - 1) {
                              musicIndex = 0;
                            } else {
                              musicIndex++;
                            }
                            if (isPlaying == true) {
                              audioPlayer.play(AssetSource(
                                  meditationList[musicIndex].audioPath));
                            } else {
                              audioPlayer.pause();
                            }
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
                    activeColor: Color.fromARGB(255, 70, 70, 68),
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