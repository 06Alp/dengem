import 'package:flutter/material.dart';
import 'package:dengem/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
        songName: 'Nocturne in B major',
        artistName: 'Chopin',
        albumeImagePath: 'assets/images/classic.jpg',
        audioPath: 'assets/audio/Chopin - Nocturne in B major.mp3'),
    Song(
        songName: 'Nocturne in E flat major',
        artistName: 'Chopin',
        albumeImagePath: 'assets/images/classic.jpg',
        audioPath: 'assets/audio/Chopin - Nocturne in E flat major.mp3'),
    Song(
        songName: 'Waltz in A minor',
        artistName: 'Chopin',
        albumeImagePath: 'assets/images/classic.jpg',
        audioPath: 'assets/audio/Chopin - Waltz in A minor.mp3')
  ];

  int? _currentSongIndex;

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
}
