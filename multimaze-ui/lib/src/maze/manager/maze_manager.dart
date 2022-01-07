import 'package:multimaze/src/maze/maze.dart';
import 'package:riverpod/riverpod.dart';

class MazeManager extends StateNotifier<MazeData> {
  MazeManager() : super(parseMaze(rawMaze));

  static void validateRawMazeDimensions(List<String> rawMaze) {
    int rowNumber = 1;
    for (String row in rawMaze.sublist(1)) {
      if (row.length != rawMaze.first.length) {
        throw Exception('Row $rowNumber had unexpected length ${row.length}. '
            'Expected ${rawMaze.first.length}');
      }
      rowNumber += 1;
    }
  }

  static MazeData parseMaze(List<String> rawMaze) {
    MazeManager.validateRawMazeDimensions(rawMaze);

    // Set up the values we will ultimately return.
    List<Coordinates> wallLocations = [];
    late Coordinates playerLocation;
    late Coordinates targetLocation;

    // Iterate over the string representation of a maze.
    int yAxis = 0;
    for (String row in rawMaze.reversed) {
      int xAxis = 0;
      for (String square in row.split('')) {
        if (square == MazeData.rawWallLocation) {
          wallLocations.add(Coordinates(x: xAxis, y: yAxis));
        } else if (square == MazeData.rawPlayerLocation) {
          playerLocation = Coordinates(x: xAxis, y: yAxis);
        } else if (square == MazeData.rawTargetLocation) {
          targetLocation = Coordinates(x: xAxis, y: yAxis);
        } else if (square != MazeData.rawEmptySquare) {
          throw Exception('Encountered unexpected character in maze: $square');
        }
        xAxis += 1;
      }

      yAxis += 1;
    }

    return MazeData(
      playerLocation: playerLocation,
      targetLocation: targetLocation,
      wallLocations: wallLocations,
      columns: rawMaze.first.length,
      rows: rawMaze.length,
    );
  }
}

final mazeManagerProvider = StateNotifierProvider<MazeManager, MazeData>(
  (ref) => MazeManager(),
);
