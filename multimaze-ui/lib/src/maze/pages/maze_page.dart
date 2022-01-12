import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:multimaze/src/maze/maze.dart';

class MazePage extends ConsumerWidget {
  const MazePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
