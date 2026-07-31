import Foundation

public enum EvaluatorRequestVerbosity: String, Codable, Hashable, CaseIterable, Sendable {
    case minimal
    case low
    case medium
    case high
}