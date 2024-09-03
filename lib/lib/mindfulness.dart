import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/ana_sayfa.dart';

class Mindfulness extends StatefulWidget {
  const Mindfulness({super.key});

  @override
  _Mindfulness createState() => _Mindfulness();
}

class _Mindfulness extends State<Mindfulness> {
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  double progress = 0.0;
  bool isShuffling = false;
  bool isRepeating = false;
  Duration duration = Duration.zero;
  Color themeColor = const Color.fromARGB(255, 236, 245, 218);

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
      backgroundColor: const Color.fromARGB(255, 236, 245, 218),
      appBar: AppBar(
        backgroundColor: themeColor,
        title: const Text(
          'Mindfulness',
          style: TextStyle(
              color: Color.fromARGB(255, 99, 99, 96),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        
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
                    'assets/images/mindfulness.png',
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Farkındalık Meditasyonu',
                    style: TextStyle(
                        color: Color.fromARGB(255, 99, 99, 96),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause_circle : Icons.play_circle,
                          size: 80,
                        ),
                        onPressed: () async {
                          if (isPlaying) {
                            await audioPlayer.pause();
                          } else {
                            await audioPlayer.play(AssetSource(
                                'audio/meditation/Farkindalik.mp3'));
                          }
                          setState(() {
                            isPlaying = !isPlaying;
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
                    activeColor: Colors.black,
                    inactiveColor: Color.fromARGB(255, 99, 99, 96),
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
