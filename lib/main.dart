import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final buttons = <Widget>[];

    for (var i = 1; i <= 7; i++) {
      buttons.add(Center(
        child: FlatButton(
          onPressed: () {
            final player = AudioCache(); // local variable
            player.play('note$i.wav');
          },
          child: Text('Click me'),
        ),
      ));
    }

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: buttons,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ),
      ),
    );
  }
}
