import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import 'package:music_player/modules/music_player_screen.dart';
import 'package:music_player/modules/myscreen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setUp();

  Directory dir = await getApplicationDocumentsDirectory();

  Hive.init(dir.path);

  await Hive.openBox<String>('myBox');

  Box box = Hive.box<String>('myBox');

  if (box.get('playedOnce') == null) {
    box.put('playedOnce', false);
  }
  runApp(MyApp());
}

final getIt = GetIt.instance;

class BaDumTss {
  AudioPlayer _audio = AudioPlayer();

  AudioPlayer get audio => _audio;
}

void setUp() {
  getIt.registerFactory(() => BaDumTss());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyScreen(),
    );
  }
}
