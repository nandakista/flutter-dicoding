import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

/* Created by
   Varcant
   06/11/2022
   nanda.kista@gmail.com
*/
class TimerModule extends GetxController {
  static TimerModule get find => Get.find<TimerModule>();

  RxInt currentTime = RxInt(0);
  late Timer timer;

  void startTimer({
    required String updateId,
    required int time,
    Duration? intervalTime,
    void Function(int currentTime)? onStart,
    void Function()? onFinished,
    void Function(int currentTime)? onChanged,
  }) {
    _setCurrentTime(time);
    if (onStart != null) onStart(time);
    timer = Timer.periodic(
      intervalTime ?? const Duration(seconds: 1),
      (Timer timerP) {
        if (currentTime.value == 0) {
          _stopTimerP(timerP);
          if (onFinished != null) onFinished();
        } else {
          _setCurrentTime(currentTime.value -= 1);
          if (onChanged != null) onChanged(currentTime.value);
        }
        if(kDebugMode) debugPrint('TIMER UPDATE: $updateId | $currentTime');
        update([updateId]);
      },
    );
  }

  void _setCurrentTime(int time) {
    currentTime.value = time;
  }

  void _stopTimerP(Timer timerP) {
    timerP.cancel();
    stopTimer();
  }

  void stopTimer() {
    timer.cancel();
  }

  @override
  void onClose() {
    stopTimer();
    super.onClose();
  }
}

class TimeLeftData {
  final String hour;
  final String minutes;
  final String second;

  TimeLeftData({
    required this.hour,
    required this.minutes,
    required this.second,
  });
}