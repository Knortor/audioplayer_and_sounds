import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AudioPlayer player;

  // This initializes AudioPlayer when the UI loads.
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  // It will also dispose the audio player and release the resources when the app closes.
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await player.setAsset('assets/audio/moo.mp3');
                  player.play();
                  // TODO: cow button
                },
                child: Text('Cow'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () async {
                  await player.setAsset('assets/audio/horse_whinney_2.mp3');
                  player.play();
                  // TODO: horse button
                },
                child: Text('Horse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
