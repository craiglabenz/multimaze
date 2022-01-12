// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'maze_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MazeDataTearOff {
  const _$MazeDataTearOff();

  _MazeData call(
      {required Coordinates playerLocation,
      required Coordinates targetLocation,
      required int rows,
      required int columns,
      required int playerCount,
      IndexedCommand? lastCommand,
      required DateTime startTime,
      required List<Coordinates> wallLocations}) {
    return _MazeData(
      playerLocation: playerLocation,
      targetLocation: targetLocation,
      rows: rows,
      columns: columns,
      playerCount: playerCount,
      lastCommand: lastCommand,
      startTime: startTime,
      wallLocations: wallLocations,
    );
  }
}

/// @nodoc
const $MazeData = _$MazeDataTearOff();

/// @nodoc
mixin _$MazeData {
  /// The location of the player on the board.
  Coordinates get playerLocation => throw _privateConstructorUsedError;

  /// The square players are trying to reach.
  ///
  /// It should be true that when [playerLocation] == [targetLocation], the
  /// maze has been escaped.
  Coordinates get targetLocation => throw _privateConstructorUsedError;

  /// The height of the maze in game squares.
  ///
  /// The actual size in pixels will be determined by maximizing this against
  /// available screen real estate.
  int get rows => throw _privateConstructorUsedError;

  /// The width of the maze in game squares.
  ///
  /// The actual size in pixels will be determined by maximizing this against
  /// available screen real estate.
  int get columns => throw _privateConstructorUsedError;

  /// The number of active connections to the game.
  ///
  /// This is for display purposes only and has no other effect on the UI.
  int get playerCount => throw _privateConstructorUsedError;

  /// The last successful command issued in the game.
  ///
  /// Should only be `null` at the start of a new game.
  IndexedCommand? get lastCommand => throw _privateConstructorUsedError;

  /// The time at which this game starts and commands will be accepted, in UTC.
  DateTime get startTime => throw _privateConstructorUsedError;

  /// Coordinates of game squares that contain impassible walls. These are
  /// what make the maze a maze instead of an empty field.
  List<Coordinates> get wallLocations => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MazeDataCopyWith<MazeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MazeDataCopyWith<$Res> {
  factory $MazeDataCopyWith(MazeData value, $Res Function(MazeData) then) =
      _$MazeDataCopyWithImpl<$Res>;
  $Res call(
      {Coordinates playerLocation,
      Coordinates targetLocation,
      int rows,
      int columns,
      int playerCount,
      IndexedCommand? lastCommand,
      DateTime startTime,
      List<Coordinates> wallLocations});

  $CoordinatesCopyWith<$Res> get playerLocation;
  $CoordinatesCopyWith<$Res> get targetLocation;
  $IndexedCommandCopyWith<$Res>? get lastCommand;
}

/// @nodoc
class _$MazeDataCopyWithImpl<$Res> implements $MazeDataCopyWith<$Res> {
  _$MazeDataCopyWithImpl(this._value, this._then);

  final MazeData _value;
  // ignore: unused_field
  final $Res Function(MazeData) _then;

  @override
  $Res call({
    Object? playerLocation = freezed,
    Object? targetLocation = freezed,
    Object? rows = freezed,
    Object? columns = freezed,
    Object? playerCount = freezed,
    Object? lastCommand = freezed,
    Object? startTime = freezed,
    Object? wallLocations = freezed,
  }) {
    return _then(_value.copyWith(
      playerLocation: playerLocation == freezed
          ? _value.playerLocation
          : playerLocation // ignore: cast_nullable_to_non_nullable
              as Coordinates,
      targetLocation: targetLocation == freezed
          ? _value.targetLocation
          : targetLocation // ignore: cast_nullable_to_non_nullable
              as Coordinates,
      rows: rows == freezed
          ? _value.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as int,
      columns: columns == freezed
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as int,
      playerCount: playerCount == freezed
          ? _value.playerCount
          : playerCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastCommand: lastCommand == freezed
          ? _value.lastCommand
          : lastCommand // ignore: cast_nullable_to_non_nullable
              as IndexedCommand?,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      wallLocations: wallLocations == freezed
          ? _value.wallLocations
          : wallLocations // ignore: cast_nullable_to_non_nullable
              as List<Coordinates>,
    ));
  }

  @override
  $CoordinatesCopyWith<$Res> get playerLocation {
    return $CoordinatesCopyWith<$Res>(_value.playerLocation, (value) {
      return _then(_value.copyWith(playerLocation: value));
    });
  }

  @override
  $CoordinatesCopyWith<$Res> get targetLocation {
    return $CoordinatesCopyWith<$Res>(_value.targetLocation, (value) {
      return _then(_value.copyWith(targetLocation: value));
    });
  }

  @override
  $IndexedCommandCopyWith<$Res>? get lastCommand {
    if (_value.lastCommand == null) {
      return null;
    }

    return $IndexedCommandCopyWith<$Res>(_value.lastCommand!, (value) {
      return _then(_value.copyWith(lastCommand: value));
    });
  }
}

/// @nodoc
abstract class _$MazeDataCopyWith<$Res> implements $MazeDataCopyWith<$Res> {
  factory _$MazeDataCopyWith(_MazeData value, $Res Function(_MazeData) then) =
      __$MazeDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {Coordinates playerLocation,
      Coordinates targetLocation,
      int rows,
      int columns,
      int playerCount,
      IndexedCommand? lastCommand,
      DateTime startTime,
      List<Coordinates> wallLocations});

  @override
  $CoordinatesCopyWith<$Res> get playerLocation;
  @override
  $CoordinatesCopyWith<$Res> get targetLocation;
  @override
  $IndexedCommandCopyWith<$Res>? get lastCommand;
}

