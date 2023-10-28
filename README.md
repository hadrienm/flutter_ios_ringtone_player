
# Flutter iOS Ringtone Player

The purpose of this plugin is to play iOS system sound.


## Authors

- [@hadrienm](https://www.github.com/hadrienm)


## Installation

```bash
  flutter pub add flutter_ios_ringtone_player
```
    
## Usage/Examples

```dart
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_ios_ringtone_player/flutter_ios_ringtone_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();

    initPlatformState();
    play();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion =
          await FlutterIosRingtonePlayer.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> play() async {
    FlutterIosRingtonePlayer.play(soundId: 1035);
    Future.delayed(const Duration(milliseconds: 500), () async {
       FlutterIosRingtonePlayer.stop(soundId: 1035);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
```


## Features

- Play iOS system sound


## Documentation

play() method:

    Play a given sound.

    Take soundId as unique parameter, is must be a int. It must be between 1,000 and 4,000

stop() method:

    Stop the current playing sound. Take soundId as unique parameter, is must be a int. It must be between 1,000 and 4,000

