import 'package:firebase_database/firebase_database.dart';
import 'package:multimaze/src/maze/maze.dart';
import 'package:riverpod/riverpod.dart';

class MazeManager extends StateNotifier<MazeData> {
  MazeManager() : super(parseMaze(rawMaze));
  FirebaseDatabase database = FirebaseDatabase.instance;

  void init() {
    // Dart implementation of https://firebase.google.com/docs/database/android/offline-capabilities#section-sample
    database.ref('.info/connected').onValue.listen((event) {
      if (event.snapshot.value == true) {
        var connectionRef = database.ref('connections').push();
        connectionRef.onDisconnect().remove();
        connectionRef.set(true);
      }
    });
    database.ref('connections').onValue.listen((event) {
      var playerCount = event.snapshot.children.length;
      state = state.copyWith(playerCount: playerCount);
    });
    // listen to position from the database
    database.ref('position').onValue.listen((event) {
      var data = event.snapshot.value as Map<String, dynamic>;
      state = state.copyWith(
        playerLocation: Coordinates(x: data['x'], y: data['y']),
        numberOfMoves: data.containsKey('moves') ? data['moves'] : 0,
        lastCommand: data['lastMove'] != null
            ? MoveCommand.fromDisplay(data['lastMove'])
            : null,
        startTime: data["startTime"] != null
            ? DateTime.parse(data["startTime"])
            : state.startTime,
      );
    });
  }

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
    Map<String, bool> json = {};
    int yAxis = 0;
    for (String row in rawMaze.reversed) {
      int xAxis = 0;
      for (String square in row.split('')) {
        if (square == MazeData.rawWallLocation) {
          wallLocations.add(Coordinates(x: xAxis, y: yAxis));
          json['$xAxis $yAxis'] = true;
        } else if (square == MazeData.rawPlayerLocation) {
          playerLocation = Coordinates(x: xAxis, y: yAxis);
        } else if (square == MazeData.rawTargetLocation) {
          targetLocation = Coordinates(x: xAxis, y: yAxis);
          json['$xAxis $yAxis'] = false;
        } else if (square != MazeData.rawEmptySquare) {
          throw Exception('Encountered unexpected character in maze: $square');
        }
        xAxis += 1;
      }
      yAxis += 1;
    }
    // alternative JavaScript to split maze: ["+rawMaze.map((line, y) => "["+line.split("").map((c,x) => `"${c}"`).join(", ")+"], ").join("")+"]"
    // ignore: dead_code
    if (false) {
      // This code prints the maze in a format that can be copy/pasted into the Realtime Database
      // ignore: avoid_print
      print(
          'MAZE JSON: { ${json.keys.map((key) => '"$key": ${json[key]}').join(", ")} }');
    }

    return MazeData(
      playerCount: 1,
      playerLocation: playerLocation,
      targetLocation: targetLocation,
      wallLocations: wallLocations,
      startTime: DateTime.now().toUtc().add(const Duration(seconds: 3)),
      columns: rawMaze.first.length,
      rows: rawMaze.length,
    );
  }

  void send(MoveCommand command) {
    if (state.startTime.difference(DateTime.now()) > Duration.zero) {
      // No moving before we start!
      return;
    }
    if (state.playerLocation == state.targetLocation) {
      // Once the player wins, stop accepting move commands. The server
      // will reset the game.
      // return;
    }
    final oldX = state.playerLocation.x;
    final oldY = state.playerLocation.y;
    final newLocation = command.map(
      up: (_) => Coordinates(x: oldX, y: oldY + 1),
      down: (_) => Coordinates(x: oldX, y: oldY - 1),
      left: (_) => Coordinates(x: oldX - 1, y: oldY),
      right: (_) => Coordinates(x: oldX + 1, y: oldY),
    );
    if (newLocation.x < 0 ||
        newLocation.y < 0 ||
        newLocation.x > state.columns - 1 ||
        newLocation.y > state.rows - 1) {
      // Nothing to do here. The game silently discards moves out of bounds.
      return;
    }
    if (state.wallLocations.contains(newLocation)) {
      // Nothing to do here. The game silently discards moves into walls.
      return;
    } // send new state to RTDB
    database.ref('position').update({
      'x': newLocation.x,
      'y': newLocation.y,
      'moves': ServerValue.increment(1),
      'lastMove': command.toDisplay(),
    }).catchError((e) {
      print('Error: $e');
    });
    // state = state.copyWith(
    //   playerLocation: newLocation,
    //   numberOfMoves: state.numberOfMoves + 1,
    //   lastCommand: command,
    // );
  }
}

final mazeManagerProvider = StateNotifierProvider<MazeManager, MazeData>(
  (ref) => MazeManager(),
);
