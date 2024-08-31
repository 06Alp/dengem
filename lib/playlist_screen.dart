import 'package:dengem/classic_music_provider.dart';
import 'package:flutter/material.dart';


class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playlist'),
      ),
      body: ListView.builder(
        itemCount: classicList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(classicList[index].songName),
            subtitle: Text(classicList[index].artistName),
            onTap: () {
              // Navigate to the Play Screen with the selected song
            },
          );
        },
      ),
    );
  }
}