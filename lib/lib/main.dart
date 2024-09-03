import 'package:flutter/material.dart';
import 'package:untitled6/ana_sayfa.dart';
import 'package:untitled6/tumunu_gor_gorevler.dart';
import 'package:untitled6/introduction.dart';
import 'package:untitled6/loadingscreen.dart';
import 'package:untitled6/breathe.dart';
import 'package:untitled6/profil_sayfa.dart';

void main() {
  runApp(MaterialApp(
    home: Introduction(),
  ));
}


class AnaUygulama extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: profil(),
    );
  }

}