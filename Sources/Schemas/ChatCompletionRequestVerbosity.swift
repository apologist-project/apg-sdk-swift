import Foundation

public enum ChatCompletionRequestVerbosity: String, Codable, Hashable, CaseIterable, Sendable {
    case minimal
    case low
    case medium
    case high
}