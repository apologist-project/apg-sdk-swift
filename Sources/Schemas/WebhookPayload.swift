import Foundation

/// Canonical JSON body POSTed to a configured webhook URL. `notification`, `event`, and `agent` are always present; `trace` is present when the event ran inside an instrumented API request. The remaining sections appear only when relevant to the event. Treat the payload as additive and ignore unrecognised fields.
public struct WebhookPayload: Codable, Hashable, Sendable {
    public let notification: WebhookNotificationRef
    public let event: WebhookEventInfo
    public let agent: WebhookAgentRef
    /// Present when the event is tied to a prompt. Includes the prompt and response plus `automations` and `tags` arrays. Shape mirrors the prompt API object.
    public let completion: Nullable<[String: JSONValue]>?
    /// Present when the prompt arrived via a channel.
    public let channel: WebhookNamedRef?
    /// Present alongside `channel` when the channel has a platform.
    public let platform: WebhookNamedRef?
    /// Present for cta_trigger and cta_click events.
    public let cta: WebhookCta?
    /// Present for guardrail_trigger events.
    public let guardrail: WebhookNamedRef?
    /// Present for automation_trigger events.
    public let automation: WebhookNamedRef?
    /// Present for CTA, guardrail, or automation events that ran an evaluation.
    public let evaluator: WebhookNamedRef?
    public let evaluation: WebhookEvaluation?
    /// OpenTelemetry context for the API request that produced this event. Present when the Agent created or continued a W3C trace.
    public let trace: WebhookPayloadTrace?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        notification: WebhookNotificationRef,
        event: WebhookEventInfo,
        agent: WebhookAgentRef,
        completion: Nullable<[String: JSONValue]>? = nil,
        channel: WebhookNamedRef? = nil,
        platform: WebhookNamedRef? = nil,
        cta: WebhookCta? = nil,
        guardrail: WebhookNamedRef? = nil,
        automation: WebhookNamedRef? = nil,
        evaluator: WebhookNamedRef? = nil,
        evaluation: WebhookEvaluation? = nil,
        trace: WebhookPayloadTrace? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.notification = notification
        self.event = event
        self.agent = agent
        self.completion = completion
        self.channel = channel
        self.platform = platform
        self.cta = cta
        self.guardrail = guardrail
        self.automation = automation
        self.evaluator = evaluator
        self.evaluation = evaluation
        self.trace = trace
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.notification = try container.decode(WebhookNotificationRef.self, forKey: .notification)
        self.event = try container.decode(WebhookEventInfo.self, forKey: .event)
        self.agent = try container.decode(WebhookAgentRef.self, forKey: .agent)
        self.completion = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .completion)
        self.channel = try container.decodeIfPresent(WebhookNamedRef.self, forKey: .channel)
        self.platform = try container.decodeIfPresent(WebhookNamedRef.self, forKey: .platform)
        self.cta = try container.decodeIfPresent(WebhookCta.self, forKey: .cta)
        self.guardrail = try container.decodeIfPresent(WebhookNamedRef.self, forKey: .guardrail)
        self.automation = try container.decodeIfPresent(WebhookNamedRef.self, forKey: .automation)
        self.evaluator = try container.decodeIfPresent(WebhookNamedRef.self, forKey: .evaluator)
        self.evaluation = try container.decodeIfPresent(WebhookEvaluation.self, forKey: .evaluation)
        self.trace = try container.decodeIfPresent(WebhookPayloadTrace.self, forKey: .trace)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.notification, forKey: .notification)
        try container.encode(self.event, forKey: .event)
        try container.encode(self.agent, forKey: .agent)
        try container.encodeNullableIfPresent(self.completion, forKey: .completion)
        try container.encodeIfPresent(self.channel, forKey: .channel)
        try container.encodeIfPresent(self.platform, forKey: .platform)
        try container.encodeIfPresent(self.cta, forKey: .cta)
        try container.encodeIfPresent(self.guardrail, forKey: .guardrail)
        try container.encodeIfPresent(self.automation, forKey: .automation)
        try container.encodeIfPresent(self.evaluator, forKey: .evaluator)
        try container.encodeIfPresent(self.evaluation, forKey: .evaluation)
        try container.encodeIfPresent(self.trace, forKey: .trace)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case notification
        case event
        case agent
        case completion
        case channel
        case platform
        case cta
        case guardrail
        case automation
        case evaluator
        case evaluation
        case trace
    }
}