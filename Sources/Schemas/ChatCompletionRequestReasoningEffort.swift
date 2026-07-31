import Foundation

public enum ChatCompletionRequestReasoningEffort: String, Codable, Hashable, CaseIterable, Sendable {
    case low
    case medium
    case high
}