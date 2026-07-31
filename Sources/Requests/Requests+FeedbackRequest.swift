import Foundation

extension Requests {
    public struct FeedbackRequest: Codable, Hashable, Sendable {
        public let feedback: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            feedback: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.feedback = feedback
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.feedback = try container.decode(String.self, forKey: .feedback)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.feedback, forKey: .feedback)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case feedback
        }
    }
}