import 'dart:math';
import 'package:flutter/material.dart';
import 'package:multimaze/src/maze/maze.dart';

/// The UI grid that renders walls and the player indicator.
///
/// The [Maze] widget mostly exists to figure out sizing concerns, and then
/// delegates all actual rendering to [_SizedMaze].
class Maze extends StatelessWidget {
  const Maze({
    Key? key,
    required this.mazeData,
    this.theme = const MazeTheme(),
  }) : super(key: key);

  /// The state of the game.
  final MazeData mazeData;

  /// Container for all cosmetic info needed to render a maze.
  final MazeTheme theme;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Grab the max ideal size of each dimension, assuming the other
        // dimension had enough room to accommodate. The smaller of these two
        // results will be our constraining size.
        final double maxIdealWidth = (constraints.maxWidth *
                (1 - (theme.paddingOnConstrainedSide * 2))) /
            mazeData.columns;
        final double maxIdealHeight = (constraints.maxHeight *
                (1 - (theme.paddingOnConstrainedSide * 2))) /
            mazeData.rows;

        // Because each game position must be a square, the smallest max ideal
        // size will be the height and width of all squares.
        // Note that this size currently includes each square's border.
        final double squareSize = min(maxIdealWidth, maxIdealHeight);

        // Height of the maze in pixels. We will leave positioning to a `Center`
        // widget.
        final double mazeHeight = mazeData.rows * squareSize;

        // Width of the maze in pixels. We will leave positioning to a `Center`
        // widget.
        final double mazeWidth = mazeData.columns * squareSize;

        final double innerHeight = mazeHeight - (2 * theme.borderThickness);
        final double innerWidth = mazeWidth - (2 * theme.borderThickness);

        final double leftOffset = (constraints.maxWidth - mazeWidth) / 2;
        final double topOffset = (constraints.maxHeight - mazeHeight) / 1.5;
        final double bottomOffset = (constraints.maxHeight - mazeHeight) / 3;

        return Stack(
          children: <Widget>[
            Positioned(
              left: leftOffset,
              top: 0,
              width: mazeWidth,
              height: constraints.maxHeight - mazeHeight - bottomOffset,
              child: MazeControlPanel(
                playerCount: mazeData.playerCount,
                lastCommand: mazeData.lastCommand,
                startTime: mazeData.startTime,
                sizeMultiplier: constraints.maxWidth / defaultWindowWidth,
              ),
            ),
            Positioned(
              left: leftOffset,
              width: mazeWidth,
              height: mazeHeight,
              top: topOffset,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: theme.borderColor,
                    width: theme.borderThickness,
                  ),
                ),
                child: _SizedMaze(
                  innerHeight: innerHeight,
                  innerWidth: innerWidth,
                  mazeData: mazeData,
                  theme: theme,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Renders a maze to the maximum size of its parent.
///
/// Because the aspect ratio of both the window and maze are unpredictable, this
/// should be only be used within a [Maze] widget.
class _SizedMaze extends StatelessWidget {
  const _SizedMaze({
    Key? key,
    required this.innerHeight,
    required this.innerWidth,
    required this.mazeData,
    required this.theme,
  }) : super(key: key);

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

  /// The state of the game.
  final MazeData mazeData;

  /// Container for all cosmetic info needed to render a maze.
  final MazeTheme theme;

  @override
  Widget build(BuildContext context) {
    final squareSize = innerWidth / mazeData.columns;
    final gamePieceX = mazeData.playerLocation.x * squareSize;
    final gamePieceY = mazeData.playerLocation.y * squareSize;

    final horizontalBars = <Widget>[];
    for (int _ in List<int>.generate(mazeData.rows - 1, (i) => i)) {
      horizontalBars.add(
          Container(height: theme.borderThickness, color: theme.gridColor));
    }

    final verticalBars = <Widget>[];
    for (int _ in List<int>.generate(mazeData.columns - 1, (i) => i)) {
      verticalBars
          .add(Container(width: theme.borderThickness, color: theme.gridColor));
    }

    final wallBlocks = <Widget>[];
    for (final wallLocation in mazeData.wallLocations) {
      wallBlocks.add(
        Positioned(
          bottom: squareSize * wallLocation.y,
          left: squareSize * wallLocation.x,
          child: Container(
            height: squareSize,
            width: squareSize,
            color: theme.wallsColor,
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
        PlayerIndicator(
          left: gamePieceX + (theme.borderThickness / 4),
          bottom: gamePieceY + (theme.borderThickness / 4),
          size: squareSize - theme.borderThickness,
          color: theme.gamePieceColor,
        ),
      ],
    );
  }
}
