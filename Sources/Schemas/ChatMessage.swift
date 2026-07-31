import Foundation

public struct ChatMessage: Codable, Hashable, Sendable {
    public let role: ChatMessageRole?
    public let content: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        role: ChatMessageRole? = nil,
        content: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.role = role
        self.content = content
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.role = try container.decodeIfPresent(ChatMessageRole.self, forKey: .role)
        self.content = try container.decodeIfPresent(String.self, forKey: .content)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.role, forKey: .role)
        try container.encodeIfPresent(self.content, forKey: .content)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case role
        case content
    }
}