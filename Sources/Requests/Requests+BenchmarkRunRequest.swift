import Foundation

extension Requests {
    public struct BenchmarkRunRequest: Codable, Hashable, Sendable {
        /// Content to evaluate. Required when `source_id` is supplied.
        public let content: BenchmarkRunRequestContent?
        /// Completion UUID whose stored response should be evaluated.
        public let completionId: Nullable<String>?
        public let sourceId: Nullable<Int>?
        public let model: Nullable<String>?
        public let numResponses: Nullable<Int>?
        public let useQuestionVariants: Nullable<Bool>?
        public let reasoningEffort: Nullable<BenchmarkRunRequestReasoningEffort>?
        public let verbosity: Nullable<BenchmarkRunRequestVerbosity>?
        public let scoreThreshold: Nullable<Double>?
        public let valueThreshold: Nullable<Double>?
        public let temperature: Nullable<Double>?
        public let topP: Nullable<Double>?
        public let frequencyPenalty: Nullable<Double>?
        public let presencePenalty: Nullable<Double>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            content: BenchmarkRunRequestContent? = nil,
            completionId: Nullable<String>? = nil,
            sourceId: Nullable<Int>? = nil,
            model: Nullable<String>? = nil,
            numResponses: Nullable<Int>? = nil,
            useQuestionVariants: Nullable<Bool>? = nil,
            reasoningEffort: Nullable<BenchmarkRunRequestReasoningEffort>? = nil,
            verbosity: Nullable<BenchmarkRunRequestVerbosity>? = nil,
            scoreThreshold: Nullable<Double>? = nil,
            valueThreshold: Nullable<Double>? = nil,
            temperature: Nullable<Double>? = nil,
            topP: Nullable<Double>? = nil,
            frequencyPenalty: Nullable<Double>? = nil,
            presencePenalty: Nullable<Double>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.content = content
            self.completionId = completionId
            self.sourceId = sourceId
            self.model = model
            self.numResponses = numResponses
            self.useQuestionVariants = useQuestionVariants
            self.reasoningEffort = reasoningEffort
            self.verbosity = verbosity
            self.scoreThreshold = scoreThreshold
            self.valueThreshold = valueThreshold
            self.temperature = temperature
            self.topP = topP
            self.frequencyPenalty = frequencyPenalty
            self.presencePenalty = presencePenalty
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.content = try container.decodeIfPresent(BenchmarkRunRequestContent.self, forKey: .content)
            self.completionId = try container.decodeNullableIfPresent(String.self, forKey: .completionId)
            self.sourceId = try container.decodeNullableIfPresent(Int.self, forKey: .sourceId)
            self.model = try container.decodeNullableIfPresent(String.self, forKey: .model)
            self.numResponses = try container.decodeNullableIfPresent(Int.self, forKey: .numResponses)
            self.useQuestionVariants = try container.decodeNullableIfPresent(Bool.self, forKey: .useQuestionVariants)
            self.reasoningEffort = try container.decodeNullableIfPresent(BenchmarkRunRequestReasoningEffort.self, forKey: .reasoningEffort)
            self.verbosity = try container.decodeNullableIfPresent(BenchmarkRunRequestVerbosity.self, forKey: .verbosity)
            self.scoreThreshold = try container.decodeNullableIfPresent(Double.self, forKey: .scoreThreshold)
            self.valueThreshold = try container.decodeNullableIfPresent(Double.self, forKey: .valueThreshold)
            self.temperature = try container.decodeNullableIfPresent(Double.self, forKey: .temperature)
            self.topP = try container.decodeNullableIfPresent(Double.self, forKey: .topP)
            self.frequencyPenalty = try container.decodeNullableIfPresent(Double.self, forKey: .frequencyPenalty)
            self.presencePenalty = try container.decodeNullableIfPresent(Double.self, forKey: .presencePenalty)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.content, forKey: .content)
            try container.encodeNullableIfPresent(self.completionId, forKey: .completionId)
            try container.encodeNullableIfPresent(self.sourceId, forKey: .sourceId)
            try container.encodeNullableIfPresent(self.model, forKey: .model)
            try container.encodeNullableIfPresent(self.numResponses, forKey: .numResponses)
            try container.encodeNullableIfPresent(self.useQuestionVariants, forKey: .useQuestionVariants)
            try container.encodeNullableIfPresent(self.reasoningEffort, forKey: .reasoningEffort)
            try container.encodeNullableIfPresent(self.verbosity, forKey: .verbosity)
            try container.encodeNullableIfPresent(self.scoreThreshold, forKey: .scoreThreshold)
            try container.encodeNullableIfPresent(self.valueThreshold, forKey: .valueThreshold)
            try container.encodeNullableIfPresent(self.temperature, forKey: .temperature)
            try container.encodeNullableIfPresent(self.topP, forKey: .topP)
            try container.encodeNullableIfPresent(self.frequencyPenalty, forKey: .frequencyPenalty)
            try container.encodeNullableIfPresent(self.presencePenalty, forKey: .presencePenalty)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case content
            case completionId = "completion_id"
            case sourceId = "source_id"
            case model
            case numResponses = "num_responses"
            case useQuestionVariants = "use_question_variants"
            case reasoningEffort = "reasoning_effort"
            case verbosity
            case scoreThreshold = "score_threshold"
            case valueThreshold = "value_threshold"
            case temperature
            case topP = "top_p"
            case frequencyPenalty = "frequency_penalty"
            case presencePenalty = "presence_penalty"
        }
    }
}