import 'dart:io';

import 'package:flutter/services.dart';

/// iOS Live Activityの操作を提供するサービス。
class LiveActivityService {
  LiveActivityService();

  static const _channel = MethodChannel(
    'com.tttuuu1234.habitTracker/liveActivity',
  );

  /// Live Activityを開始する。
  Future<void> startActivity({
    required int habitId,
    required String habitName,
    required int targetSeconds,
    required int remainingSeconds,
  }) async {
    if (!Platform.isIOS) return;

    await _channel.invokeMethod('startActivity', {
      'habitId': habitId,
      'habitName': habitName,
      'targetSeconds': targetSeconds,
      'remainingSeconds': remainingSeconds,
    });
  }

  /// Live Activityを更新する（一時停止時）。
  Future<void> updateActivity({
    required int habitId,
    required int remainingSeconds,
    required bool isPaused,
  }) async {
    if (!Platform.isIOS) return;

    await _channel.invokeMethod('updateActivity', {
      'habitId': habitId,
      'remainingSeconds': remainingSeconds,
      'isPaused': isPaused,
    });
  }

  /// Live Activityを終了する。
  Future<void> endActivity({required int habitId}) async {
    if (!Platform.isIOS) return;

    await _channel.invokeMethod('endActivity', {'habitId': habitId});
  }
}
