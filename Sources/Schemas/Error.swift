import Foundation

public struct Error: Codable, Hashable, Sendable {
    public let success: Bool
    public let errors: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        success: Bool,
        errors: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.success = success
        self.errors = errors
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.errors = try container.decode([String].self, forKey: .errors)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.success, forKey: .success)
        try container.encode(self.errors, forKey: .errors)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case success
        case errors
    }
}