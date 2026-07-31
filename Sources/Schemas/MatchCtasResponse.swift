import Foundation

public struct MatchCtasResponse: Codable, Hashable, Sendable {
    public let ctas: [[String: JSONValue]]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        ctas: [[String: JSONValue]]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.ctas = ctas
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ctas = try container.decodeIfPresent([[String: JSONValue]].self, forKey: .ctas)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.ctas, forKey: .ctas)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case ctas
    }
}