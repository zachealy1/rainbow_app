import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart'; // For haptic feedback

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
  final AudioPlayer _audioPlayer = AudioPlayer();

  final List<Color> defaultColors = const [
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

  final List<String> soundFiles = [
    "note1.wav",
    "note2.wav",
    "note3.wav",
    "note4.wav",
    "note5.wav",
    "note6.wav",
    "note7.wav",
  ];

  List<Color> currentColors = [];
  bool isVertical = true;
  bool showText = false;

  @override
  void initState() {
    super.initState();
    currentColors = List.from(defaultColors);
  }

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

  Future<void> _playSound(int index) async {
    await _audioPlayer.play(AssetSource(soundFiles[index]));
  }

  void _changeColor(int index) {
    setState(() {
      currentColors[index] = Colors.grey;
    });

    // Restore the color after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        currentColors[index] = defaultColors[index];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleOrientation,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Rainbow Xylophone'),
          backgroundColor: Colors.blue,
        ),
        body: Stack(
          children: [
            isVertical
                ? Row(
              children: List.generate(
                defaultColors.length,
                    (index) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _playSound(index);
                    },
                    onDoubleTap: () {
                      int nextIndex = (index + 1) % soundFiles.length;
                      _playSound(nextIndex);
                    },
                    onLongPress: () {
                      _changeColor(index);
                    },
                    onTapDown: (details) {
                      HapticFeedback.mediumImpact();
                    },
                    child: Container(
                      color: currentColors[index],
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
            )
                : Column(
              children: List.generate(
                defaultColors.length,
                    (index) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _playSound(index);
                    },
                    onDoubleTap: () {
                      int nextIndex = (index + 1) % soundFiles.length;
                      _playSound(nextIndex);
                    },
                    onLongPress: () {
                      _changeColor(index);
                    },
                    onTapDown: (details) {
                      HapticFeedback.mediumImpact();
                    },
                    child: Container(
                      color: currentColors[index],
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
