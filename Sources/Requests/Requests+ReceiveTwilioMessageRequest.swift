import Foundation

extension Requests {
    public struct ReceiveTwilioMessageRequest: Codable, Hashable, Sendable {
        public let from: String?
        public let body: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            from: String? = nil,
            body: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.from = from
            self.body = body
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.from = try container.decodeIfPresent(String.self, forKey: .from)
            self.body = try container.decodeIfPresent(String.self, forKey: .body)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.from, forKey: .from)
            try container.encodeIfPresent(self.body, forKey: .body)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case from = "From"
            case body = "Body"
        }
    }
}