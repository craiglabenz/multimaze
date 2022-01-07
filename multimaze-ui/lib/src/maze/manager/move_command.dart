import 'package:freezed_annotation/freezed_annotation.dart';

part 'move_command.freezed.dart';

@Freezed()
abstract class MoveCommand with _$MoveCommand {
  const factory MoveCommand.up() = MoveCommandUp;
  const factory MoveCommand.down() = MoveCommandDown;
  const factory MoveCommand.left() = MoveCommandLeft;
  const factory MoveCommand.right() = MoveCommandRight;
}
