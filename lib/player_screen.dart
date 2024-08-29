import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(150),
                      bottomRight: Radius.circular(150)),
                  color: Color.fromARGB(255, 218, 157, 74)),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/classic.jpg',
                    height: 200,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(
            child: Column(
              children: [Text('Music name'), Text('Artis')],
            ),
          )),
          Expanded(
            flex: 3,
            child: Container(
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.skip_previous,
                        size: 60,
                      ),
                      Icon(
                        Icons.pause_circle,
                        size: 80,
                      ),
                      Icon(
                        Icons.skip_next,
                        size: 60,
                      )
                    ],
                  ),
                  Slider(min: 0, max: 100, value: 20, activeColor: Colors.black12,onChanged: null, ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
