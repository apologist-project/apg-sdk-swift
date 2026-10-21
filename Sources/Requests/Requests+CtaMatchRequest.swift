import Foundation

extension Requests {
    public struct CtaMatchRequest: Codable, Hashable, Sendable {
        public let conversation: Nullable<String>?
        public let client: Nullable<String>?
        public let device: Nullable<String>?
        /// ISO language code, or `auto` to detect from the prompt.
        public let language: Nullable<String>?
        public let limit: Nullable<Int>?
        /// Chat messages in OpenAI format.
        public let messages: Nullable<[ChatMessage]>?
        public let session: Nullable<String>?
        public let user: Nullable<String>?
        /// Flat string key/value pairs substituted into `{key}` placeholders in evaluator prompts run during CTA matching. Not persisted.
        public let variables: Nullable<[String: Nullable<String>]>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            conversation: Nullable<String>? = nil,
            client: Nullable<String>? = nil,
            device: Nullable<String>? = nil,
            language: Nullable<String>? = nil,
            limit: Nullable<Int>? = nil,
            messages: Nullable<[ChatMessage]>? = nil,
            session: Nullable<String>? = nil,
            user: Nullable<String>? = nil,
            variables: Nullable<[String: Nullable<String>]>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.conversation = conversation
            self.client = client
            self.device = device
            self.language = language
            self.limit = limit
            self.messages = messages
            self.session = session
            self.user = user
            self.variables = variables
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.conversation = try container.decodeNullableIfPresent(String.self, forKey: .conversation)
            self.client = try container.decodeNullableIfPresent(String.self, forKey: .client)
            self.device = try container.decodeNullableIfPresent(String.self, forKey: .device)
            self.language = try container.decodeNullableIfPresent(String.self, forKey: .language)
            self.limit = try container.decodeNullableIfPresent(Int.self, forKey: .limit)
            self.messages = try container.decodeNullableIfPresent([ChatMessage].self, forKey: .messages)
            self.session = try container.decodeNullableIfPresent(String.self, forKey: .session)
            self.user = try container.decodeNullableIfPresent(String.self, forKey: .user)
            self.variables = try container.decodeNullableIfPresent([String: Nullable<String>].self, forKey: .variables)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.conversation, forKey: .conversation)
            try container.encodeNullableIfPresent(self.client, forKey: .client)
            try container.encodeNullableIfPresent(self.device, forKey: .device)
            try container.encodeNullableIfPresent(self.language, forKey: .language)
            try container.encodeNullableIfPresent(self.limit, forKey: .limit)
            try container.encodeNullableIfPresent(self.messages, forKey: .messages)
            try container.encodeNullableIfPresent(self.session, forKey: .session)
            try container.encodeNullableIfPresent(self.user, forKey: .user)
            try container.encodeNullableIfPresent(self.variables, forKey: .variables)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case conversation
            case client
            case device
            case language
            case limit
            case messages
            case session
            case user
            case variables
        }
    }
}