import Foundation

extension Requests {
    public struct ChatwootWebhookPayload: Codable, Hashable, Sendable {
        /// Chatwoot event name. Incoming visitor messages use `message_created`. Staff takeover and assignment use conversation events such as `conversation_opened`, `conversation_status_changed`, and `conversation_updated`.
        public let event: String?
        /// Message id on `message_*` events. Conversation display id on `conversation_*` events.
        public let id: Int?
        /// Message text. Present on message events. Empty or private notes are ignored.
        public let content: Nullable<String>?
        /// Incoming visitor messages are `incoming` (or `0`). Staff replies are `outgoing` (or `1`).
        public let messageType: String?
        /// When true, the Agent ignores the message (Chatwoot private note).
        public let `private`: Bool?
        public let account: ChatwootWebhookPayloadAccount?
        /// Present on message events.
        public let sender: ChatwootWebhookPayloadSender?
        /// Nested on message events. Conversation events send `id`, `status`, and `meta` at the top level instead.
        public let conversation: ChatwootWebhookPayloadConversation?
        /// Top-level conversation status on conversation events.
        public let status: String?
        /// Top-level conversation meta on conversation events.
        public let meta: ChatwootConversationMeta?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            event: String? = nil,
            id: Int? = nil,
            content: Nullable<String>? = nil,
            messageType: String? = nil,
            private: Bool? = nil,
            account: ChatwootWebhookPayloadAccount? = nil,
            sender: ChatwootWebhookPayloadSender? = nil,
            conversation: ChatwootWebhookPayloadConversation? = nil,
            status: String? = nil,
            meta: ChatwootConversationMeta? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.event = event
            self.id = id
            self.content = content
            self.messageType = messageType
            self.private = `private`
            self.account = account
            self.sender = sender
            self.conversation = conversation
            self.status = status
            self.meta = meta
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.event = try container.decodeIfPresent(String.self, forKey: .event)
            self.id = try container.decodeIfPresent(Int.self, forKey: .id)
            self.content = try container.decodeNullableIfPresent(String.self, forKey: .content)
            self.messageType = try container.decodeIfPresent(String.self, forKey: .messageType)
            self.private = try container.decodeIfPresent(Bool.self, forKey: .private)
            self.account = try container.decodeIfPresent(ChatwootWebhookPayloadAccount.self, forKey: .account)
            self.sender = try container.decodeIfPresent(ChatwootWebhookPayloadSender.self, forKey: .sender)
            self.conversation = try container.decodeIfPresent(ChatwootWebhookPayloadConversation.self, forKey: .conversation)
            self.status = try container.decodeIfPresent(String.self, forKey: .status)
            self.meta = try container.decodeIfPresent(ChatwootConversationMeta.self, forKey: .meta)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.event, forKey: .event)
            try container.encodeIfPresent(self.id, forKey: .id)
            try container.encodeNullableIfPresent(self.content, forKey: .content)
            try container.encodeIfPresent(self.messageType, forKey: .messageType)
            try container.encodeIfPresent(self.private, forKey: .private)
            try container.encodeIfPresent(self.account, forKey: .account)
            try container.encodeIfPresent(self.sender, forKey: .sender)
            try container.encodeIfPresent(self.conversation, forKey: .conversation)
            try container.encodeIfPresent(self.status, forKey: .status)
            try container.encodeIfPresent(self.meta, forKey: .meta)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case event
            case id
            case content
            case messageType = "message_type"
            case `private`
            case account
            case sender
            case conversation
            case status
            case meta
        }
    }
}