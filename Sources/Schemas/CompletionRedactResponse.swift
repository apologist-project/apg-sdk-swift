import Foundation

/// Result of scrubbing or anonymizing a chat completion's message-adjacent text. Rows and identifiers are kept.
public struct CompletionRedactResponse: Codable, Hashable, Sendable {
    /// Chat completion id (UUID).
    public let id: String?
    public let mode: CompletionRedactResponseMode?
    /// Message rows rewritten in this request.
    public let messagesRedacted: Int?
    /// Message rows still waiting. Zero means this request finished the completion.
    public let remaining: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String? = nil,
        mode: CompletionRedactResponseMode? = nil,
        messagesRedacted: Int? = nil,
        remaining: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.mode = mode
        self.messagesRedacted = messagesRedacted
        self.remaining = remaining
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.mode = try container.decodeIfPresent(CompletionRedactResponseMode.self, forKey: .mode)
        self.messagesRedacted = try container.decodeIfPresent(Int.self, forKey: .messagesRedacted)
        self.remaining = try container.decodeIfPresent(Int.self, forKey: .remaining)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.mode, forKey: .mode)
        try container.encodeIfPresent(self.messagesRedacted, forKey: .messagesRedacted)
        try container.encodeIfPresent(self.remaining, forKey: .remaining)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case mode
        case messagesRedacted = "messages_redacted"
        case remaining
    }
}