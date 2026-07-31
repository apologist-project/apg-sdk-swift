import Foundation

extension Requests {
    public struct EvaluatorRequest: Codable, Hashable, Sendable {
        public let frequencyPenalty: Nullable<Double>?
        public let confidenceThreshold: Nullable<Double>?
        public let content: EvaluatorRequestContent
        public let model: Nullable<String>?
        public let presencePenalty: Nullable<Double>?
        public let reasoningEffort: Nullable<EvaluatorRequestReasoningEffort>?
        public let verbosity: Nullable<EvaluatorRequestVerbosity>?
        public let temperature: Nullable<Double>?
        public let topP: Nullable<Double>?
        /// Flat string key/value pairs substituted into `{key}` placeholders in the evaluator prompt. Reserved keys (`options`, `option_descriptions`, `criteria`) cannot be overridden. Not persisted; omitted from the response.
        public let variables: Nullable<[String: Nullable<String>]>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            frequencyPenalty: Nullable<Double>? = nil,
            confidenceThreshold: Nullable<Double>? = nil,
            content: EvaluatorRequestContent,
            model: Nullable<String>? = nil,
            presencePenalty: Nullable<Double>? = nil,
            reasoningEffort: Nullable<EvaluatorRequestReasoningEffort>? = nil,
            verbosity: Nullable<EvaluatorRequestVerbosity>? = nil,
            temperature: Nullable<Double>? = nil,
            topP: Nullable<Double>? = nil,
            variables: Nullable<[String: Nullable<String>]>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.frequencyPenalty = frequencyPenalty
            self.confidenceThreshold = confidenceThreshold
            self.content = content
            self.model = model
            self.presencePenalty = presencePenalty
            self.reasoningEffort = reasoningEffort
            self.verbosity = verbosity
            self.temperature = temperature
            self.topP = topP
            self.variables = variables
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.frequencyPenalty = try container.decodeNullableIfPresent(Double.self, forKey: .frequencyPenalty)
            self.confidenceThreshold = try container.decodeNullableIfPresent(Double.self, forKey: .confidenceThreshold)
            self.content = try container.decode(EvaluatorRequestContent.self, forKey: .content)
            self.model = try container.decodeNullableIfPresent(String.self, forKey: .model)
            self.presencePenalty = try container.decodeNullableIfPresent(Double.self, forKey: .presencePenalty)
            self.reasoningEffort = try container.decodeNullableIfPresent(EvaluatorRequestReasoningEffort.self, forKey: .reasoningEffort)
            self.verbosity = try container.decodeNullableIfPresent(EvaluatorRequestVerbosity.self, forKey: .verbosity)
            self.temperature = try container.decodeNullableIfPresent(Double.self, forKey: .temperature)
            self.topP = try container.decodeNullableIfPresent(Double.self, forKey: .topP)
            self.variables = try container.decodeNullableIfPresent([String: Nullable<String>].self, forKey: .variables)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.frequencyPenalty, forKey: .frequencyPenalty)
            try container.encodeNullableIfPresent(self.confidenceThreshold, forKey: .confidenceThreshold)
            try container.encode(self.content, forKey: .content)
            try container.encodeNullableIfPresent(self.model, forKey: .model)
            try container.encodeNullableIfPresent(self.presencePenalty, forKey: .presencePenalty)
            try container.encodeNullableIfPresent(self.reasoningEffort, forKey: .reasoningEffort)
            try container.encodeNullableIfPresent(self.verbosity, forKey: .verbosity)
            try container.encodeNullableIfPresent(self.temperature, forKey: .temperature)
            try container.encodeNullableIfPresent(self.topP, forKey: .topP)
            try container.encodeNullableIfPresent(self.variables, forKey: .variables)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case frequencyPenalty = "frequency_penalty"
            case confidenceThreshold = "confidence_threshold"
            case content
            case model
            case presencePenalty = "presence_penalty"
            case reasoningEffort = "reasoning_effort"
            case verbosity
            case temperature
            case topP = "top_p"
            case variables
        }
    }
}