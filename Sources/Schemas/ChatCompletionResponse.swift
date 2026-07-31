import Foundation

public struct ChatCompletionResponse: Codable, Hashable, Sendable {
    public let id: String?
    public let object: String?
    public let created: Int?
    public let model: String?
    public let choices: [ChatCompletionResponseChoicesItem]?
    public let usage: ChatCompletionResponseUsage?
    public let cached: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String? = nil,
        object: String? = nil,
        created: Int? = nil,
        model: String? = nil,
        choices: [ChatCompletionResponseChoicesItem]? = nil,
        usage: ChatCompletionResponseUsage? = nil,
        cached: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.object = object
        self.created = created
        self.model = model
        self.choices = choices
        self.usage = usage
        self.cached = cached
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.object = try container.decodeIfPresent(String.self, forKey: .object)
        self.created = try container.decodeIfPresent(Int.self, forKey: .created)
        self.model = try container.decodeIfPresent(String.self, forKey: .model)
        self.choices = try container.decodeIfPresent([ChatCompletionResponseChoicesItem].self, forKey: .choices)
        self.usage = try container.decodeIfPresent(ChatCompletionResponseUsage.self, forKey: .usage)
        self.cached = try container.decodeIfPresent(Bool.self, forKey: .cached)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.object, forKey: .object)
        try container.encodeIfPresent(self.created, forKey: .created)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encodeIfPresent(self.choices, forKey: .choices)
        try container.encodeIfPresent(self.usage, forKey: .usage)
        try container.encodeIfPresent(self.cached, forKey: .cached)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case object
        case created
        case model
        case choices
        case usage
        case cached
    }
}