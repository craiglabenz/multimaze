import 'package:flutter/material.dart';
import 'package:multimaze/src/maze/maze.dart';

class MazeControlPanel extends StatelessWidget {
  const MazeControlPanel({
    Key? key,
    required this.playerCount,
    required this.lastCommand,
    required this.sizeMultiplier,
    required this.startTime,
  }) : super(key: key);

  final int playerCount;
  final double sizeMultiplier;
  final IndexedCommand? lastCommand;
  final DateTime startTime;

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
          top: 0,
          bottom: 0,
          child: _MetaGameState(
            playerCount: playerCount,
            sizeMultiplier: sizeMultiplier,
            startTime: startTime,
          ),
        )
      ],
    );
  }
}

class _MetaGameState extends StatelessWidget {
  const _MetaGameState({
    Key? key,
    required this.playerCount,
    required this.sizeMultiplier,
    required this.startTime,
  }) : super(key: key);

  final int playerCount;
  final double sizeMultiplier;
  final DateTime startTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        GameClock(startTime, fontSize: 32 * sizeMultiplier),
        Text(
          'Active Players: $playerCount',
          style: Theme.of(context).textTheme.headline4!.copyWith(
                fontSize: 32 * sizeMultiplier,
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
