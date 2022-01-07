import 'dart:math';
import 'package:flutter/material.dart';

import '../helpers/helpers.dart';

/// The UI grid that
class Maze extends StatelessWidget {
  const Maze({
    Key? key,
    required this.rows,
    required this.columns,
    required this.gamePieceLocation,
    required this.wallLocations,
    this.gamePieceColor = Colors.pink,
    this.borderColor = Colors.blue,
    this.gridColor = Colors.blue,
    this.wallsColor = Colors.black,
    this.borderThickness = 1.0,
    this.paddingOnConstrainedSide = 0.1,
  })  : assert(paddingOnConstrainedSide >= 0),
        assert(paddingOnConstrainedSide <= 1),
        super(key: key);

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

  /// The fill color of the game piece.
  final Color gamePieceColor;

  /// The fill color of the board's boundary lines.
  final Color borderColor;

  /// The fill color of the board's inner lines.
  final Color gridColor;

  /// The fill color of the board's walls.
  final Color wallsColor;

  /// The height of the maze in game squares.
  ///
  /// The actual size in pixels will be determined by maximizing this against
  /// available screen real estate.
  final int rows;

  /// The width of the maze in game squares.
  ///
  /// The actual size in pixels will be determined by maximizing this against
  /// available screen real estate.
  final int columns;

  /// The location on the board where the game piece should be drawn.
  final Coordinates gamePieceLocation;

  /// Coordinates of game squares that contain impassible walls. These are what
  /// make the maze a maze instead of an empty field.
  final List<Coordinates> wallLocations;

  /// The thickness in pixels at which to draw each line.
  final double borderThickness;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Grab the max ideal size of each dimension, assuming the other
        // dimension had enough room to accommodate. The smaller of these two
        // results will be our constraining size.
        final double maxIdealWidth =
            (constraints.maxWidth * (1 - (paddingOnConstrainedSide * 2))) /
                columns;
        final double maxIdealHeight =
            (constraints.maxHeight * (1 - (paddingOnConstrainedSide * 2))) /
                rows;

        // Because each game position must be a square, the smallest max ideal
        // size will be the height and width of all squares.
        // Note that this size currently includes each square's border.
        final double squareSize = min(maxIdealWidth, maxIdealHeight);

        // Height of the maze in pixels. We will leave positioning to a `Center`
        // widget.
        final double mazeHeight = rows * squareSize;

        // Width of the maze in pixels. We will leave positioning to a `Center`
        // widget.
        final double mazeWidth = columns * squareSize;

        final EdgeInsets mazePadding = EdgeInsets.symmetric(
          horizontal: (constraints.maxWidth - mazeWidth) / 2,
          vertical: (constraints.maxHeight - mazeHeight) / 2,
        );

        return Center(
          child: Padding(
            padding: mazePadding,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: borderThickness),
              ),
              child: _SizedMaze(
                rows: rows,
                columns: columns,
                innerHeight: mazeHeight - (2 * borderThickness),
                innerWidth: mazeWidth - (2 * borderThickness),
                borderColor: borderColor,
                borderThickness: borderThickness,
                gamePieceColor: gamePieceColor,
                gamePieceLocation: gamePieceLocation,
                gridColor: gridColor,
                wallsColor: wallsColor,
                wallLocations: wallLocations,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SizedMaze extends StatelessWidget {
  const _SizedMaze({
    Key? key,
    required this.rows,
    required this.columns,
    required this.innerHeight,
    required this.innerWidth,
    required this.borderColor,
    required this.borderThickness,
    required this.gamePieceColor,
    required this.gamePieceLocation,
    required this.gridColor,
    required this.wallsColor,
    required this.wallLocations,
  }) : super(key: key);

  /// The height of the maze in game squares.
  final int rows;

  /// The width of the maze in game squares.
  final int columns;

  /// The thickness in pixels at which to draw each line.
  final double borderThickness;

  /// The fill color of the game piece.
  final Color gamePieceColor;

  /// The fill color of the board's boundary lines.
  final Color borderColor;

  /// The fill color of the board's inner lines.
  final Color gridColor;

  /// The fill color of the board's walls.
  final Color wallsColor;

  /// The location on the board where the game piece should be drawn.
  final Coordinates gamePieceLocation;

  /// Coordinates of game squares that contain impassible walls. These are what
  /// make the maze a maze instead of an empty field.
  final List<Coordinates> wallLocations;

  /// The height of the maze in pixels.
  ///
  /// As it is the "inner" height, the 1px perimeter border has already been
  /// accounted for; so there is no need to subtract 2 from this value.
  final double innerHeight;

  /// The width of the maze in pixels.
  ///
  /// As it is the "inner" width, the 1px perimeter border has already been
  /// accounted for; so there is no need to subtract 2 from this value.
  final double innerWidth;

  @override
  Widget build(BuildContext context) {
    final squareSize = innerWidth / columns;

    final gamePieceX = gamePieceLocation.x * squareSize;
    final gamePieceY = gamePieceLocation.y * squareSize;

    final horizontalBars = <Widget>[];
    for (int _ in List<int>.generate(rows - 1, (i) => i)) {
      horizontalBars.add(Container(height: borderThickness, color: gridColor));
    }

    final verticalBars = <Widget>[];
    for (int _ in List<int>.generate(columns - 1, (i) => i)) {
      verticalBars.add(Container(width: borderThickness, color: gridColor));
    }

    final wallBlocks = <Widget>[];
    for (final wallLocation in wallLocations) {
      wallBlocks.add(
        Positioned(
          bottom: squareSize * wallLocation.y,
          left: squareSize * wallLocation.x,
          child: Container(
            height: squareSize,
            width: squareSize,
            color: wallsColor,
          ),
        ),
      );
    }

    return Stack(
      children: <Widget>[
        Positioned(
          height: innerHeight,
          width: innerWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: horizontalBars,
          ),
        ),
        Positioned(
          height: innerHeight,
          width: innerWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: verticalBars,
          ),
        ),
        ...wallBlocks,
        AnimatedPositioned(
          left: gamePieceX + (borderThickness / 4),
          bottom: gamePieceY + (borderThickness / 4),
          height: squareSize - borderThickness,
          width: squareSize - borderThickness,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(squareSize),
              color: gamePieceColor,
            ),
          ),
          duration: const Duration(milliseconds: 50),
        ),
      ],
    );
  }
}
