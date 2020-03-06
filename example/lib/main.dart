import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_plugin_music3/flutter_plugin_music3.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _state = 'Play';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      await FlutterPluginMusic3.platformVersion;
    } on PlatformException {
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("Play"),
            onPressed: _change,
            color: Colors.red,
            textColor: Colors.yellow,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            splashColor: Colors.grey,
          ),
        ),
      ),
    );
  }

  _change() {
    setState(() {
      if (_state.startsWith('P')) {
        _state = 'pause';
        playAudio();
      } else {
        _state = 'Play';
        pauseAudio();
      }
    });
  }

  Future<void> pauseAudio() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      await FlutterPluginMusic3.pauseAudio;
    } on PlatformException {
    }
  }


  Future<void> playAudio() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      await FlutterPluginMusic3.playAudio;
    } on PlatformException {
    }
  }
}
