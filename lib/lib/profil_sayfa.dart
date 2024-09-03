import 'package:flutter/material.dart';
import 'package:untitled6/ana_sayfa.dart';
import 'package:untitled6/classic_music_player.dart';
import 'package:untitled6/list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: profil(),
    );
  }
}

class profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true, // Başlığı ortalar
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AnaSayfa()),
            );
          },
        ),
        title: Text(
          "Hesabım",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.person_outline),
                    title: Text('Profilim'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Profilim sayfasına yönlendirme kodu
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.receipt_outlined),
                    title: Text('Ödemelerim'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Ödemelerim sayfasına yönlendirme kodu
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.credit_card_outlined),
                    title: Text('Ödeme Yöntemlerim'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Ödeme Yöntemlerim sayfasına yönlendirme kodu
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.notifications_outlined),
                    title: Text('Bildirimler'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Bildirimler sayfasına yönlendirme kodu
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.lock_outline),
                    title: Text('Gizlilik Politikası'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Gizlilik Politikası sayfasına yönlendirme kodu
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.help_outline),
                    title: Text('Yardım'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Yardım sayfasına yönlendirme kodu
                    },
                  ),
                  Divider(),
                ],
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.power_settings_new, color: Colors.red),
              title: Text('OTURUMU KAPAT', style: TextStyle(color: Colors.red)),
              onTap: () {
                // Oturumu kapatma işlemi
              },
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
