import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  Expanded buildKey( {Color col, int node, String string}){
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: col,
            ),
        onPressed: () {
          playSound(node);
        },
        child: shadowing(string),
      ),
    );
  }
  void playSound(int node){
    final player = AudioCache();
    player.play('note$node.wav');
  }
  Text shadowing( String str){
    return Text(
      str,
      style: const TextStyle(
        fontSize: 20.0,
        color: Colors.black,
        fontStyle: FontStyle.italic,
        shadows: [Shadow(
          blurRadius: 8.0,
          color: Colors.black,
        )],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Xylophone'),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Colors.black,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    buildKey(col: Colors.red,node: 1,string: 'Wave 1'),
                    buildKey(col: Colors.yellow,node: 2,string: 'Wave 2'),
                    buildKey(col: Colors.blue,node: 3,string: 'Wave 3'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    buildKey(col: Colors.green,node: 4,string: 'Wave 4'),
                    buildKey(col: Colors.orange,node: 5,string: 'Wave 5'),
                    buildKey(col: Colors.pink,node: 6,string: 'Wave 6'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
