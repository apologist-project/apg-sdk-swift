import Foundation

/// Result of scrubbing or anonymizing a user's message-adjacent text. Rows and identifiers are kept.
public struct UserRedactResponse: Codable, Hashable, Sendable {
    /// Internal user id (UUID).
    public let id: String?
    public let mode: UserRedactResponseMode?
    /// When the erase request was stamped. The hourly cron finishes leftover rows.
    public let redactRequestedAt: Nullable<String>?
    /// Message rows rewritten in this request.
    public let messagesRedacted: Int?
    /// Message rows still waiting. Zero means this request finished the user.
    public let remaining: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String? = nil,
        mode: UserRedactResponseMode? = nil,
        redactRequestedAt: Nullable<String>? = nil,
        messagesRedacted: Int? = nil,
        remaining: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.mode = mode
        self.redactRequestedAt = redactRequestedAt
        self.messagesRedacted = messagesRedacted
        self.remaining = remaining
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.mode = try container.decodeIfPresent(UserRedactResponseMode.self, forKey: .mode)
        self.redactRequestedAt = try container.decodeNullableIfPresent(String.self, forKey: .redactRequestedAt)
        self.messagesRedacted = try container.decodeIfPresent(Int.self, forKey: .messagesRedacted)
        self.remaining = try container.decodeIfPresent(Int.self, forKey: .remaining)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.mode, forKey: .mode)
        try container.encodeNullableIfPresent(self.redactRequestedAt, forKey: .redactRequestedAt)
        try container.encodeIfPresent(self.messagesRedacted, forKey: .messagesRedacted)
        try container.encodeIfPresent(self.remaining, forKey: .remaining)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case mode
        case redactRequestedAt = "redact_requested_at"
        case messagesRedacted = "messages_redacted"
        case remaining
    }
}