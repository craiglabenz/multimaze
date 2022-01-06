import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Maze(
        rows: 30,
        columns: 30,
        borderColor: Colors.blue,
        borderThickness: 1,
        gamePieceLocation: const Coordinates(x: 3, y: 1),
      ),
    );
  }
}

class Maze extends StatelessWidget {
  const Maze({
    Key? key,
    required this.rows,
    required this.columns,
    required this.gamePieceLocation,
    this.gamePieceColor = Colors.pink,
    this.borderColor = Colors.blue,
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

  /// The fill color of the board's boundary and inner lines.
  final Color borderColor;

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

        // print('$mazeWidth, $mazeHeight');

        return Center(
          child: Padding(
            padding: mazePadding,
            child: Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: borderColor, width: borderThickness)),
              child: _SizedMaze(
                rows: rows,
                columns: columns,
                innerHeight: mazeHeight - (2 * borderThickness),
                innerWidth: mazeWidth - (2 * borderThickness),
                borderColor: borderColor,
                borderThickness: borderThickness,
                gamePieceColor: gamePieceColor,
                gamePieceLocation: gamePieceLocation,
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
  }) : super(key: key);

  /// The height of the maze in game squares.
  final int rows;

  /// The width of the maze in game squares.
  final int columns;

  /// The thickness in pixels at which to draw each line.
  final double borderThickness;

  /// The fill color of the game piece.
  final Color gamePieceColor;

  /// The fill color of the board's boundary and inner lines.
  final Color borderColor;

  /// The location on the board where the game piece should be drawn.
  final Coordinates gamePieceLocation;

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
      horizontalBars
          .add(Container(height: borderThickness, color: borderColor));
    }

    final verticalBars = <Widget>[];
    for (int _ in List<int>.generate(columns - 1, (i) => i)) {
      verticalBars.add(Container(width: borderThickness, color: borderColor));
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
          duration: const Duration(milliseconds: 200),
        ),
      ],
    );
  }
}

/// Specifies a location on the game board as an (X,Y) distance from the origin.
///
/// Although graphics draw from the upper-left of a screen, visualizing a game
/// board is more intuitive treating the bottom-left as the origin. Thus, these
/// coordinates assume the bottom-left square is (0,0).
///
/// Note that *squares* are valid game locations, not lines, so a game board of
/// size 10x10 will have valid coordinates ranging from (0,0) to (9,9).
class Coordinates {
  const Coordinates({required this.x, required this.y});
  final int x;
  final int y;
}
