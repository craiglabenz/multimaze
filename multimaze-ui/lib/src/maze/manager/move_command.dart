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
}

/// Wraps each [MoveCommand] with a number telling which move number it was over
/// the course of a single game session.
///
/// Note that invalid/discarded [MoveCommand] values will never enter the state
/// as an [IndexedCommand].
@Freezed()
class IndexedCommand with _$IndexedCommand {
  const factory IndexedCommand({
    required MoveCommand command,
    required int moveNumber,
  }) = _IndexCommand;
}
