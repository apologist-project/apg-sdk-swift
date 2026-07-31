import Foundation

/// A team-level user flag definition from the user_flags table.
public struct UserFlag: Codable, Hashable, Sendable {
    public let id: Int?
    public let name: String?
    /// Upstream owning user id when present (mirrored from Ignite).
    public let userId: Nullable<Int>?
    public let teamId: Nullable<Int>?
    public let syncedAt: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: Int? = nil,
        name: String? = nil,
        userId: Nullable<Int>? = nil,
        teamId: Nullable<Int>? = nil,
        syncedAt: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.name = name
        self.userId = userId
        self.teamId = teamId
        self.syncedAt = syncedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.userId = try container.decodeNullableIfPresent(Int.self, forKey: .userId)
        self.teamId = try container.decodeNullableIfPresent(Int.self, forKey: .teamId)
        self.syncedAt = try container.decodeIfPresent(String.self, forKey: .syncedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeNullableIfPresent(self.userId, forKey: .userId)
        try container.encodeNullableIfPresent(self.teamId, forKey: .teamId)
        try container.encodeIfPresent(self.syncedAt, forKey: .syncedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case name
        case userId = "user_id"
        case teamId = "team_id"
        case syncedAt = "synced_at"
    }
}