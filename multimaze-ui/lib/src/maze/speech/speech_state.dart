import 'package:freezed_annotation/freezed_annotation.dart';

part 'speech_state.freezed.dart';

@Freezed()
class SpeechState with _$SpeechState {
  const factory SpeechState({
    String? lastWords,
  }) = _SpeechState;

  factory SpeechState.initial() => const SpeechState();
}
