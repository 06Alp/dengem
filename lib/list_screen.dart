import 'package:flutter/material.dart';
import 'package:dengem/chat_screen.dart';

class PsychologistSelectionScreen extends StatelessWidget {
  const PsychologistSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image covering the top part
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Back and Archive buttons
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: Icon(
              Icons.bookmark_border,
              color: Colors.white,
            ),
          ),
          // DraggableScrollableSheet for the list with only two positions
          DraggableScrollableSheet(
            initialChildSize: 0.65, // Starts mostly collapsed
            minChildSize: 0.65, // Collapsed state
            maxChildSize: 0.90, // Fully expanded state
            snap: true,
            builder: (context, scrollController) {
              return NotificationListener<DraggableScrollableNotification>(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    controller: scrollController,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    children: [
                      Text(
                        'Uzman Psikologlar',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      // Psychologist List
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/psikolog_ali.png'),
                        ),
                        title: Text('Psikolog Ali'),
                        subtitle: Text('Müsait'),
                        trailing: Icon(Icons.circle, color: Colors.green),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                psychologistName: 'Psikolog Ali',
                                psychologistProfilePicture:
                                    'assets/psikolog_ali.png',
                              ),
                            ),
                          );
                        },
                      ),
                      Divider(),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/psikolog_atlas.png'),
                        ),
                        title: Text('Psikolog Atlas'),
                        subtitle: Text('Müsait'),
                        trailing: Icon(Icons.circle, color: Colors.green),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                psychologistName: 'Psikolog Atlas',
                                psychologistProfilePicture:
                                    'assets/psikolog_atlas.png',
                              ),
                            ),
                          );
                        },
                      ),
                      Divider(),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/psikolog_basak.png'),
                        ),
                        title: Text('Psikolog Başak'),
                        subtitle: Text('Müsait değil'),
                        trailing: Icon(Icons.circle, color: Colors.red),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                psychologistName: 'Psikolog Başak',
                                psychologistProfilePicture:
                                    'assets/psikolog_basak.png',
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
