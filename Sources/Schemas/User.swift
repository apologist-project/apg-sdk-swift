import Foundation

public struct User: Codable, Hashable, Sendable {
    /// Internal user id (UUID).
    public let id: String?
    public let externalId: Nullable<String>?
    /// First-write-wins acquisition / campaign referral code.
    public let referralCode: Nullable<String>?
    public let teamId: Int?
    public let createdAt: String?
    public let migratedAt: Nullable<String>?
    public let migratedToUserId: Nullable<String>?
    public let tags: [TagRef]?
    public let responderId: Nullable<Int>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String? = nil,
        externalId: Nullable<String>? = nil,
        referralCode: Nullable<String>? = nil,
        teamId: Int? = nil,
        createdAt: String? = nil,
        migratedAt: Nullable<String>? = nil,
        migratedToUserId: Nullable<String>? = nil,
        tags: [TagRef]? = nil,
        responderId: Nullable<Int>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.externalId = externalId
        self.referralCode = referralCode
        self.teamId = teamId
        self.createdAt = createdAt
        self.migratedAt = migratedAt
        self.migratedToUserId = migratedToUserId
        self.tags = tags
        self.responderId = responderId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.externalId = try container.decodeNullableIfPresent(String.self, forKey: .externalId)
        self.referralCode = try container.decodeNullableIfPresent(String.self, forKey: .referralCode)
        self.teamId = try container.decodeIfPresent(Int.self, forKey: .teamId)
        self.createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt)
        self.migratedAt = try container.decodeNullableIfPresent(String.self, forKey: .migratedAt)
        self.migratedToUserId = try container.decodeNullableIfPresent(String.self, forKey: .migratedToUserId)
        self.tags = try container.decodeIfPresent([TagRef].self, forKey: .tags)
        self.responderId = try container.decodeNullableIfPresent(Int.self, forKey: .responderId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.externalId, forKey: .externalId)
        try container.encodeNullableIfPresent(self.referralCode, forKey: .referralCode)
        try container.encodeIfPresent(self.teamId, forKey: .teamId)
        try container.encodeIfPresent(self.createdAt, forKey: .createdAt)
        try container.encodeNullableIfPresent(self.migratedAt, forKey: .migratedAt)
        try container.encodeNullableIfPresent(self.migratedToUserId, forKey: .migratedToUserId)
        try container.encodeIfPresent(self.tags, forKey: .tags)
        try container.encodeNullableIfPresent(self.responderId, forKey: .responderId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case externalId = "external_id"
        case referralCode = "referral_code"
        case teamId = "team_id"
        case createdAt = "created_at"
        case migratedAt = "migrated_at"
        case migratedToUserId = "migrated_to_user_id"
        case tags
        case responderId = "responder_id"
    }
}