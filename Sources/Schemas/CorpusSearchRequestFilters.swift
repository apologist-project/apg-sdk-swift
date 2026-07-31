import Foundation

public struct CorpusSearchRequestFilters: Codable, Hashable, Sendable {
    public let model: Nullable<String>?
    public let ids: Nullable<[Int]>?
    public let types: Nullable<[String]>?
    public let languages: Nullable<[String]>?
    public let collectionIds: Nullable<[Int]>?
    public let contributorIds: Nullable<[Int]>?
    public let categoryIds: Nullable<[Int]>?
    public let classificationIds: Nullable<[Int]>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        model: Nullable<String>? = nil,
        ids: Nullable<[Int]>? = nil,
        types: Nullable<[String]>? = nil,
        languages: Nullable<[String]>? = nil,
        collectionIds: Nullable<[Int]>? = nil,
        contributorIds: Nullable<[Int]>? = nil,
        categoryIds: Nullable<[Int]>? = nil,
        classificationIds: Nullable<[Int]>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.model = model
        self.ids = ids
        self.types = types
        self.languages = languages
        self.collectionIds = collectionIds
        self.contributorIds = contributorIds
        self.categoryIds = categoryIds
        self.classificationIds = classificationIds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.model = try container.decodeNullableIfPresent(String.self, forKey: .model)
        self.ids = try container.decodeNullableIfPresent([Int].self, forKey: .ids)
        self.types = try container.decodeNullableIfPresent([String].self, forKey: .types)
        self.languages = try container.decodeNullableIfPresent([String].self, forKey: .languages)
        self.collectionIds = try container.decodeNullableIfPresent([Int].self, forKey: .collectionIds)
        self.contributorIds = try container.decodeNullableIfPresent([Int].self, forKey: .contributorIds)
        self.categoryIds = try container.decodeNullableIfPresent([Int].self, forKey: .categoryIds)
        self.classificationIds = try container.decodeNullableIfPresent([Int].self, forKey: .classificationIds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.model, forKey: .model)
        try container.encodeNullableIfPresent(self.ids, forKey: .ids)
        try container.encodeNullableIfPresent(self.types, forKey: .types)
        try container.encodeNullableIfPresent(self.languages, forKey: .languages)
        try container.encodeNullableIfPresent(self.collectionIds, forKey: .collectionIds)
        try container.encodeNullableIfPresent(self.contributorIds, forKey: .contributorIds)
        try container.encodeNullableIfPresent(self.categoryIds, forKey: .categoryIds)
        try container.encodeNullableIfPresent(self.classificationIds, forKey: .classificationIds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case ids
        case types
        case languages
        case collectionIds = "collection_ids"
        case contributorIds = "contributor_ids"
        case categoryIds = "category_ids"
        case classificationIds = "classification_ids"
    }
}