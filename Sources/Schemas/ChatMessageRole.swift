import Foundation

public enum ChatMessageRole: String, Codable, Hashable, CaseIterable, Sendable {
    case system
    case user
    case assistant
}