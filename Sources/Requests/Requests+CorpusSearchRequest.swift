import Foundation

extension Requests {
    public struct CorpusSearchRequest: Codable, Hashable, Sendable {
        public let query: String
        public let promptId: Nullable<String>?
        public let limit: Nullable<Int>?
        public let filters: Nullable<CorpusSearchRequestFilters>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            query: String,
            promptId: Nullable<String>? = nil,
            limit: Nullable<Int>? = nil,
            filters: Nullable<CorpusSearchRequestFilters>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.query = query
            self.promptId = promptId
            self.limit = limit
            self.filters = filters
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.query = try container.decode(String.self, forKey: .query)
            self.promptId = try container.decodeNullableIfPresent(String.self, forKey: .promptId)
            self.limit = try container.decodeNullableIfPresent(Int.self, forKey: .limit)
            self.filters = try container.decodeNullableIfPresent(CorpusSearchRequestFilters.self, forKey: .filters)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.query, forKey: .query)
            try container.encodeNullableIfPresent(self.promptId, forKey: .promptId)
            try container.encodeNullableIfPresent(self.limit, forKey: .limit)
            try container.encodeNullableIfPresent(self.filters, forKey: .filters)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case query
            case promptId = "prompt_id"
            case limit
            case filters
        }
    }
}