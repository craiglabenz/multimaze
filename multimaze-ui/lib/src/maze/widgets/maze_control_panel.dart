import 'package:flutter/material.dart';

class MazeControlPanel extends StatelessWidget {
  const MazeControlPanel({
    Key? key,
    required this.activePlayers,
    required this.sizeMultiplier,
  }) : super(key: key);

  final int activePlayers;
  final double sizeMultiplier;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
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
