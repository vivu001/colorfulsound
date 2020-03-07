import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  // add buttons with color
  List<Widget> _addButtons(Color _makeColor()) {
    final buttons = <Widget>[];

    for (var i = 1; i <= 7; i++) {
      buttons.add(FlatButton(
        onPressed: () {
          final player = AudioCache(); // local variable
          player.play('note$i.wav');
        },
        color: _makeColor(),
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
      print(random);
      return colors.removeAt(random);
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
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
