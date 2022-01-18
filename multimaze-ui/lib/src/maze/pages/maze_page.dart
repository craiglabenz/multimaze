import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:multimaze/src/maze/maze.dart';
import 'package:multimaze/src/maze/speech/speech.dart';

class MazePage extends ConsumerStatefulWidget {
  const MazePage({Key? key}) : super(key: key);

  @override
  _MazePageState createState() => _MazePageState();
}

class _MazePageState extends ConsumerState<MazePage> {
  @override
  void initState() {
    ref.read(mazeManagerProvider.notifier).init();
    ref.read(speechManagerProvider.notifier).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MoveCommandKeyboardListener(
      sendCommand: ref.read(mazeManagerProvider.notifier).send,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MultiMaze'),
        ),
        body: Maze(mazeData: ref.watch(mazeManagerProvider)),
      ),
    );
  }
}
