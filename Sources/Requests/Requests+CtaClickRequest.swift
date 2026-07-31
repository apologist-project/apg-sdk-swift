import Foundation

extension Requests {
    public struct CtaClickRequest: Codable, Hashable, Sendable {
        public let promptId: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            promptId: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.promptId = promptId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.promptId = try container.decode(String.self, forKey: .promptId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.promptId, forKey: .promptId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case promptId = "prompt_id"
        }
    }
}