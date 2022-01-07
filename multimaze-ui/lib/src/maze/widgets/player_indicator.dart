import 'package:flutter/material.dart';

class PlayerIndicator extends StatelessWidget {
  const PlayerIndicator({
    Key? key,
    required this.left,
    required this.bottom,
    required this.size,
    required this.color,
  }) : super(key: key);

  final double bottom;
  final double left;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: left,
      bottom: bottom,
      height: size,
      width: size,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size),
          color: color,
        ),
      ),
      duration: const Duration(milliseconds: 50),
    );
  }
}
