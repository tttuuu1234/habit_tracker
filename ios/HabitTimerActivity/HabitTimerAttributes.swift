import ActivityKit
import Foundation

struct HabitTimerAttributes: ActivityAttributes {
    /// 習慣名（固定情報）。
    let habitName: String

    /// 目標時間（秒）。
    let targetSeconds: Int

    struct ContentState: Codable, Hashable {
        /// タイマー終了予定時刻。
        let endDate: Date

        /// 一時停止中かどうか。
        let isPaused: Bool

        /// 一時停止時の残り時間（秒）。
        let remainingSeconds: Int
    }
}
