import ActivityKit
import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  /// 実行中のLive Activityを習慣IDで管理する。
  private var activities: [Int: String] = [:]

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    guard let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "LiveActivityChannel") else { return }
    setupMethodChannel(binaryMessenger: registrar.messenger())
  }

  private func setupMethodChannel(binaryMessenger: FlutterBinaryMessenger) {
    let channel = FlutterMethodChannel(
      name: "com.tttuuu1234.habitTracker/liveActivity",
      binaryMessenger: binaryMessenger
    )

    channel.setMethodCallHandler { [weak self] call, result in
      guard let self = self else {
        result(FlutterError(code: "UNAVAILABLE", message: "AppDelegate deallocated", details: nil))
        return
      }

      switch call.method {
      case "startActivity":
        self.handleStartActivity(call: call, result: result)
      case "updateActivity":
        self.handleUpdateActivity(call: call, result: result)
      case "endActivity":
        self.handleEndActivity(call: call, result: result)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
  }

  // MARK: - Live Activity ハンドラー

  private func handleStartActivity(call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard #available(iOS 16.2, *) else {
      result(nil)
      return
    }

    guard let args = call.arguments as? [String: Any],
          let habitId = args["habitId"] as? Int,
          let habitName = args["habitName"] as? String,
          let targetSeconds = args["targetSeconds"] as? Int,
          let remainingSeconds = args["remainingSeconds"] as? Int
    else {
      result(FlutterError(code: "INVALID_ARGS", message: "Invalid arguments", details: nil))
      return
    }

    // 既存のアクティビティがあれば終了する
    endExistingActivity(habitId: habitId)

    let attributes = HabitTimerAttributes(
      habitName: habitName,
      targetSeconds: targetSeconds
    )

    let endDate = Date().addingTimeInterval(TimeInterval(remainingSeconds))
    let state = HabitTimerAttributes.ContentState(
      endDate: endDate,
      isPaused: false,
      remainingSeconds: remainingSeconds
    )

    let content = ActivityContent(state: state, staleDate: nil)

    do {
      let activity = try Activity<HabitTimerAttributes>.request(
        attributes: attributes,
        content: content
      )
      activities[habitId] = activity.id
      result(nil)
    } catch {
      result(FlutterError(code: "START_FAILED", message: error.localizedDescription, details: nil))
    }
  }

  private func handleUpdateActivity(call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard #available(iOS 16.2, *) else {
      result(nil)
      return
    }

    guard let args = call.arguments as? [String: Any],
          let habitId = args["habitId"] as? Int,
          let remainingSeconds = args["remainingSeconds"] as? Int,
          let isPaused = args["isPaused"] as? Bool
    else {
      result(FlutterError(code: "INVALID_ARGS", message: "Invalid arguments", details: nil))
      return
    }

    let endDate: Date
    if isPaused {
      endDate = Date().addingTimeInterval(TimeInterval(remainingSeconds))
    } else {
      endDate = Date().addingTimeInterval(TimeInterval(remainingSeconds))
    }

    let state = HabitTimerAttributes.ContentState(
      endDate: endDate,
      isPaused: isPaused,
      remainingSeconds: remainingSeconds
    )

    let content = ActivityContent(state: state, staleDate: nil)

    Task {
      guard let activityId = activities[habitId] else {
        result(nil)
        return
      }

      for activity in Activity<HabitTimerAttributes>.activities {
        if activity.id == activityId {
          await activity.update(content)
          break
        }
      }
      result(nil)
    }
  }

  private func handleEndActivity(call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard #available(iOS 16.2, *) else {
      result(nil)
      return
    }

    guard let args = call.arguments as? [String: Any],
          let habitId = args["habitId"] as? Int
    else {
      result(FlutterError(code: "INVALID_ARGS", message: "Invalid arguments", details: nil))
      return
    }

    Task {
      endExistingActivity(habitId: habitId)
      result(nil)
    }
  }

  @available(iOS 16.2, *)
  private func endExistingActivity(habitId: Int) {
    guard let activityId = activities.removeValue(forKey: habitId) else { return }

    Task {
      for activity in Activity<HabitTimerAttributes>.activities {
        if activity.id == activityId {
          await activity.end(nil, dismissalPolicy: .immediate)
          break
        }
      }
    }
  }
}
