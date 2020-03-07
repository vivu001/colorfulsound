import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  // add buttons with color
  List<Widget> _addButtons(Color makeColor()) {
    final buttons = <Widget>[];

    for (var i = 1; i <= 7; i++) {
      buttons.add(Expanded(
        child: FlatButton(
          onPressed: () {
            final player = AudioCache(); // local variable
            player.play('note$i.wav');
          },
          color: makeColor()
        ),
      ));
    }

    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.deepPurple,
      Colors.yellow,
      Colors.indigo,
      Colors.purpleAccent,
      Colors.teal
    ];

    // generate random color
    Color _makeColor() {
      int random = new Random().nextInt(colors.length);
      return colors.removeAt(random);
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: _addButtons(_makeColor),
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),
        ),
      ),
    );
  }
}
