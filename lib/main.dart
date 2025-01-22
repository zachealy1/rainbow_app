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

  bool isVertical = true;

  void _toggleOrientation() {
    setState(() {
      isVertical = !isVertical;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleOrientation,
      child: Scaffold(
        // The AppBar with the title "Rainbow"
        appBar: AppBar(
          title: const Text('Rainbow'),
          backgroundColor: Colors.blue,
        ),
        body: isVertical
            ? Row(
          children: rainbowColors
              .map((color) => Expanded(child: Container(color: color)))
              .toList(),
        )
            : Column(
          children: rainbowColors
              .map((color) => Expanded(child: Container(color: color)))
              .toList(),
        ),
      ),
    );
  }
}
