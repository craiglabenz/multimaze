import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multimaze/src/maze/helpers/helpers.dart';
import 'move_command.dart';

part 'maze_data.freezed.dart';

@Freezed()
class MazeData with _$MazeData {
  const factory MazeData({
    /// The location of the player on the board.
    required Coordinates playerLocation,

    /// The square players are trying to reach.
    ///
    /// It should be true that when [playerLocation] == [targetLocation], the
    /// maze has been escaped.
    required Coordinates targetLocation,

    /// The height of the maze in game squares.
    ///
    /// The actual size in pixels will be determined by maximizing this against
    /// available screen real estate.
    required int rows,

    /// The width of the maze in game squares.
    ///
    /// The actual size in pixels will be determined by maximizing this against
    /// available screen real estate.
    required int columns,

    /// The number of active connections to the game.
    ///
    /// This is for display purposes only and has no other effect on the UI.
    required int playerCount,

    /// The last successful command issued in the game.
    ///
    /// Should only be `null` at the start of a new game.
    MoveCommand? lastCommand,

    /// The total number of moves submitted from all players.
    @Default(0) int numberOfMoves,

    /// The time at which this game starts and commands will be accepted, in UTC.
    required DateTime startTime,

    /// Coordinates of game squares that contain impassible walls. These are
    /// what make the maze a maze instead of an empty field.
    required List<Coordinates> wallLocations,
  }) = _MazeData;

  static const rawEmptySquare = ' ';
  static const rawWallLocation = '*';
  static const rawPlayerLocation = '@';
  static const rawTargetLocation = 'x';
}
