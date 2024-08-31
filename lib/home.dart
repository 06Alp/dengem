import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text('Home Page', textAlign: TextAlign.center)),
    );
  }
}
