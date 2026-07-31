import Foundation

public final class CorpusClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Performs a semantic search across the agent's corpus of knowledge
    ///
    /// ```swift
    /// import Foundation
    /// import Api
    ///
    /// private func main() async throws {
    ///     let client = ApiClient(apiKey: "<value>")
    ///
    ///     _ = try await client.corpus.searchCorpus(request: .init(query: "query"))
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func searchCorpus(request: Requests.CorpusSearchRequest, requestOptions: RequestOptions? = nil) async throws -> SearchCorpusResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/corpus/search",
            body: request,
            requestOptions: requestOptions,
            responseType: SearchCorpusResponse.self
        )
    }

    /// Records that a user viewed a specific corpus item
    ///
    /// ```swift
    /// import Foundation
    /// import Api
    ///
    /// private func main() async throws {
    ///     let client = ApiClient(apiKey: "<value>")
    ///
    ///     _ = try await client.corpus.logCorpusView(
    ///         model: "model",
    ///         id: "id",
    ///         request: .init(promptId: "prompt_id")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter model: The model type (e.g., 'source')
    /// - Parameter id: The ID of the corpus item
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func logCorpusView(model: String, id: String, request: Requests.ViewRequest, requestOptions: RequestOptions? = nil) async throws -> SuccessResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/corpus/\(model)/\(id)/view",
            body: request,
            requestOptions: requestOptions,
            responseType: SuccessResponse.self
        )
    }

    /// Records that a corpus item was shown to a user
    ///
    /// ```swift
    /// import Foundation
    /// import Api
    ///
    /// private func main() async throws {
    ///     let client = ApiClient(apiKey: "<value>")
    ///
    ///     _ = try await client.corpus.logCorpusImpression(
    ///         model: "model",
    ///         id: "id",
    ///         request: .init(promptId: "prompt_id")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter model: The model type (e.g., 'source')
    /// - Parameter id: The ID of the corpus item
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func logCorpusImpression(model: String, id: String, request: Requests.ImpressionRequest, requestOptions: RequestOptions? = nil) async throws -> SuccessResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/corpus/\(model)/\(id)/impression",
            body: request,
            requestOptions: requestOptions,
            responseType: SuccessResponse.self
        )
    }

    /// Records a referral for a corpus item and, when a `url` is supplied, issues a 302 redirect to it. Without a `url`, responds with a success message. Requires either the search API entitlement or a same-origin request.
    ///
    /// ```swift
    /// import Foundation
    /// import Api
    ///
    /// private func main() async throws {
    ///     let client = ApiClient(apiKey: "<value>")
    ///
    ///     _ = try await client.corpus.logCorpusReferralRedirect(
    ///         model: "model",
    ///         id: "id",
    ///         promptId: "prompt_id"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter model: The model type (e.g., 'source')
    /// - Parameter id: The numeric ID of the corpus item
    /// - Parameter url: URL-encoded destination to redirect to after logging the referral.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func logCorpusReferralRedirect(model: String, id: String, promptId: String, userId: String? = nil, url: String? = nil, requestOptions: RequestOptions? = nil) async throws -> SuccessResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/corpus/\(model)/\(id)/referral",
            queryParams: [
                "prompt_id": .string(promptId), 
                "user_id": userId.map { .string($0) }, 
                "url": url.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: SuccessResponse.self
        )
    }

    /// Records that a user was referred to a corpus item
    ///
    /// ```swift
    /// import Foundation
    /// import Api
    ///
    /// private func main() async throws {
    ///     let client = ApiClient(apiKey: "<value>")
    ///
    ///     _ = try await client.corpus.logCorpusReferral(
    ///         model: "model",
    ///         id: "id",
    ///         request: .init(promptId: "prompt_id")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter model: The model type (e.g., 'source')
    /// - Parameter id: The ID of the corpus item
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func logCorpusReferral(model: String, id: String, request: Requests.ReferralRequest, requestOptions: RequestOptions? = nil) async throws -> SuccessResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/corpus/\(model)/\(id)/referral",
            body: request,
            requestOptions: requestOptions,
            responseType: SuccessResponse.self
        )
    }
}