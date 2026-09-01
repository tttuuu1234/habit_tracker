import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'services/live_activity_service.dart';

part 'providers.g.dart';

/// Live Activityサービスのインスタンス。
@Riverpod(keepAlive: true)
LiveActivityService liveActivityService(LiveActivityServiceRef ref) {
  return LiveActivityService();
}
