import 'dart:math';
import 'package:multimaze/src/maze/maze.dart';
import 'package:riverpod/riverpod.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'speech.dart';

class SpeechManager extends StateNotifier<SpeechState> {
  SpeechManager({
    required this.minimumWordConfidence,
    required this.sendCommand,
  }) : super(SpeechState.initial());

  final double minimumWordConfidence;
  final Function(MoveCommand) sendCommand;
  final SpeechToText _speechToText = SpeechToText();

  int _previousLastIndex = -1;
  int _depthParsedPreviousLastElement = 0;

  void init() {
    _speechToText.initialize().then((bool success) async {
      await _startListening();
    });
    _speechToText.statusListener = _onStatusChanged;
  }

  Future<void> _startListening() => _speechToText.listen(
        onResult: _onSpeechResult,
        pauseFor: const Duration(minutes: 1),
      );

  void _onStatusChanged(String status) {
    if (status == "done") {
      _startListening();
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    // This means that a new element has appeared.
    if (result.alternates.length > _previousLastIndex) {
      _previousLastIndex = result.alternates.length;
      _depthParsedPreviousLastElement = 0;
    } else {
      // This means S2T appended to the previous `result`'s last element instead
      // of providing a new value. This usually means the S2T algorithm picked up
      // a continuous flow of speech or has refined a previous guess.
    }
    _processSpeechToTextElement(
      element: result.alternates.last,
      alreadyParsedTo: _depthParsedPreviousLastElement,
    );
  }

  void _processSpeechToTextElement({
    required SpeechRecognitionWords element,
    required int alreadyParsedTo,
  }) {
    if (element.hasConfidenceRating) {
      state = state.copyWith(lastWords: element.recognizedWords);
      if (element.isConfident(threshold: minimumWordConfidence)) {
        final newWords = element.recognizedWords
            .substring(min(element.recognizedWords.length, alreadyParsedTo));
        for (final word in newWords.split(' ')) {
          if (word == 'left') {
            sendCommand(const MoveCommand.left());
          } else if (word == 'right') {
            sendCommand(const MoveCommand.right());
          } else if (word == 'up') {
            sendCommand(const MoveCommand.up());
          } else if (word == 'down') {
            sendCommand(const MoveCommand.down());
          }
          _depthParsedPreviousLastElement += word.length + 1;
        }
      }
    }
  }

  @override
  void dispose() {
    _speechToText.stop();
    super.dispose();
  }
}

final speechManagerProvider = StateNotifierProvider<SpeechManager, SpeechState>(
  (ref) => SpeechManager(
    minimumWordConfidence: 0.7,
    sendCommand: ref.read(mazeManagerProvider.notifier).send,
  ),
);
