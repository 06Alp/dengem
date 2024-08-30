import 'package:flutter/material.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});
  @override
  State<Introduction> createState() {
    return _Introduction();
  }
}

class _Introduction extends State<Introduction> {
  String currentPicture = 'assets/images/rb.png';
  String currentText1 = 'RAHAT BAŞLANGIÇ';
  String currentText2 = 'Güne rahat ve sakin başlangıç';

  Widget currentLarge = Container(
    width: 30,
    height: 5,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 142, 151, 253),
      borderRadius: BorderRadius.circular(30),
    ),
  );

  Widget currentMedium = Container(
    width: 15,
    height: 5,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 175, 145, 193),
      borderRadius: BorderRadius.circular(30),
    ),
  );

  Widget currentSmall = Container(
    width: 10,
    height: 5,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 175, 145, 193),
      borderRadius: BorderRadius.circular(30),
    ),
  );

  var pageNo = 1;

  void changePageInfo() {
    if (pageNo == 1) {
      setState(() {
        currentPicture = 'assets/images/hbs.png';
        currentText1 = 'HUZURLU BİR SABAH';
        currentText2 = 'Huzurlu bir güne küçük bir adım';
        currentLarge = Container(
          width: 15,
          height: 5,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 175, 145, 193),
            borderRadius: BorderRadius.circular(30),
          ),
        );
        currentMedium = Container(
          width: 30,
          height: 5,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 142, 151, 253),
            borderRadius: BorderRadius.circular(30),
          ),
        );
      });
    }

    if (pageNo == 2) {
      setState(() {
        currentPicture = 'assets/images/sbg.png';
        currentText1 = 'STRESSİZ BİR GÜN';
        currentText2 = 'Zihnini sakinleştirmek için meditasyonun huzur dolu dünyasına hoş geldin';
        currentLarge = Container(
          width: 10,
          height: 5,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 175, 145, 193),
            borderRadius: BorderRadius.circular(30),
          ),
        );
        currentMedium = Container(
          width: 15,
          height: 5,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 175, 145, 193),
            borderRadius: BorderRadius.circular(30),
          ),
        );
        currentSmall = Container(
          width: 30,
          height: 5,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 142, 151, 253),
            borderRadius: BorderRadius.circular(30),
          ),
        );
      });
    }
    pageNo++;
  }

  @override
  Widget build(context) {
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                color: const Color.fromARGB(255, 142, 151, 253),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    currentPicture,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      child: Column(
                        children: [
                          Text(
                            currentText1,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            currentText2,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          currentLarge,
                          const SizedBox(width: 5),
                          currentMedium,
                          const SizedBox(width: 5),
                          currentSmall
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: changePageInfo,
                        style: ElevatedButton.styleFrom(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 150),
                            backgroundColor:
                                const Color.fromARGB(255, 139, 121, 252),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            textStyle: const TextStyle(fontSize: 16)),
                        child: const Text('Devam'),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    
  }
}
