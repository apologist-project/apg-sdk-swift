import Foundation

public struct ChatCompletionResponseChoicesItem: Codable, Hashable, Sendable {
    public let index: Int?
    public let message: ChatMessage?
    public let logprobs: Nullable<[String: JSONValue]>?
    public let finishReason: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        index: Int? = nil,
        message: ChatMessage? = nil,
        logprobs: Nullable<[String: JSONValue]>? = nil,
        finishReason: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.index = index
        self.message = message
        self.logprobs = logprobs
        self.finishReason = finishReason
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.index = try container.decodeIfPresent(Int.self, forKey: .index)
        self.message = try container.decodeIfPresent(ChatMessage.self, forKey: .message)
        self.logprobs = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .logprobs)
        self.finishReason = try container.decodeIfPresent(String.self, forKey: .finishReason)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.index, forKey: .index)
        try container.encodeIfPresent(self.message, forKey: .message)
        try container.encodeNullableIfPresent(self.logprobs, forKey: .logprobs)
        try container.encodeIfPresent(self.finishReason, forKey: .finishReason)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case index
        case message
        case logprobs
        case finishReason = "finish_reason"
    }
}