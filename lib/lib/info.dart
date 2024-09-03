import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  late String _title;
  late String _description;
  late String _imagePath;
  final DraggableScrollableController _scrollableController =
      DraggableScrollableController();
  bool _isFullyOpened = false;

  @override
  void initState() {
    super.initState();
  

    _scrollableController.addListener(() {
      print(_scrollableController.size);
      setState(() {
        _isFullyOpened = _scrollableController.size == 0.95;
      });
    });
  }

  @override
  void dispose() {
    _scrollableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: .9,
                    widthFactor: 1,
                    child: Transform.scale(
                      scale: 1.65,
                      child: Image.asset(
                        _imagePath,
                        width: 500,
                        height: 400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
            controller: _scrollableController,
            initialChildSize: 0.61,
            minChildSize: 0.61,
            maxChildSize: .95,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      spreadRadius: 0.5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  width: 40,
                                  height: 5,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                    _title,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      // Add your logic here
                                    },
                                    icon: const Icon(Icons.info),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 40),
                              const Text(
                                'Hakkında',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                _description,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              const SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: !_isFullyOpened,
                      child: const Text(
                        'Tamamını görmek için aşağı kaydırın',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
