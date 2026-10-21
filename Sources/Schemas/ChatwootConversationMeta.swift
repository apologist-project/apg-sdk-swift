import Foundation

public struct ChatwootConversationMeta: Codable, Hashable, Sendable {
    /// `AgentBot` while the Agent owns the thread. `User` after staff take over.
    public let assigneeType: String?
    public let sender: ChatwootConversationMetaSender?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        assigneeType: String? = nil,
        sender: ChatwootConversationMetaSender? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.assigneeType = assigneeType
        self.sender = sender
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.assigneeType = try container.decodeIfPresent(String.self, forKey: .assigneeType)
        self.sender = try container.decodeIfPresent(ChatwootConversationMetaSender.self, forKey: .sender)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.assigneeType, forKey: .assigneeType)
        try container.encodeIfPresent(self.sender, forKey: .sender)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case assigneeType = "assignee_type"
        case sender
    }
}