import 'package:flutter/material.dart';
import 'package:multimaze/src/maze/maze.dart';

class MazeControlPanel extends StatelessWidget {
  const MazeControlPanel({
    Key? key,
    required this.activePlayers,
    required this.lastCommand,
    required this.sizeMultiplier,
  }) : super(key: key);

  final int activePlayers;
  final double sizeMultiplier;
  final IndexedCommand? lastCommand;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          right: 150 * sizeMultiplier,
          child: _RecentCommands(lastCommand, sizeMultiplier: sizeMultiplier),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          height: 50 * sizeMultiplier,
          child: Text(
            'Active Players: $activePlayers',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontSize: 32 * sizeMultiplier,
                ),
          ),
        )
      ],
    );
  }
}

class _RecentCommands extends StatelessWidget {
  const _RecentCommands(this.lastCommand,
      {Key? key, required this.sizeMultiplier})
      : super(key: key);

  final IndexedCommand? lastCommand;
  final double sizeMultiplier;

  @override
  Widget build(BuildContext context) {
    final lastMoveWidget = Text(
      (lastCommand == null)
          ? 'Last Command: None'
          : 'Last Command: ${lastCommand!.command.toDisplay()}',
      style: Theme.of(context).textTheme.headline4!.copyWith(
            fontSize: 32 * sizeMultiplier,
          ),
    );
    final moveCountWidget = Text(
      (lastCommand == null)
          ? 'Total Commands: 0'
          : 'Total Commands: ${lastCommand!.moveNumber}',
      style: Theme.of(context).textTheme.headline4!.copyWith(
            fontSize: 32 * sizeMultiplier,
          ),
    );
    return Stack(children: <Widget>[
      Positioned(
        left: 0,
        bottom: 10,
        height: 100 * sizeMultiplier,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            moveCountWidget,
            lastMoveWidget,
          ],
        ),
      ),
    ]);
  }
}
