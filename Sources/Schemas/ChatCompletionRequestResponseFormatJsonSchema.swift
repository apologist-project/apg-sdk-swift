import Foundation

/// Required when type is json_schema. Supplies the JSON Schema the structured output must conform to. Structured outputs are non-streaming.
public struct ChatCompletionRequestResponseFormatJsonSchema: Codable, Hashable, Sendable {
    public let name: Nullable<String>?
    public let description: Nullable<String>?
    public let schema: Nullable<[String: JSONValue]>?
    public let strict: Nullable<Bool>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        name: Nullable<String>? = nil,
        description: Nullable<String>? = nil,
        schema: Nullable<[String: JSONValue]>? = nil,
        strict: Nullable<Bool>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.name = name
        self.description = description
        self.schema = schema
        self.strict = strict
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeNullableIfPresent(String.self, forKey: .name)
        self.description = try container.decodeNullableIfPresent(String.self, forKey: .description)
        self.schema = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .schema)
        self.strict = try container.decodeNullableIfPresent(Bool.self, forKey: .strict)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.name, forKey: .name)
        try container.encodeNullableIfPresent(self.description, forKey: .description)
        try container.encodeNullableIfPresent(self.schema, forKey: .schema)
        try container.encodeNullableIfPresent(self.strict, forKey: .strict)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case description
        case schema
        case strict
    }
}