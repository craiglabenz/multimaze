import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multimaze/src/maze/maze.dart';

class MazeApp extends StatelessWidget {
  const MazeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Multimaze',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MazePage(),
      ),
    );
  }
}
