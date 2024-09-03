import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled6/ana_sayfa.dart';
import 'package:untitled6/classic_music_player.dart';
import 'package:untitled6/list_screen.dart';
import 'package:untitled6/profil_sayfa.dart';

class Task {
  final String title;
  final String subtitle;
  final String imagePath;

  Task({required this.title, required this.subtitle, required this.imagePath});
}

class TumGorev extends StatelessWidget {
  final List<Task> tasks = [
    Task(
      title: 'İş Başvurusu',
      subtitle: 'Okuma Süresi: 10dk',
      imagePath: 'assets/images/gorsel7.JPG',
    ),
    Task(
      title: 'Topluluk Önünde Konuşmak',
      subtitle: 'Okuma Süresi: 8dk',
      imagePath: 'assets/images/gorsel7.JPG',
    ),
    Task(
      title: 'Arkadaş Edinme',
      subtitle: 'Okuma Süresi: 10dk',
      imagePath: 'assets/images/gorsel7.JPG',
    ),
    Task(
      title: 'Sohbet etme',
      subtitle: 'Okuma Süresi: 4dk',
      imagePath: 'assets/images/gorsel7.JPG',
    ),
    Task(
      title: 'Sohbet etme',
      subtitle: 'Okuma Süresi: 4dk',
      imagePath: 'assets/images/gorsel7.JPG',
    ),
    Task(
      title: 'Sohbet etme',
      subtitle: 'Okuma Süresi: 4dk',
      imagePath: 'assets/images/gorsel7.JPG',
    ),
    Task(
      title: 'Sohbet etme',
      subtitle: 'Okuma Süresi: 4dk',
      imagePath: 'assets/images/gorsel7.JPG',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('GÖREVLER',
            style:
                GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          //geri tuşuna basıldığında ne olsun
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AnaSayfa()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '  Tüm Görevler',
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Butona tıklanınca yapılacak işlemler burada
                      print('${tasks[index].title} tıklandı');
                    },
                    child: Card(
                      color: Colors.white, //kart rengi
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                tasks[index].imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tasks[index].title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  tasks[index].subtitle,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Müzik',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Yanındayım',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
        onTap: (i) {
          if (i == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AnaSayfa()),
            );
          }
          if (i == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ClassicMusicPlayer()),
            );
          }
          if (i == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PsychologistSelectionScreen()),
            );
          }
          if (i == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => profil()),
            );
          }
        },
      ),
    );
  }
}
