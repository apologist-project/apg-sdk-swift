import Foundation

public enum BenchmarkRunRequestReasoningEffort: String, Codable, Hashable, CaseIterable, Sendable {
    case low
    case medium
    case high
}