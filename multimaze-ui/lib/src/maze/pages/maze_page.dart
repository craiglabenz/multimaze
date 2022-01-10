import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:multimaze/src/maze/maze.dart';

class MazePage extends ConsumerWidget {
  const MazePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MazeData mazeData = ref.watch(mazeManagerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MultiMaze'),
      ),
      body: MoveCommandKeyboardListener(
        sendCommand: ref.read(mazeManagerProvider.notifier).send,
        child: Maze(
          activePlayers: mazeData.activePlayers,
          rows: mazeData.rows,
          columns: mazeData.columns,
          borderColor: Colors.blue,
          gridColor: Colors.grey[50]!,
          borderThickness: 1,
          gamePieceLocation: mazeData.playerLocation,
          wallLocations: mazeData.wallLocations,
        ),
      ),
    );
  }
}
