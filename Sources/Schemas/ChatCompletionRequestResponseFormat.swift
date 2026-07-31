import Foundation

public struct ChatCompletionRequestResponseFormat: Codable, Hashable, Sendable {
    public let type: Nullable<ChatCompletionRequestResponseFormatType>?
    /// Required when type is json_schema. Supplies the JSON Schema the structured output must conform to. Structured outputs are non-streaming.
    public let jsonSchema: Nullable<ChatCompletionRequestResponseFormatJsonSchema>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        type: Nullable<ChatCompletionRequestResponseFormatType>? = nil,
        jsonSchema: Nullable<ChatCompletionRequestResponseFormatJsonSchema>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.type = type
        self.jsonSchema = jsonSchema
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decodeNullableIfPresent(ChatCompletionRequestResponseFormatType.self, forKey: .type)
        self.jsonSchema = try container.decodeNullableIfPresent(ChatCompletionRequestResponseFormatJsonSchema.self, forKey: .jsonSchema)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.type, forKey: .type)
        try container.encodeNullableIfPresent(self.jsonSchema, forKey: .jsonSchema)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case jsonSchema = "json_schema"
    }
}