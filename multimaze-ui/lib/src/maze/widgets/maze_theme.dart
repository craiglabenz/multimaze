import 'package:flutter/material.dart';

/// Container for all the cosmetic information needed to render a maze.
class MazeTheme {
  const MazeTheme({
    this.borderColor = Colors.blue,
    this.borderThickness = 1.0,
    this.gamePieceColor = Colors.pink,
    this.gridColor = Colors.blue,
    this.paddingOnConstrainedSide = 0.2,
    this.wallsColor = Colors.black,
  })  : assert(paddingOnConstrainedSide >= 0),
        assert(paddingOnConstrainedSide <= 1);

  /// The fill color of the board's boundary lines.
  final Color borderColor;

  /// The thickness in pixels at which to draw each line.
  final double borderThickness;

  /// The fill color of the game piece.
  final Color gamePieceColor;

  /// The fill color of the board's inner lines.
  final Color gridColor;

  /// Percent of the screen real state to reserve as padding in the direction
  /// that is most constrained.
  ///
  /// Providing a value of 0.1 will reserve 10% of the screen real estate on
  /// either side of the maze, ultimately reserving 20% of the space and
  /// constraining the maze to the center 80%.
  ///
  /// If the screen is wider than it is tall, then height is the most
  /// constrained dimension. If the screen is taller than it is wide, then width
  /// is the most constrained dimension.
  final double paddingOnConstrainedSide;

  /// The fill color of the board's walls.
  final Color wallsColor;
}
