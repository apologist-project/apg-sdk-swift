import Foundation

public struct WebhookEventInfo: Codable, Hashable, Sendable {
    /// Stable machine-readable event key.
    public let key: WebhookEventInfoKey
    /// Human-readable event label.
    public let label: String
    public let occurredAt: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        key: WebhookEventInfoKey,
        label: String,
        occurredAt: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.key = key
        self.label = label
        self.occurredAt = occurredAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.key = try container.decode(WebhookEventInfoKey.self, forKey: .key)
        self.label = try container.decode(String.self, forKey: .label)
        self.occurredAt = try container.decode(Date.self, forKey: .occurredAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.key, forKey: .key)
        try container.encode(self.label, forKey: .label)
        try container.encode(self.occurredAt, forKey: .occurredAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case key
        case label
        case occurredAt = "occurred_at"
    }
}