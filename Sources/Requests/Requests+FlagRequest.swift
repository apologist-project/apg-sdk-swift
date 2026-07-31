import Foundation

extension Requests {
    public struct FlagRequest: Codable, Hashable, Sendable {
        public let flagged: Bool
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            flagged: Bool,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.flagged = flagged
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.flagged = try container.decode(Bool.self, forKey: .flagged)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.flagged, forKey: .flagged)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case flagged
        }
    }
}