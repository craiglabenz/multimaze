import 'package:flutter/material.dart';

class GameClock extends StatefulWidget {
  const GameClock(
    this.startTime, {
    Key? key,
    required this.fontSize,
  }) : super(key: key);

  final DateTime startTime;
  final double fontSize;

  @override
  _GameClockState createState() => _GameClockState();
}

class _GameClockState extends State<GameClock> {
  // The amount of seconds this game has been running. A negative value implies
  // that we are in the pre-game countdown state.
  int gameSeconds = 0;

  @override
  void initState() {
    super.initState();
    updateClockAndRescheduleClock();
  }

  void updateClockAndRescheduleClock() {
    final newGameSeconds =
        DateTime.now().toUtc().difference(widget.startTime).inSeconds;
    if (newGameSeconds != gameSeconds) {
      setState(() {
        gameSeconds = newGameSeconds;
      });
    }

    /// Check every 100ms
    Future.delayed(
      const Duration(milliseconds: 100),
      updateClockAndRescheduleClock,
    );
  }

  String get clockDisplay {
    if (gameSeconds > 0) {
      final minutes = gameSeconds ~/ 60;
      final seconds = gameSeconds % 60;
      return '${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}';
    } else {
      return 'STARTS IN ${gameSeconds * -1}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      clockDisplay,
      style: Theme.of(context).textTheme.headline4!.copyWith(
            fontSize: widget.fontSize,
          ),
    );
  }
}
