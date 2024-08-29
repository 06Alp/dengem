import 'package:dengem/player_screen.dart';
import 'package:flutter/material.dart';

class Music extends StatelessWidget{
  const Music({super.key});

  @override
  Widget build(context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          /*shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),*/
          backgroundColor: Color.fromARGB(255, 142, 151, 253),
          centerTitle: true,
          title: Text('Music')),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            DrawerHeader(
                child: Center(
              child: Icon(
                Icons.music_note,
                size: 30,
                color: Color.fromARGB(255, 142, 151, 253),
              ),
            )),
            Padding(padding: EdgeInsets.only(left: 5),
            child: ListTile(title: Text('DOĞA SESİ'),leading: Icon(Icons.nature_outlined),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> PlayerScreen(),));
            },),)
          ],
        ),
      ),
    );
  }
}