import Foundation

public struct ChatCompletionResponseUsage: Codable, Hashable, Sendable {
    public let promptTokens: Int?
    public let completionTokens: Int?
    public let totalTokens: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        promptTokens: Int? = nil,
        completionTokens: Int? = nil,
        totalTokens: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.promptTokens = promptTokens
        self.completionTokens = completionTokens
        self.totalTokens = totalTokens
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.promptTokens = try container.decodeIfPresent(Int.self, forKey: .promptTokens)
        self.completionTokens = try container.decodeIfPresent(Int.self, forKey: .completionTokens)
        self.totalTokens = try container.decodeIfPresent(Int.self, forKey: .totalTokens)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.promptTokens, forKey: .promptTokens)
        try container.encodeIfPresent(self.completionTokens, forKey: .completionTokens)
        try container.encodeIfPresent(self.totalTokens, forKey: .totalTokens)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case promptTokens = "prompt_tokens"
        case completionTokens = "completion_tokens"
        case totalTokens = "total_tokens"
    }
}