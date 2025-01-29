import 'package:flutter/material.dart';

void main() {
  runApp(const RainbowApp());
}

class RainbowApp extends StatelessWidget {
  const RainbowApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RainbowScreen(),
    );
  }
}

class RainbowScreen extends StatefulWidget {
  const RainbowScreen({Key? key}) : super(key: key);

  @override
  _RainbowScreenState createState() => _RainbowScreenState();
}

class _RainbowScreenState extends State<RainbowScreen> {
  final List<Color> rainbowColors = const [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  final List<String> colorNames = [
    "Red",
    "Orange",
    "Yellow",
    "Green",
    "Blue",
    "Indigo",
    "Purple",
  ];

  bool isVertical = true;
  bool showText = false;

  void _toggleOrientation() {
    setState(() {
      isVertical = !isVertical;
    });
  }

  void _toggleText() {
    setState(() {
      showText = !showText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleOrientation,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rainbow'),
          backgroundColor: Colors.blue,
        ),
        body: Stack(
          children: [
            isVertical
                ? Row(
              children: List.generate(
                rainbowColors.length,
                    (index) => Expanded(
                  child: Container(
                    color: rainbowColors[index],
                    child: showText
                        ? Center(
                      child: Text(
                        colorNames[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                        : null,
                  ),
                ),
              ),
            )
                : Column(
              children: List.generate(
                rainbowColors.length,
                    (index) => Expanded(
                  child: Container(
                    color: rainbowColors[index],
                    child: showText
                        ? Center(
                      child: Text(
                        colorNames[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                        : null,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _toggleText,
          child: const Icon(Icons.toggle_on),
        ),
      ),
    );
  }
}