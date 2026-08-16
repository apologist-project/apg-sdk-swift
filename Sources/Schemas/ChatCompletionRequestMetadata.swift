import Foundation

public struct ChatCompletionRequestMetadata: Codable, Hashable, Sendable {
    public let anonymous: Nullable<Bool>?
    public let conversation: Nullable<String>?
    public let language: Nullable<String>?
    public let maxMemories: Nullable<Int>?
    public let parentUrl: Nullable<String>?
    public let parentHost: Nullable<String>?
    public let session: Nullable<String>?
    public let device: Nullable<String>?
    /// Acquisition / campaign referral code stored on the user first-write-wins. Empty values are ignored; an existing user referral_code is never overwritten. The Agent UI maps ?ref=, then ?referral_code=, then ?utm_campaign= into this field.
    public let referralCode: Nullable<String>?
    public let sharedPrompt: Nullable<Int>?
    public let translation: Nullable<String>?
    /// String key/value pairs substituted into `{key}` placeholders in the assembled system prompt. Never persisted; omitted from response metadata. Reserved system keys (language, bible, translation, passages, date/geo tokens) cannot be overridden.
    public let variables: Nullable<[String: Nullable<String>]>?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        anonymous: Nullable<Bool>? = nil,
        conversation: Nullable<String>? = nil,
        language: Nullable<String>? = nil,
        maxMemories: Nullable<Int>? = nil,
        parentUrl: Nullable<String>? = nil,
        parentHost: Nullable<String>? = nil,
        session: Nullable<String>? = nil,
        device: Nullable<String>? = nil,
        referralCode: Nullable<String>? = nil,
        sharedPrompt: Nullable<Int>? = nil,
        translation: Nullable<String>? = nil,
        variables: Nullable<[String: Nullable<String>]>? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.anonymous = anonymous
        self.conversation = conversation
        self.language = language
        self.maxMemories = maxMemories
        self.parentUrl = parentUrl
        self.parentHost = parentHost
        self.session = session
        self.device = device
        self.referralCode = referralCode
        self.sharedPrompt = sharedPrompt
        self.translation = translation
        self.variables = variables
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.anonymous = try container.decodeNullableIfPresent(Bool.self, forKey: .anonymous)
        self.conversation = try container.decodeNullableIfPresent(String.self, forKey: .conversation)
        self.language = try container.decodeNullableIfPresent(String.self, forKey: .language)
        self.maxMemories = try container.decodeNullableIfPresent(Int.self, forKey: .maxMemories)
        self.parentUrl = try container.decodeNullableIfPresent(String.self, forKey: .parentUrl)
        self.parentHost = try container.decodeNullableIfPresent(String.self, forKey: .parentHost)
        self.session = try container.decodeNullableIfPresent(String.self, forKey: .session)
        self.device = try container.decodeNullableIfPresent(String.self, forKey: .device)
        self.referralCode = try container.decodeNullableIfPresent(String.self, forKey: .referralCode)
        self.sharedPrompt = try container.decodeNullableIfPresent(Int.self, forKey: .sharedPrompt)
        self.translation = try container.decodeNullableIfPresent(String.self, forKey: .translation)
        self.variables = try container.decodeNullableIfPresent([String: Nullable<String>].self, forKey: .variables)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.anonymous, forKey: .anonymous)
        try container.encodeNullableIfPresent(self.conversation, forKey: .conversation)
        try container.encodeNullableIfPresent(self.language, forKey: .language)
        try container.encodeNullableIfPresent(self.maxMemories, forKey: .maxMemories)
        try container.encodeNullableIfPresent(self.parentUrl, forKey: .parentUrl)
        try container.encodeNullableIfPresent(self.parentHost, forKey: .parentHost)
        try container.encodeNullableIfPresent(self.session, forKey: .session)
        try container.encodeNullableIfPresent(self.device, forKey: .device)
        try container.encodeNullableIfPresent(self.referralCode, forKey: .referralCode)
        try container.encodeNullableIfPresent(self.sharedPrompt, forKey: .sharedPrompt)
        try container.encodeNullableIfPresent(self.translation, forKey: .translation)
        try container.encodeNullableIfPresent(self.variables, forKey: .variables)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case anonymous
        case conversation
        case language
        case maxMemories = "max_memories"
        case parentUrl = "parent_url"
        case parentHost = "parent_host"
        case session
        case device
        case referralCode = "referral_code"
        case sharedPrompt = "shared_prompt"
        case translation
        case variables
    }
}