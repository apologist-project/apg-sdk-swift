import Foundation

extension Requests {
    public struct UserUpdateRequest: Codable, Hashable, Sendable {
        /// Your external identifier for the user.
        public let externalId: Nullable<String>?
        /// Applied tags as a mix of existing tag ids and/or default-language tag names. Unknown ids or names are rejected. Tags are mirror-owned and never created here.
        public let tags: [UserUpdateRequestTagsItem]?
        /// Responder to persist for this user on the requesting agent. Must be active on the agent.
        public let responderId: Int?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            externalId: Nullable<String>? = nil,
            tags: [UserUpdateRequestTagsItem]? = nil,
            responderId: Int? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.externalId = externalId
            self.tags = tags
            self.responderId = responderId
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.externalId = try container.decodeNullableIfPresent(String.self, forKey: .externalId)
            self.tags = try container.decodeIfPresent([UserUpdateRequestTagsItem].self, forKey: .tags)
            self.responderId = try container.decodeIfPresent(Int.self, forKey: .responderId)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.externalId, forKey: .externalId)
            try container.encodeIfPresent(self.tags, forKey: .tags)
            try container.encodeIfPresent(self.responderId, forKey: .responderId)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case externalId = "external_id"
            case tags
            case responderId = "responder_id"
        }
    }
}