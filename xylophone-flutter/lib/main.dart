import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(Colors.red, "note1"),
              buildKey(Colors.orange, "note2"),
              buildKey(Colors.yellow, "note3"),
              buildKey(Colors.green, "note4"),
              buildKey(Colors.green.shade700, "note5"),
              buildKey(Colors.blue, "note6"),
              buildKey(Colors.purple, "note7"),
            ],
          ),
        ),
      ),
    );
  }

  void playSound(String soundFile) {
    final player = AudioCache();
    player.play("$soundFile.wav");
  }

  Expanded buildKey(Color color, String soundFile) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playSound(soundFile);
        },
      ),
    );
  }
}
