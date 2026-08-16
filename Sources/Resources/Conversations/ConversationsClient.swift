import Foundation

public final class ConversationsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of conversations for the requesting agent, newest first.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.conversations.listConversations()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter perPage: Results per page (clamped to 100).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func listConversations(page: Int? = nil, perPage: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ListConversationsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/conversations",
            queryParams: [
                "page": page.map { .int($0) }, 
                "per_page": perPage.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListConversationsResponse.self
        )
    }

    /// Returns a single conversation by internal UUID or team-scoped external id.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.conversations.getConversation(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The conversation UUID or team-scoped external id
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getConversation(id: String, requestOptions: RequestOptions? = nil) async throws -> GetConversationResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/conversations/\(id)",
            requestOptions: requestOptions,
            responseType: GetConversationResponse.self
        )
    }

    /// Pauses the agent on a conversation identified by internal UUID or team-scoped external id. Requires an API key.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.conversations.pauseConversation(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The conversation UUID or team-scoped external id
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pauseConversation(id: String, requestOptions: RequestOptions? = nil) async throws -> PauseConversationResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/conversations/\(id)/pause",
            requestOptions: requestOptions,
            responseType: PauseConversationResponse.self
        )
    }

    /// Resumes the agent on a conversation identified by internal UUID or team-scoped external id. Requires an API key.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.conversations.resumeConversation(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The conversation UUID or team-scoped external id
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func resumeConversation(id: String, requestOptions: RequestOptions? = nil) async throws -> ResumeConversationResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/conversations/\(id)/resume",
            requestOptions: requestOptions,
            responseType: ResumeConversationResponse.self
        )
    }
}