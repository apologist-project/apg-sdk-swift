import Foundation

extension Requests {
    public struct ChatCompletionRequest: Codable, Hashable, Sendable {
        public let audio: Nullable<[String: JSONValue]>?
        public let frequencyPenalty: Nullable<Double>?
        public let logitBias: Nullable<[String: JSONValue]>?
        public let logprobs: Nullable<ChatCompletionRequestLogprobs>?
        public let topLogprobs: Nullable<Int>?
        /// Output-token cap for this request. An API key may set this above the agent's Max Output Tokens. The value cannot exceed the model's maximum. Requests without an API key keep the agent's Max Output Tokens.
        public let maxCompletionTokens: Nullable<Int>?
        public let maxTokens: Nullable<Int>?
        /// Chat messages in OpenAI format. Required when `prompt` is omitted.
        public let messages: Nullable<[ChatMessage]>?
        public let metadata: Nullable<ChatCompletionRequestMetadata>?
        public let modalities: Nullable<[JSONValue]>?
        public let model: Nullable<String>?
        public let n: Nullable<Int>?
        public let parallelToolCalls: Nullable<Bool>?
        public let prediction: Nullable<[String: JSONValue]>?
        public let presencePenalty: Nullable<Double>?
        /// User text to complete. Required when `messages` is omitted.
        public let prompt: Nullable<String>?
        public let reasoningEffort: Nullable<ChatCompletionRequestReasoningEffort>?
        public let verbosity: Nullable<ChatCompletionRequestVerbosity>?
        public let responseFormat: Nullable<ChatCompletionRequestResponseFormat>?
        public let seed: Nullable<Int>?
        public let serviceTier: Nullable<String>?
        public let stop: Nullable<String>?
        public let store: Nullable<Bool>?
        public let stream: Bool?
        public let streamOptions: Nullable<[String: JSONValue]>?
        public let temperature: Nullable<Double>?
        public let topP: Nullable<Double>?
        /// OpenAI-compatible function tool definitions. Passed through to the model as declaration-only tools (the client executes them and returns role=tool messages).
        public let tools: Nullable<[JSONValue]>?
        public let toolChoice: Nullable<ChatCompletionRequestToolChoice>?
        public let user: Nullable<String>?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            audio: Nullable<[String: JSONValue]>? = nil,
            frequencyPenalty: Nullable<Double>? = nil,
            logitBias: Nullable<[String: JSONValue]>? = nil,
            logprobs: Nullable<ChatCompletionRequestLogprobs>? = nil,
            topLogprobs: Nullable<Int>? = nil,
            maxCompletionTokens: Nullable<Int>? = nil,
            maxTokens: Nullable<Int>? = nil,
            messages: Nullable<[ChatMessage]>? = nil,
            metadata: Nullable<ChatCompletionRequestMetadata>? = nil,
            modalities: Nullable<[JSONValue]>? = nil,
            model: Nullable<String>? = nil,
            n: Nullable<Int>? = nil,
            parallelToolCalls: Nullable<Bool>? = nil,
            prediction: Nullable<[String: JSONValue]>? = nil,
            presencePenalty: Nullable<Double>? = nil,
            prompt: Nullable<String>? = nil,
            reasoningEffort: Nullable<ChatCompletionRequestReasoningEffort>? = nil,
            verbosity: Nullable<ChatCompletionRequestVerbosity>? = nil,
            responseFormat: Nullable<ChatCompletionRequestResponseFormat>? = nil,
            seed: Nullable<Int>? = nil,
            serviceTier: Nullable<String>? = nil,
            stop: Nullable<String>? = nil,
            store: Nullable<Bool>? = nil,
            stream: Bool? = nil,
            streamOptions: Nullable<[String: JSONValue]>? = nil,
            temperature: Nullable<Double>? = nil,
            topP: Nullable<Double>? = nil,
            tools: Nullable<[JSONValue]>? = nil,
            toolChoice: Nullable<ChatCompletionRequestToolChoice>? = nil,
            user: Nullable<String>? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.audio = audio
            self.frequencyPenalty = frequencyPenalty
            self.logitBias = logitBias
            self.logprobs = logprobs
            self.topLogprobs = topLogprobs
            self.maxCompletionTokens = maxCompletionTokens
            self.maxTokens = maxTokens
            self.messages = messages
            self.metadata = metadata
            self.modalities = modalities
            self.model = model
            self.n = n
            self.parallelToolCalls = parallelToolCalls
            self.prediction = prediction
            self.presencePenalty = presencePenalty
            self.prompt = prompt
            self.reasoningEffort = reasoningEffort
            self.verbosity = verbosity
            self.responseFormat = responseFormat
            self.seed = seed
            self.serviceTier = serviceTier
            self.stop = stop
            self.store = store
            self.stream = stream
            self.streamOptions = streamOptions
            self.temperature = temperature
            self.topP = topP
            self.tools = tools
            self.toolChoice = toolChoice
            self.user = user
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.audio = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .audio)
            self.frequencyPenalty = try container.decodeNullableIfPresent(Double.self, forKey: .frequencyPenalty)
            self.logitBias = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .logitBias)
            self.logprobs = try container.decodeNullableIfPresent(ChatCompletionRequestLogprobs.self, forKey: .logprobs)
            self.topLogprobs = try container.decodeNullableIfPresent(Int.self, forKey: .topLogprobs)
            self.maxCompletionTokens = try container.decodeNullableIfPresent(Int.self, forKey: .maxCompletionTokens)
            self.maxTokens = try container.decodeNullableIfPresent(Int.self, forKey: .maxTokens)
            self.messages = try container.decodeNullableIfPresent([ChatMessage].self, forKey: .messages)
            self.metadata = try container.decodeNullableIfPresent(ChatCompletionRequestMetadata.self, forKey: .metadata)
            self.modalities = try container.decodeNullableIfPresent([JSONValue].self, forKey: .modalities)
            self.model = try container.decodeNullableIfPresent(String.self, forKey: .model)
            self.n = try container.decodeNullableIfPresent(Int.self, forKey: .n)
            self.parallelToolCalls = try container.decodeNullableIfPresent(Bool.self, forKey: .parallelToolCalls)
            self.prediction = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .prediction)
            self.presencePenalty = try container.decodeNullableIfPresent(Double.self, forKey: .presencePenalty)
            self.prompt = try container.decodeNullableIfPresent(String.self, forKey: .prompt)
            self.reasoningEffort = try container.decodeNullableIfPresent(ChatCompletionRequestReasoningEffort.self, forKey: .reasoningEffort)
            self.verbosity = try container.decodeNullableIfPresent(ChatCompletionRequestVerbosity.self, forKey: .verbosity)
            self.responseFormat = try container.decodeNullableIfPresent(ChatCompletionRequestResponseFormat.self, forKey: .responseFormat)
            self.seed = try container.decodeNullableIfPresent(Int.self, forKey: .seed)
            self.serviceTier = try container.decodeNullableIfPresent(String.self, forKey: .serviceTier)
            self.stop = try container.decodeNullableIfPresent(String.self, forKey: .stop)
            self.store = try container.decodeNullableIfPresent(Bool.self, forKey: .store)
            self.stream = try container.decodeIfPresent(Bool.self, forKey: .stream)
            self.streamOptions = try container.decodeNullableIfPresent([String: JSONValue].self, forKey: .streamOptions)
            self.temperature = try container.decodeNullableIfPresent(Double.self, forKey: .temperature)
            self.topP = try container.decodeNullableIfPresent(Double.self, forKey: .topP)
            self.tools = try container.decodeNullableIfPresent([JSONValue].self, forKey: .tools)
            self.toolChoice = try container.decodeNullableIfPresent(ChatCompletionRequestToolChoice.self, forKey: .toolChoice)
            self.user = try container.decodeNullableIfPresent(String.self, forKey: .user)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeNullableIfPresent(self.audio, forKey: .audio)
            try container.encodeNullableIfPresent(self.frequencyPenalty, forKey: .frequencyPenalty)
            try container.encodeNullableIfPresent(self.logitBias, forKey: .logitBias)
            try container.encodeNullableIfPresent(self.logprobs, forKey: .logprobs)
            try container.encodeNullableIfPresent(self.topLogprobs, forKey: .topLogprobs)
            try container.encodeNullableIfPresent(self.maxCompletionTokens, forKey: .maxCompletionTokens)
            try container.encodeNullableIfPresent(self.maxTokens, forKey: .maxTokens)
            try container.encodeNullableIfPresent(self.messages, forKey: .messages)
            try container.encodeNullableIfPresent(self.metadata, forKey: .metadata)
            try container.encodeNullableIfPresent(self.modalities, forKey: .modalities)
            try container.encodeNullableIfPresent(self.model, forKey: .model)
            try container.encodeNullableIfPresent(self.n, forKey: .n)
            try container.encodeNullableIfPresent(self.parallelToolCalls, forKey: .parallelToolCalls)
            try container.encodeNullableIfPresent(self.prediction, forKey: .prediction)
            try container.encodeNullableIfPresent(self.presencePenalty, forKey: .presencePenalty)
            try container.encodeNullableIfPresent(self.prompt, forKey: .prompt)
            try container.encodeNullableIfPresent(self.reasoningEffort, forKey: .reasoningEffort)
            try container.encodeNullableIfPresent(self.verbosity, forKey: .verbosity)
            try container.encodeNullableIfPresent(self.responseFormat, forKey: .responseFormat)
            try container.encodeNullableIfPresent(self.seed, forKey: .seed)
            try container.encodeNullableIfPresent(self.serviceTier, forKey: .serviceTier)
            try container.encodeNullableIfPresent(self.stop, forKey: .stop)
            try container.encodeNullableIfPresent(self.store, forKey: .store)
            try container.encodeIfPresent(self.stream, forKey: .stream)
            try container.encodeNullableIfPresent(self.streamOptions, forKey: .streamOptions)
            try container.encodeNullableIfPresent(self.temperature, forKey: .temperature)
            try container.encodeNullableIfPresent(self.topP, forKey: .topP)
            try container.encodeNullableIfPresent(self.tools, forKey: .tools)
            try container.encodeNullableIfPresent(self.toolChoice, forKey: .toolChoice)
            try container.encodeNullableIfPresent(self.user, forKey: .user)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case audio
            case frequencyPenalty = "frequency_penalty"
            case logitBias = "logit_bias"
            case logprobs
            case topLogprobs = "top_logprobs"
            case maxCompletionTokens = "max_completion_tokens"
            case maxTokens = "max_tokens"
            case messages
            case metadata
            case modalities
            case model
            case n
            case parallelToolCalls = "parallel_tool_calls"
            case prediction
            case presencePenalty = "presence_penalty"
            case prompt
            case reasoningEffort = "reasoning_effort"
            case verbosity
            case responseFormat = "response_format"
            case seed
            case serviceTier = "service_tier"
            case stop
            case store
            case stream
            case streamOptions = "stream_options"
            case temperature
            case topP = "top_p"
            case tools
            case toolChoice = "tool_choice"
            case user
        }
    }
}