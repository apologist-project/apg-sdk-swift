import Foundation

public enum ChatCompletionRequestToolChoiceZero: String, Codable, Hashable, CaseIterable, Sendable {
    case none
    case auto
    case required
}