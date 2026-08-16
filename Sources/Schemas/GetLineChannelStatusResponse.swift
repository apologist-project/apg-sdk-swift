import Foundation

public struct GetLineChannelStatusResponse: Codable, Hashable, Sendable {
    public let status: String?
    public let channel: String?
    public let active: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: String? = nil,
        channel: String? = nil,
        active: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.channel = channel
        self.active = active
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.channel = try container.decodeIfPresent(String.self, forKey: .channel)
        self.active = try container.decodeIfPresent(Bool.self, forKey: .active)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.channel, forKey: .channel)
        try container.encodeIfPresent(self.active, forKey: .active)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case channel
        case active
    }
}