import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multimaze/src/maze/helpers/helpers.dart';

part 'maze_data.freezed.dart';

@Freezed()
class MazeData with _$MazeData {
  const factory MazeData({
    required Coordinates playerLocation,
    required Coordinates targetLocation,
    required List<Coordinates> wallLocations,
    required int rows,
    required int columns,
    required int activePlayers,
  }) = _MazeData;

  static const rawEmptySquare = ' ';
  static const rawWallLocation = '*';
  static const rawPlayerLocation = '@';
  static const rawTargetLocation = 'x';
}
