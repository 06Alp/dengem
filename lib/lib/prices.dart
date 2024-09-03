import 'package:flutter/material.dart';
import 'breathe.dart';
import 'loadingscreen.dart';

class Prices extends StatefulWidget {
  const Prices({super.key});

  @override
  _PricesState createState() => _PricesState();
}

class _PricesState extends State<Prices> {
  int _selectedButtonIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Premium Üyelik'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Bir psikolog ile yazışmak ister misin?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(right: 80),
              child: Text(
                "Üyelik süresi boyunca kesintisiz psikolog ile iletişim",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(180, 55, 55, 55),
                ),
              ),
            ),
            const SizedBox(height: 60),
            _buildSelectableButton(
                0,
                '1 AY                                               849.99TL',
                'Toplam fiyat 849.99TL                                         /her ay'),
            const SizedBox(height: 20),
            _buildSelectableButton(
                1,
                '6 AY                                               749.99TL',
                'Toplam fiyat 4499.99TL                                         /her ay'),
            const SizedBox(height: 20),
            _buildSelectableButton(
                2,
                '1 YIL                                               649.99TL',
                'Toplam fiyat 7799.99TL                                         /her ay'),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Breathe()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                minimumSize: const Size(380, 64),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Üyeliği Başlat',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40)
          ],
        ),
      ),
    );
  }

  Widget _buildSelectableButton(int index, String title, String subtitle) {
    bool isSelected = _selectedButtonIndex == index;

    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedButtonIndex = index;
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.white;
            }
            return isSelected
                ? Colors.white
                : Colors.white; // Use the default color.
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black;
            }
            return isSelected
                ? Colors.black
                : Colors.black; // Use the default color.
          },
        ),
        side: MaterialStateProperty.resolveWith<BorderSide>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return const BorderSide(color: Colors.blueGrey, width: 1);
            }
            return isSelected
                ? const BorderSide(color: Colors.blueGrey, width: 1)
                : BorderSide.none; // Border based on selection.
          },
        ),
        minimumSize: MaterialStateProperty.all(const Size(380, 80)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(180, 55, 55, 55)),
          ),
        ],
      ),
    );
  }
}
