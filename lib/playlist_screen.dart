import 'package:dengem/playlist_provider.dart';
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
        itemCount: playlist.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(playlist[index].songName),
            subtitle: Text(playlist[index].artistName),
            onTap: () {
              // Navigate to the Play Screen with the selected song
            },
          );
        },
      ),
    );
  }
}