import 'package:flutter/material.dart';



class ChatScreen extends StatelessWidget {
  final String psychologistName, psychologistProfilePicture;

  const ChatScreen({super.key, required this.psychologistName, required this.psychologistProfilePicture});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          psychologistName,
          style: const TextStyle(color: Colors.black),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Back') {
                Navigator.pop(context);
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Back'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                const ChatBubble(
                  text: "Selam",
                  isSentByMe: true,
                  time: "9:24",
                  isRead: true,
                ),
                const ChatBubble(
                  text: "Günüm çok kötü gidiyor, hiçbir şey istediğim gibi değil.",
                  isSentByMe: true,
                  time: "9:30",
                  isRead: true,
                ),
                ChatBubble(
                  text: "Merhaba",
                  isSentByMe: false,
                  time: "9:34",
                  isRead: true,
                  profileImage: AssetImage(psychologistProfilePicture),
                ),
                ChatBubble(
                  text: "Seni bu noktaya getiren nedir?",
                  isSentByMe: false,
                  time: "9:35",
                  isRead: true,
                  profileImage: AssetImage(psychologistProfilePicture),
                ),
                const ChatBubble(
                  text: "Bugün ilk iş görüşmem vardı ama anksiyetemden ötürü hiç konuşamadım.",
                  isSentByMe: true,
                  time: "9:37",
                  isRead: true,
                ),
                ChatBubble(
                  text: "Offf...",
                  isSentByMe: true,
                  time: "9:39",
                  isRead: true,
                  profileImage: AssetImage(psychologistProfilePicture),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Mesaj yazınız",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.mic, color: Colors.blue),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSentByMe;
  final String time;
  final bool isRead;
  final AssetImage? profileImage;

  const ChatBubble({super.key, 
    required this.text,
    required this.isSentByMe,
    required this.time,
    required this.isRead,
    this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          if (!isSentByMe && profileImage != null)
            CircleAvatar(
              backgroundImage: profileImage,
            ),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: isSentByMe ? Colors.blue[100] : Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                      if (isSentByMe)
                        const SizedBox(width: 5),
                      if (isSentByMe && isRead)
                        const Icon(
                          Icons.done_all,
                          color: Colors.blue,
                          size: 14,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
