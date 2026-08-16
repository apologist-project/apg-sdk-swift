import Foundation

/// A conversation scoped to the requesting agent.
public struct Conversation: Codable, Hashable, Sendable {
    /// Internal conversation id (UUID).
    public let id: String?
    /// Team-scoped external conversation id.
    public let externalId: Nullable<String>?
    public let agentId: Int?
    public let teamId: Int?
    public let tags: Nullable<[String: JSONValue]>?
    public let startedAt: String?
    public let endedAt: Nullable<String>?
    public let agentPaused: Bool?
    public let agentPausedAt: Nullable<String>?
    public let agentResumedAt: Nullable<String>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String? = nil,
        externalId: Nullable<String>? = nil,
        agentId: Int? = nil,
        teamId: Int? = nil,
        tags: Nullable<[String: JSONValue]>? = nil,
        startedAt: String? = nil,
        endedAt: Nullable<String>? = nil,
        agentPaused: Bool? = nil,
        agentPausedAt: Nullable<String>? = nil,
        agentResumedAt: Nullable<String>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.externalId = externalId
        self.agentId = agentId
        self.teamId = teamId
        self.tags = tags
        self.startedAt = startedAt
        self.endedAt = endedAt
        self.agentPaused = agentPaused
        self.agentPausedAt = agentPausedAt
        self.agentResumedAt = agentResumedAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.externalId = try container.decodeNullableIfPresent(String.self, forKey: .externalId)
        self.agentId = try container.decodeIfPresent(Int.self, forKey: .agentId)
        self.teamId = try container.decodeIfPresent(Int.self, forKey: .teamId)
        self.tags = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .tags)
        self.startedAt = try container.decodeIfPresent(String.self, forKey: .startedAt)
        self.endedAt = try container.decodeNullableIfPresent(String.self, forKey: .endedAt)
        self.agentPaused = try container.decodeIfPresent(Bool.self, forKey: .agentPaused)
        self.agentPausedAt = try container.decodeNullableIfPresent(String.self, forKey: .agentPausedAt)
        self.agentResumedAt = try container.decodeNullableIfPresent(String.self, forKey: .agentResumedAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.externalId, forKey: .externalId)
        try container.encodeIfPresent(self.agentId, forKey: .agentId)
        try container.encodeIfPresent(self.teamId, forKey: .teamId)
        try container.encodeNullableIfPresent(self.tags, forKey: .tags)
        try container.encodeIfPresent(self.startedAt, forKey: .startedAt)
        try container.encodeNullableIfPresent(self.endedAt, forKey: .endedAt)
        try container.encodeIfPresent(self.agentPaused, forKey: .agentPaused)
        try container.encodeNullableIfPresent(self.agentPausedAt, forKey: .agentPausedAt)
        try container.encodeNullableIfPresent(self.agentResumedAt, forKey: .agentResumedAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case externalId = "external_id"
        case agentId = "agent_id"
        case teamId = "team_id"
        case tags
        case startedAt = "started_at"
        case endedAt = "ended_at"
        case agentPaused = "agent_paused"
        case agentPausedAt = "agent_paused_at"
        case agentResumedAt = "agent_resumed_at"
    }
}