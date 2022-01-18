// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'speech_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SpeechStateTearOff {
  const _$SpeechStateTearOff();

  _SpeechState call({String? lastWords}) {
    return _SpeechState(
      lastWords: lastWords,
    );
  }
}

/// @nodoc
const $SpeechState = _$SpeechStateTearOff();

/// @nodoc
mixin _$SpeechState {
  String? get lastWords => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpeechStateCopyWith<SpeechState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeechStateCopyWith<$Res> {
  factory $SpeechStateCopyWith(
          SpeechState value, $Res Function(SpeechState) then) =
      _$SpeechStateCopyWithImpl<$Res>;
  $Res call({String? lastWords});
}

/// @nodoc
class _$SpeechStateCopyWithImpl<$Res> implements $SpeechStateCopyWith<$Res> {
  _$SpeechStateCopyWithImpl(this._value, this._then);

  final SpeechState _value;
  // ignore: unused_field
  final $Res Function(SpeechState) _then;

  @override
  $Res call({
    Object? lastWords = freezed,
  }) {
    return _then(_value.copyWith(
      lastWords: lastWords == freezed
          ? _value.lastWords
          : lastWords // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$SpeechStateCopyWith<$Res>
    implements $SpeechStateCopyWith<$Res> {
  factory _$SpeechStateCopyWith(
          _SpeechState value, $Res Function(_SpeechState) then) =
      __$SpeechStateCopyWithImpl<$Res>;
  @override
  $Res call({String? lastWords});
}

/// @nodoc
class __$SpeechStateCopyWithImpl<$Res> extends _$SpeechStateCopyWithImpl<$Res>
    implements _$SpeechStateCopyWith<$Res> {
  __$SpeechStateCopyWithImpl(
      _SpeechState _value, $Res Function(_SpeechState) _then)
      : super(_value, (v) => _then(v as _SpeechState));

  @override
  _SpeechState get _value => super._value as _SpeechState;

  @override
  $Res call({
    Object? lastWords = freezed,
  }) {
    return _then(_SpeechState(
      lastWords: lastWords == freezed
          ? _value.lastWords
          : lastWords // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SpeechState implements _SpeechState {
  const _$_SpeechState({this.lastWords});

  @override
  final String? lastWords;

  @override
  String toString() {
    return 'SpeechState(lastWords: $lastWords)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SpeechState &&
            const DeepCollectionEquality().equals(other.lastWords, lastWords));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(lastWords));

  @JsonKey(ignore: true)
  @override
  _$SpeechStateCopyWith<_SpeechState> get copyWith =>
      __$SpeechStateCopyWithImpl<_SpeechState>(this, _$identity);
}

abstract class _SpeechState implements SpeechState {
  const factory _SpeechState({String? lastWords}) = _$_SpeechState;

  @override
  String? get lastWords;
  @override
  @JsonKey(ignore: true)
  _$SpeechStateCopyWith<_SpeechState> get copyWith =>
      throw _privateConstructorUsedError;
}
