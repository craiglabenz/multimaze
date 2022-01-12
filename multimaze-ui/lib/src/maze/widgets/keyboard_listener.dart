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
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Always request focus, so that any time our app has focus at all, it
    // is returned to this `KeyboardListener`. This is important to keep the app
    // working after the developer clicks elsewhere in the browser, e.g., the
    // navigation bar.
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: focusNode,
      onKeyEvent: (KeyEvent event) {
        if (event is KeyUpEvent) {
          return;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
          widget.sendCommand(const MoveCommand.up());
        } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
          widget.sendCommand(const MoveCommand.down());
        } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          widget.sendCommand(const MoveCommand.left());
        } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          widget.sendCommand(const MoveCommand.right());
        }
      },
      child: widget.child,
    );
  }
}
