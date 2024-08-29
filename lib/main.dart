import 'package:dengem/music.dart';
import 'package:dengem/player_screen.dart';
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
      home: PlayerScreen(), //call PsychologistSelectionScreen() to acces chat screen
    );
  }
}


