import Foundation

/// OpenTelemetry context for the API request that produced this event. Present when the Agent created or continued a W3C trace.
public struct WebhookPayloadTrace: Codable, Hashable, Sendable {
    /// 32-character hex trace id
    public let traceId: String?
    /// 16-character hex span id
    public let spanId: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        traceId: String? = nil,
        spanId: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.traceId = traceId
        self.spanId = spanId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.traceId = try container.decodeIfPresent(String.self, forKey: .traceId)
        self.spanId = try container.decodeIfPresent(String.self, forKey: .spanId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.traceId, forKey: .traceId)
        try container.encodeIfPresent(self.spanId, forKey: .spanId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case traceId = "trace_id"
        case spanId = "span_id"
    }
}