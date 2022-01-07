import 'package:flutter/material.dart';
import 'package:multimaze/src/maze/maze.dart';

class MazeApp extends StatelessWidget {
  const MazeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MazePage(),
    );
  }
}