/// @nodoc
class __$MazeDataCopyWithImpl<$Res> extends _$MazeDataCopyWithImpl<$Res>
    implements _$MazeDataCopyWith<$Res> {
  __$MazeDataCopyWithImpl(_MazeData _value, $Res Function(_MazeData) _then)
      : super(_value, (v) => _then(v as _MazeData));

  @override
  _MazeData get _value => super._value as _MazeData;

  @override
  $Res call({
    Object? playerLocation = freezed,
    Object? targetLocation = freezed,
    Object? rows = freezed,
    Object? columns = freezed,
    Object? playerCount = freezed,
    Object? lastCommand = freezed,
    Object? startTime = freezed,
    Object? wallLocations = freezed,
  }) {
    return _then(_MazeData(
      playerLocation: playerLocation == freezed
          ? _value.playerLocation
          : playerLocation // ignore: cast_nullable_to_non_nullable
              as Coordinates,
      targetLocation: targetLocation == freezed
          ? _value.targetLocation
          : targetLocation // ignore: cast_nullable_to_non_nullable
              as Coordinates,
      rows: rows == freezed
          ? _value.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as int,
      columns: columns == freezed
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as int,
      playerCount: playerCount == freezed
          ? _value.playerCount
          : playerCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastCommand: lastCommand == freezed
          ? _value.lastCommand
          : lastCommand // ignore: cast_nullable_to_non_nullable
              as IndexedCommand?,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      wallLocations: wallLocations == freezed
          ? _value.wallLocations
          : wallLocations // ignore: cast_nullable_to_non_nullable
              as List<Coordinates>,
    ));
  }
}

/// @nodoc

class _$_MazeData implements _MazeData {
  const _$_MazeData(
      {required this.playerLocation,
      required this.targetLocation,
      required this.rows,
      required this.columns,
      required this.playerCount,
      this.lastCommand,
      required this.startTime,
      required this.wallLocations});

  @override

  /// The location of the player on the board.
  final Coordinates playerLocation;
  @override

  /// The square players are trying to reach.
  ///
  /// It should be true that when [playerLocation] == [targetLocation], the
  /// maze has been escaped.
  final Coordinates targetLocation;
  @override

