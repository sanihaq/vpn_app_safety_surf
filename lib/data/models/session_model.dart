import 'dart:async';

import 'package:flutter/material.dart';

class SessionModel extends ChangeNotifier {
  SessionModel({required this.ip});
  final String ip;

  DateTime? _startTime;
  DateTime get startTime => _startTime ?? DateTime.now();
  DateTime? _endTime;
  DateTime get endTime => _endTime ?? DateTime.now();

  final ValueNotifier<int> sessionInSeconds = ValueNotifier(0);

  Timer? _timer;

  void startSession() {
    _startTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      sessionInSeconds.value++;
    });
  }

  void stopSession() {
    _endTime = DateTime.now();
    _timer?.cancel();
  }

  static String formatTimeInSeconds(int seconds) {
    final duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
