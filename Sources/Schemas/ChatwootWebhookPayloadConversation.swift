import Foundation

/// Nested on message events. Conversation events send `id`, `status`, and `meta` at the top level instead.
public struct ChatwootWebhookPayloadConversation: Codable, Hashable, Sendable {
    /// Conversation display id.
    public let id: Int?
    /// `pending`, `open`, `resolved`, or `snoozed`.
    public let status: String?
    public let account: ChatwootWebhookPayloadConversationAccount?
    public let meta: ChatwootConversationMeta?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: Int? = nil,
        status: String? = nil,
        account: ChatwootWebhookPayloadConversationAccount? = nil,
        meta: ChatwootConversationMeta? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.status = status
        self.account = account
        self.meta = meta
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.account = try container.decodeIfPresent(ChatwootWebhookPayloadConversationAccount.self, forKey: .account)
        self.meta = try container.decodeIfPresent(ChatwootConversationMeta.self, forKey: .meta)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.account, forKey: .account)
        try container.encodeIfPresent(self.meta, forKey: .meta)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case status
        case account
        case meta
    }
}