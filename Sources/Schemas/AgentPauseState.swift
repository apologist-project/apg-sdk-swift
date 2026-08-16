import Foundation

/// Agent-wide pause or resume result, including fan-out counts.
public struct AgentPauseState: Codable, Hashable, Sendable {
    public let isPaused: Bool?
    public let pausedAt: Nullable<String>?
    public let resumedAt: Nullable<String>?
    /// Conversations that received a transition message.
    public let emitted: Int?
    /// Conversations skipped during fan-out.
    public let skipped: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        isPaused: Bool? = nil,
        pausedAt: Nullable<String>? = nil,
        resumedAt: Nullable<String>? = nil,
        emitted: Int? = nil,
        skipped: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.isPaused = isPaused
        self.pausedAt = pausedAt
        self.resumedAt = resumedAt
        self.emitted = emitted
        self.skipped = skipped
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.isPaused = try container.decodeIfPresent(Bool.self, forKey: .isPaused)
        self.pausedAt = try container.decodeNullableIfPresent(String.self, forKey: .pausedAt)
        self.resumedAt = try container.decodeNullableIfPresent(String.self, forKey: .resumedAt)
        self.emitted = try container.decodeIfPresent(Int.self, forKey: .emitted)
        self.skipped = try container.decodeIfPresent(Int.self, forKey: .skipped)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.isPaused, forKey: .isPaused)
        try container.encodeNullableIfPresent(self.pausedAt, forKey: .pausedAt)
        try container.encodeNullableIfPresent(self.resumedAt, forKey: .resumedAt)
        try container.encodeIfPresent(self.emitted, forKey: .emitted)
        try container.encodeIfPresent(self.skipped, forKey: .skipped)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case isPaused = "is_paused"
        case pausedAt = "paused_at"
        case resumedAt = "resumed_at"
        case emitted
        case skipped
    }
}