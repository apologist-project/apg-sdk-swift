import Foundation

public final class ChatClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of chat completions (prompts) for the agent, with applied tags expanded as { id, name } and share metadata.
    ///
    /// ```swift
    /// import Foundation
    /// import Api
    ///
    /// private func main() async throws {
    ///     let client = ApiClient(apiKey: "<value>")
    ///
    ///     _ = try await client.chat.listChatCompletions()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter perPage: Results per page (clamped to 100).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func listChatCompletions(page: Int? = nil, perPage: Int? = nil, agentId: String? = nil, channelId: String? = nil, bibleId: String? = nil, cached: String? = nil, client: String? = nil, configId: String? = nil, conversationId: String? = nil, deviceId: String? = nil, flagged: String? = nil, favorited: String? = nil, language: String? = nil, liked: String? = nil, sessionId: String? = nil, userId: String? = nil, minTimestamp: String? = nil, maxTimestamp: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListChatCompletionsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/chat/completions",
            queryParams: [
                "page": page.map { .int($0) }, 
                "per_page": perPage.map { .int($0) }, 
                "agent_id": agentId.map { .string($0) }, 
                "channel_id": channelId.map { .string($0) }, 
                "bible_id": bibleId.map { .string($0) }, 
                "cached": cached.map { .string($0) }, 
                "client": client.map { .string($0) }, 
                "config_id": configId.map { .string($0) }, 
                "conversation_id": conversationId.map { .string($0) }, 
                "device_id": deviceId.map { .string($0) }, 
                "flagged": flagged.map { .string($0) }, 
                "favorited": favorited.map { .string($0) }, 
                "language": language.map { .string($0) }, 
                "liked": liked.map { .string($0) }, 
                "session_id": sessionId.map { .string($0) }, 
                "user_id": userId.map { .string($0) }, 
                "min_timestamp": minTimestamp.map { .string($0) }, 
                "max_timestamp": maxTimestamp.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListChatCompletionsResponse.self
        )
    }

    /// Creates a chat completion using the agent's configured model. Supports both streaming and non-streaming responses.
    ///
    /// ```swift
    /// import Foundation
    /// import Api
    ///
    /// private func main() async throws {
    ///     let client = ApiClient(apiKey: "<value>")
    ///
    ///     _ = try await client.chat.createChatCompletion(request: ChatCompletionRequest.jsonValue(
    ///         .object([
    ///             "key": .string("value")
    ///         ])
    ///     ))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func createChatCompletion(request: ChatCompletionRequest, requestOptions: RequestOptions? = nil) async throws -> ChatCompletionResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/chat/completions",
            body: request,
            requestOptions: requestOptions,
            responseType: ChatCompletionResponse.self
        )
    }

    /// Updates the like status of a specific chat completion
    ///
    /// ```swift
    /// import Foundation
    /// import Api
    ///
    /// private func main() async throws {
    ///     let client = ApiClient(apiKey: "<value>")
    ///
    ///     _ = try await client.chat.likeCompletion(
    ///         id: "id",
    ///         request: .init(liked: true)
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ID of the chat completion
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func likeCompletion(id: String, request: Requests.LikeRequest, requestOptions: RequestOptions? = nil) async throws -> SuccessResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/chat/completions/\(id)/like",
            body: request,
            requestOptions: requestOptions,
            responseType: SuccessResponse.self
        )
    }

    /// Updates the flagged status of a specific chat completion
    ///
    /// ```swift
    /// import Foundation
    /// import Api
    ///
    /// private func main() async throws {
    ///     let client = ApiClient(apiKey: "<value>")
    ///
    ///     _ = try await client.chat.flagCompletion(
    ///         id: "id",
    ///         request: .init(flagged: true)
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ID of the chat completion
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func flagCompletion(id: String, request: Requests.FlagRequest, requestOptions: RequestOptions? = nil) async throws -> SuccessResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/chat/completions/\(id)/flag",
            body: request,
            requestOptions: requestOptions,
            responseType: SuccessResponse.self
        )
    }

    /// Adds user feedback to a specific chat completion
    ///
    /// ```swift
    /// import Foundation
    /// import Api
    ///
    /// private func main() async throws {
    ///     let client = ApiClient(apiKey: "<value>")
    ///
    ///     _ = try await client.chat.feedbackCompletion(
    ///         id: "id",
    ///         request: .init(feedback: "feedback")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ID of the chat completion
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func feedbackCompletion(id: String, request: Requests.FeedbackRequest, requestOptions: RequestOptions? = nil) async throws -> SuccessResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/chat/completions/\(id)/feedback",
            body: request,
            requestOptions: requestOptions,
            responseType: SuccessResponse.self
        )
    }

    /// Creates a share record for a specific chat completion
    ///
    /// ```swift
    /// import Foundation
    /// import Api
    ///
    /// private func main() async throws {
    ///     let client = ApiClient(apiKey: "<value>")
    ///
    ///     _ = try await client.chat.shareCompletion(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ID of the chat completion
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func shareCompletion(id: String, request: Requests.ShareRequest, requestOptions: RequestOptions? = nil) async throws -> SuccessResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/chat/completions/\(id)/share",
            body: request,
            requestOptions: requestOptions,
            responseType: SuccessResponse.self
        )
    }

    /// Returns a single chat completion (prompt) by numeric id or UUID, including applied tags, guardrail/cta metadata, share metadata, and automation results.
    ///
    /// ```swift
    /// import Foundation
    /// import Api
    ///
    /// private func main() async throws {
    ///     let client = ApiClient(apiKey: "<value>")
    ///
    ///     _ = try await client.chat.getChatCompletion(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The numeric id or UUID of the chat completion
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getChatCompletion(id: String, requestOptions: RequestOptions? = nil) async throws -> GetChatCompletionResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/chat/completions/\(id)",
            requestOptions: requestOptions,
            responseType: GetChatCompletionResponse.self
        )
    }
}