  /// The height of the maze in game squares.
  ///
  /// The actual size in pixels will be determined by maximizing this against
  /// available screen real estate.
  final int rows;
  @override

  /// The width of the maze in game squares.
  ///
  /// The actual size in pixels will be determined by maximizing this against
  /// available screen real estate.
  final int columns;
  @override

  /// The number of active connections to the game.
  ///
  /// This is for display purposes only and has no other effect on the UI.
  final int playerCount;
  @override

  /// The last successful command issued in the game.
  ///
  /// Should only be `null` at the start of a new game.
  final IndexedCommand? lastCommand;
  @override

  /// The time at which this game starts and commands will be accepted, in UTC.
  final DateTime startTime;
  @override

  /// Coordinates of game squares that contain impassible walls. These are
  /// what make the maze a maze instead of an empty field.
  final List<Coordinates> wallLocations;

  @override
  String toString() {
    return 'MazeData(playerLocation: $playerLocation, targetLocation: $targetLocation, rows: $rows, columns: $columns, playerCount: $playerCount, lastCommand: $lastCommand, startTime: $startTime, wallLocations: $wallLocations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MazeData &&
            const DeepCollectionEquality()
                .equals(other.playerLocation, playerLocation) &&
            const DeepCollectionEquality()
                .equals(other.targetLocation, targetLocation) &&
            const DeepCollectionEquality().equals(other.rows, rows) &&
            const DeepCollectionEquality().equals(other.columns, columns) &&
            const DeepCollectionEquality()
                .equals(other.playerCount, playerCount) &&
            const DeepCollectionEquality()
                .equals(other.lastCommand, lastCommand) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality()
                .equals(other.wallLocations, wallLocations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerLocation),
      const DeepCollectionEquality().hash(targetLocation),
      const DeepCollectionEquality().hash(rows),
      const DeepCollectionEquality().hash(columns),
      const DeepCollectionEquality().hash(playerCount),
      const DeepCollectionEquality().hash(lastCommand),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(wallLocations));

  @JsonKey(ignore: true)
  @override
  _$MazeDataCopyWith<_MazeData> get copyWith =>
      __$MazeDataCopyWithImpl<_MazeData>(this, _$identity);
}

abstract class _MazeData implements MazeData {
  const factory _MazeData(
      {required Coordinates playerLocation,
      required Coordinates targetLocation,
      required int rows,
      required int columns,
      required int playerCount,
      IndexedCommand? lastCommand,
      required DateTime startTime,
      required List<Coordinates> wallLocations}) = _$_MazeData;

  @override

  /// The location of the player on the board.
  Coordinates get playerLocation;
  @override

  /// The square players are trying to reach.
  ///
  /// It should be true that when [playerLocation] == [targetLocation], the
  /// maze has been escaped.
  Coordinates get targetLocation;
  @override

  /// The height of the maze in game squares.
  ///
  /// The actual size in pixels will be determined by maximizing this against
  /// available screen real estate.
  int get rows;
  @override

  /// The width of the maze in game squares.
  ///
  /// The actual size in pixels will be determined by maximizing this against
  /// available screen real estate.
  int get columns;
  @override

  /// The number of active connections to the game.
  ///
  /// This is for display purposes only and has no other effect on the UI.
  int get playerCount;
  @override

  /// The last successful command issued in the game.
  ///
  /// Should only be `null` at the start of a new game.
  IndexedCommand? get lastCommand;
  @override

  /// The time at which this game starts and commands will be accepted, in UTC.
  DateTime get startTime;
  @override

  /// Coordinates of game squares that contain impassible walls. These are
  /// what make the maze a maze instead of an empty field.
  List<Coordinates> get wallLocations;
  @override
  @JsonKey(ignore: true)
  _$MazeDataCopyWith<_MazeData> get copyWith =>
      throw _privateConstructorUsedError;
}
