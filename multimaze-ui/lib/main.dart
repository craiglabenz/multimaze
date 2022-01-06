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
      body: const Maze(
        rows: 15,
        columns: 30,
      ),
    );
  }
}

class Maze extends StatelessWidget {
  const Maze({
    Key? key,
    required this.rows,
    required this.columns,
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
            child: _SizedMaze(rows: rows, columns: columns),
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
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
