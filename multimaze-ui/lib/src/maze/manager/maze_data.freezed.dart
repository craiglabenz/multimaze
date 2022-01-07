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
      required int columns}) {
    return _MazeData(
      playerLocation: playerLocation,
      targetLocation: targetLocation,
      wallLocations: wallLocations,
      rows: rows,
      columns: columns,
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
      int columns});
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
    ));
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
      int columns});
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
      required this.columns});

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
  String toString() {
    return 'MazeData(playerLocation: $playerLocation, targetLocation: $targetLocation, wallLocations: $wallLocations, rows: $rows, columns: $columns)';
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
            const DeepCollectionEquality().equals(other.columns, columns));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(playerLocation),
      const DeepCollectionEquality().hash(targetLocation),
      const DeepCollectionEquality().hash(wallLocations),
      const DeepCollectionEquality().hash(rows),
      const DeepCollectionEquality().hash(columns));

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
      required int columns}) = _$_MazeData;

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
  @JsonKey(ignore: true)
  _$MazeDataCopyWith<_MazeData> get copyWith =>
      throw _privateConstructorUsedError;
}