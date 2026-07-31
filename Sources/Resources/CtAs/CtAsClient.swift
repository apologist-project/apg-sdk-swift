import Foundation

public final class CtAsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Finds matching CTAs based on conversation context, user, session, device, or messages
    ///
    /// ```swift
    /// import Foundation
    /// import Api
    ///
    /// private func main() async throws {
    ///     let client = ApiClient(apiKey: "<value>")
    ///
    ///     _ = try await client.ctAs.matchCtas(request: CtaMatchRequest.jsonValue(
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
    public func matchCtas(request: CtaMatchRequest, requestOptions: RequestOptions? = nil) async throws -> MatchCtasResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/ctas/match",
            body: request,
            requestOptions: requestOptions,
            responseType: MatchCtasResponse.self
        )
    }

    /// Records that a user clicked on a specific CTA
    ///
    /// ```swift
    /// import Foundation
    /// import Api
    ///
    /// private func main() async throws {
    ///     let client = ApiClient(apiKey: "<value>")
    ///
    ///     _ = try await client.ctAs.logCtaClick(
    ///         id: "id",
    ///         request: .init(promptId: "prompt_id")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ID of the CTA
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func logCtaClick(id: String, request: Requests.CtaClickRequest, requestOptions: RequestOptions? = nil) async throws -> SuccessResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/ctas/\(id)/click",
            body: request,
            requestOptions: requestOptions,
            responseType: SuccessResponse.self
        )
    }
}