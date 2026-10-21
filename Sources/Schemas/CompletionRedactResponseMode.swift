import Foundation

public enum CompletionRedactResponseMode: String, Codable, Hashable, CaseIterable, Sendable {
    case scrub
    case anonymize
}