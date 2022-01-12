import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multimaze/src/maze/maze.dart';

class MoveCommandKeyboardListener extends StatefulWidget {
  const MoveCommandKeyboardListener({
    Key? key,
    required this.child,
    required this.sendCommand,
  }) : super(key: key);

  final Widget child;
  final Function(MoveCommand) sendCommand;

  @override
  State<MoveCommandKeyboardListener> createState() =>
      _MoveCommandKeyboardListenerState();
}

class _MoveCommandKeyboardListenerState
    extends State<MoveCommandKeyboardListener> {
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    HardwareKeyboard.instance.addHandler(onKeyEvent);
  }

  bool onKeyEvent(KeyEvent event) {
    if (event is KeyUpEvent) {
      return false;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      widget.sendCommand(const MoveCommand.up());
      return true;
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      widget.sendCommand(const MoveCommand.down());
      return true;
    } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      widget.sendCommand(const MoveCommand.left());
      return true;
    } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      widget.sendCommand(const MoveCommand.right());
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(onKeyEvent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
