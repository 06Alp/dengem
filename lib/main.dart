import 'package:dengem/classic_music_player.dart';
import 'package:dengem/sound_meditation.dart';
import 'package:flutter/material.dart';
import 'package:dengem/list_screen.dart';
import 'package:dengem/introduction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ClassicMusicPlayer(), //call PsychologistSelectionScreen() to acces chat screen
    );
  }
}


