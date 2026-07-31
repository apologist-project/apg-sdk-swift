import Foundation

extension Requests {
    public struct ShareRequest: Codable, Hashable, Sendable {
        public let conversationId: Nullable<String>?
        public let sessionId: Nullable<String>?
        public let userId: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            conversationId: Nullable<String>? = nil,
            sessionId: Nullable<String>? = nil,
            userId: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.conversationId = conversationId
            self.sessionId = sessionId
            self.userId = userId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.conversationId = try container.decodeNullableIfPresent(String.self, forKey: .conversationId)
            self.sessionId = try container.decodeNullableIfPresent(String.self, forKey: .sessionId)
            self.userId = try container.decodeNullableIfPresent(String.self, forKey: .userId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.conversationId, forKey: .conversationId)
            try container.encodeNullableIfPresent(self.sessionId, forKey: .sessionId)
            try container.encodeNullableIfPresent(self.userId, forKey: .userId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case conversationId = "conversation_id"
            case sessionId = "session_id"
            case userId = "user_id"
        }
    }
}