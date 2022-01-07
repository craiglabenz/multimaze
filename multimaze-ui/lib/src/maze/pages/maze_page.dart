import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      body: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (RawKeyEvent event) {
          if (event is RawKeyUpEvent) {
            return;
          }
          if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
            // setState(() => playerY++);
            ref.read(mazeManagerProvider.notifier).send(const MoveCommand.up());
          } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
            ref
                .read(mazeManagerProvider.notifier)
                .send(const MoveCommand.down());
            // setState(() => playerY--);
          } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            // setState(() => playerX--);
            ref
                .read(mazeManagerProvider.notifier)
                .send(const MoveCommand.left());
          } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
            // setState(() => playerX++);
            ref
                .read(mazeManagerProvider.notifier)
                .send(const MoveCommand.right());
          }
        },
        child: Maze(
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
