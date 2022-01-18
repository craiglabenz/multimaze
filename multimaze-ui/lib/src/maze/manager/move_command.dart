import 'package:freezed_annotation/freezed_annotation.dart';

part 'move_command.freezed.dart';

/// Indicates a single order to attempt to relocate the player.
@Freezed()
class MoveCommand with _$MoveCommand {
  const MoveCommand._();
  const factory MoveCommand.up() = MoveCommandUp;
  const factory MoveCommand.down() = MoveCommandDown;
  const factory MoveCommand.left() = MoveCommandLeft;
  const factory MoveCommand.right() = MoveCommandRight;

  String toDisplay() => map(
        up: (_) => 'Up',
        down: (_) => 'Down',
        left: (_) => 'Left',
        right: (_) => 'Right',
      );

  static Map<String, MoveCommand> get _fromDisplayMap => <String, MoveCommand>{
        'up': const MoveCommand.up(),
        'down': const MoveCommand.down(),
        'left': const MoveCommand.left(),
        'right': const MoveCommand.right(),
      };

  static MoveCommand? fromDisplay(String value) =>
      _fromDisplayMap[value.toLowerCase()];
}
