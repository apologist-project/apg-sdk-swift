import Foundation

public enum UserRedactResponseMode: String, Codable, Hashable, CaseIterable, Sendable {
    case scrub
    case anonymize
}