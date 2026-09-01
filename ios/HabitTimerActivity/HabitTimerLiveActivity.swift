import ActivityKit
import SwiftUI
import WidgetKit

struct HabitTimerLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: HabitTimerAttributes.self) { context in
            // ロック画面バナー
            lockScreenView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                // 展開時
                DynamicIslandExpandedRegion(.leading) {
                    Image(systemName: "timer")
                        .foregroundColor(.green)
                }
                DynamicIslandExpandedRegion(.center) {
                    Text(context.attributes.habitName)
                        .font(.headline)
                        .lineLimit(1)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    timerText(context: context)
                        .font(.headline)
                        .monospacedDigit()
                }
                DynamicIslandExpandedRegion(.bottom) {
                    ProgressView(
                        value: progress(context: context),
                        total: 1.0
                    )
                    .tint(.green)
                }
            } compactLeading: {
                Image(systemName: "timer")
                    .foregroundColor(.green)
            } compactTrailing: {
                timerText(context: context)
                    .font(.caption)
                    .monospacedDigit()
            } minimal: {
                Image(systemName: "timer")
                    .foregroundColor(.green)
            }
        }
    }

    // MARK: - ロック画面バナー

    @ViewBuilder
    private func lockScreenView(context: ActivityViewContext<HabitTimerAttributes>) -> some View {
        HStack(spacing: 12) {
            Image(systemName: "timer")
                .font(.title2)
                .foregroundColor(.green)

            VStack(alignment: .leading, spacing: 2) {
                Text(context.attributes.habitName)
                    .font(.headline)
                    .lineLimit(1)

                if context.state.isPaused {
                    Text("一時停止中")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            Spacer()

            timerText(context: context)
                .font(.title2)
                .fontWeight(.bold)
                .monospacedDigit()
        }
        .padding()
    }

    // MARK: - ヘルパー

    @ViewBuilder
    private func timerText(context: ActivityViewContext<HabitTimerAttributes>) -> some View {
        if context.state.isPaused {
            Text(formatTime(context.state.remainingSeconds))
        } else {
            Text(context.state.endDate, style: .timer)
        }
    }

    private func progress(context: ActivityViewContext<HabitTimerAttributes>) -> Double {
        let target = Double(context.attributes.targetSeconds)
        guard target > 0 else { return 1.0 }

        if context.state.isPaused {
            let remaining = Double(context.state.remainingSeconds)
            return 1.0 - (remaining / target)
        }

        let remaining = context.state.endDate.timeIntervalSinceNow
        return 1.0 - (remaining / target)
    }

    private func formatTime(_ totalSeconds: Int) -> String {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
