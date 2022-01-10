import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multimaze/src/maze/maze.dart';

class MoveCommandKeyboardListener extends StatelessWidget {
  const MoveCommandKeyboardListener({
    Key? key,
    required this.child,
    required this.sendCommand,
  }) : super(key: key);

  final Widget child;
  final Function(MoveCommand) sendCommand;

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (RawKeyEvent event) {
        if (event is RawKeyUpEvent) {
          return;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          sendCommand(const MoveCommand.up());
        } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          sendCommand(const MoveCommand.down());
        } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          sendCommand(const MoveCommand.left());
        } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          sendCommand(const MoveCommand.right());
        }
      },
      child: child,
    );
  }
}
