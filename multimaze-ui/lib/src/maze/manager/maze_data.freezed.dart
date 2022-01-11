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
      required List<Coordinates> wallLocations,
      required int rows,
      required int columns,
      required int activePlayers,
      required DateTime startTime,
      IndexedCommand? lastCommand}) {
    return _MazeData(
      playerLocation: playerLocation,
      targetLocation: targetLocation,
      wallLocations: wallLocations,
      rows: rows,
      columns: columns,
      activePlayers: activePlayers,
      startTime: startTime,
      lastCommand: lastCommand,
    );
  }
}

/// @nodoc
const $MazeData = _$MazeDataTearOff();

/// @nodoc
mixin _$MazeData {
  Coordinates get playerLocation => throw _privateConstructorUsedError;
  Coordinates get targetLocation => throw _privateConstructorUsedError;
  List<Coordinates> get wallLocations => throw _privateConstructorUsedError;
  int get rows => throw _privateConstructorUsedError;
  int get columns => throw _privateConstructorUsedError;
  int get activePlayers => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  IndexedCommand? get lastCommand => throw _privateConstructorUsedError;

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
      List<Coordinates> wallLocations,
      int rows,
      int columns,
      int activePlayers,
      DateTime startTime,
      IndexedCommand? lastCommand});

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
    Object? wallLocations = freezed,
    Object? rows = freezed,
    Object? columns = freezed,
    Object? activePlayers = freezed,
    Object? startTime = freezed,
    Object? lastCommand = freezed,
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
      wallLocations: wallLocations == freezed
          ? _value.wallLocations
          : wallLocations // ignore: cast_nullable_to_non_nullable
              as List<Coordinates>,
      rows: rows == freezed
          ? _value.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as int,
      columns: columns == freezed
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as int,
      activePlayers: activePlayers == freezed
          ? _value.activePlayers
          : activePlayers // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastCommand: lastCommand == freezed
          ? _value.lastCommand
          : lastCommand // ignore: cast_nullable_to_non_nullable
              as IndexedCommand?,
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
      List<Coordinates> wallLocations,
      int rows,
      int columns,
      int activePlayers,
      DateTime startTime,
      IndexedCommand? lastCommand});

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
    Object? wallLocations = freezed,
    Object? rows = freezed,
    Object? columns = freezed,
    Object? activePlayers = freezed,
    Object? startTime = freezed,
    Object? lastCommand = freezed,
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
      wallLocations: wallLocations == freezed
          ? _value.wallLocations
          : wallLocations // ignore: cast_nullable_to_non_nullable
              as List<Coordinates>,
      rows: rows == freezed
          ? _value.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as int,
      columns: columns == freezed
          ? _value.columns
          : columns // ignore: cast_nullable_to_non_nullable
              as int,
      activePlayers: activePlayers == freezed
          ? _value.activePlayers
          : activePlayers // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastCommand: lastCommand == freezed
          ? _value.lastCommand
          : lastCommand // ignore: cast_nullable_to_non_nullable
              as IndexedCommand?,
    ));
  }
}

/// @nodoc

class _$_MazeData implements _MazeData {
  const _$_MazeData(
      {required this.playerLocation,
      required this.targetLocation,
      required this.wallLocations,
      required this.rows,
      required this.columns,
      required this.activePlayers,
      required this.startTime,
      this.lastCommand});

  @override
  final Coordinates playerLocation;
  @override
  final Coordinates targetLocation;
  @override
  final List<Coordinates> wallLocations;
  @override
  final int rows;
  @override
  final int columns;
  @override
  final int activePlayers;
  @override
  final DateTime startTime;
  @override
  final IndexedCommand? lastCommand;

  @override
  String toString() {
    return 'MazeData(playerLocation: $playerLocation, targetLocation: $targetLocation, wallLocations: $wallLocations, rows: $rows, columns: $columns, activePlayers: $activePlayers, startTime: $startTime, lastCommand: $lastCommand)';
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
            const DeepCollectionEquality()
                .equals(other.wallLocations, wallLocations) &&
            const DeepCollectionEquality().equals(other.rows, rows) &&
            const DeepCollectionEquality().equals(other.columns, columns) &&
            const DeepCollectionEquality()
                .equals(other.activePlayers, activePlayers) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality()
                .equals(other.lastCommand, lastCommand));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerLocation),
      const DeepCollectionEquality().hash(targetLocation),
      const DeepCollectionEquality().hash(wallLocations),
      const DeepCollectionEquality().hash(rows),
      const DeepCollectionEquality().hash(columns),
      const DeepCollectionEquality().hash(activePlayers),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(lastCommand));

  @JsonKey(ignore: true)
  @override
  _$MazeDataCopyWith<_MazeData> get copyWith =>
      __$MazeDataCopyWithImpl<_MazeData>(this, _$identity);
}

abstract class _MazeData implements MazeData {
  const factory _MazeData(
      {required Coordinates playerLocation,
      required Coordinates targetLocation,
      required List<Coordinates> wallLocations,
      required int rows,
      required int columns,
      required int activePlayers,
      required DateTime startTime,
      IndexedCommand? lastCommand}) = _$_MazeData;

  @override
  Coordinates get playerLocation;
  @override
  Coordinates get targetLocation;
  @override
  List<Coordinates> get wallLocations;
  @override
  int get rows;
  @override
  int get columns;
  @override
  int get activePlayers;
  @override
  DateTime get startTime;
  @override
  IndexedCommand? get lastCommand;
  @override
  @JsonKey(ignore: true)
  _$MazeDataCopyWith<_MazeData> get copyWith =>
      throw _privateConstructorUsedError;
}
