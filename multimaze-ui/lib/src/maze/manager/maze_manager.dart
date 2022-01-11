import 'package:firebase_database/firebase_database.dart';
import 'package:multimaze/src/maze/maze.dart';
import 'package:riverpod/riverpod.dart';

class MazeManager extends StateNotifier<MazeData> {
  MazeManager() : super(parseMaze(rawMaze)) {
    // Dart implementation of https://firebase.google.com/docs/database/android/offline-capabilities#section-sample
    FirebaseDatabase database = FirebaseDatabase.instance;  
    database.ref('.info/connected').onValue.listen((event) {
      if (event.snapshot.value == true) {
        var connectionRef = database.ref('connections').push();
        connectionRef.onDisconnect().remove();
        connectionRef.set(true);
      }
    });
    database.ref('connections').onValue.listen((event) {
      var playerCount = event.snapshot.children.length;
      state = state.copyWith(
        activePlayers: playerCount
      );      
    });
    // TODO: listen to position from server
    
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
      activePlayers: 1,
      playerLocation: playerLocation,
      targetLocation: targetLocation,
      wallLocations: wallLocations,
      startTime: DateTime.now().toUtc().add(const Duration(seconds: 3)),
      columns: rawMaze.first.length,
      rows: rawMaze.length,
    );
  }

  void send(MoveCommand command) {
    final oldX = state.playerLocation.x;
    final oldY = state.playerLocation.y;
    // TODO: send new state to RTDB
    // database.ref('location').set({
    //   'x': ServerValue.increment(1),
    // });
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
    }
    state = state.copyWith(
      lastCommand: IndexedCommand(
        command: command,
        moveNumber:
            state.lastCommand == null ? 1 : state.lastCommand!.moveNumber + 1,
      ),
      playerLocation: newLocation,
    );
  }
}

final mazeManagerProvider = StateNotifierProvider<MazeManager, MazeData>(
  (ref) => MazeManager(),
);
