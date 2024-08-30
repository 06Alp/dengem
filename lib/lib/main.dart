import 'package:dengem/music_player.dart';
import 'package:flutter/material.dart';
import 'package:dengem/list_screen.dart';
import 'package:dengem/introduction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MusicPlayer(), //call PsychologistSelectionScreen() to acces chat screen
    );
  }
}


