import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:multimaze/src/maze/maze.dart';

class MazePage extends StatefulWidget {
  const MazePage({Key? key}) : super(key: key);

  @override
  State<MazePage> createState() => _MazePageState();
}

class _MazePageState extends State<MazePage> {
  int playerX = 0;
  int playerY = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MultiMaze'),
      ),
      body: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (RawKeyEvent event) {
          if (event is RawKeyUpEvent) {
            return;
          }
          if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
            setState(() => playerY++);
          } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
            setState(() => playerY--);
          } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            setState(() => playerX--);
          } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
            setState(() => playerX++);
          }
        },
        child: Maze(
          rows: 10,
          columns: 10,
          borderColor: Colors.blue,
          gridColor: Colors.grey[50]!,
          borderThickness: 1,
          gamePieceLocation: Coordinates(x: playerX, y: playerY),
          wallLocations: <Coordinates>[
            Coordinates(x: 1, y: 1),
            Coordinates(x: 2, y: 1),
            Coordinates(x: 3, y: 1),
            Coordinates(x: 4, y: 1),
            Coordinates(x: 5, y: 1),
            Coordinates(x: 6, y: 1),
            Coordinates(x: 7, y: 1),
            Coordinates(x: 8, y: 1),
            Coordinates(x: 9, y: 1),
          ],
        ),
      ),
    );
  }
}
