import Foundation

public final class SharesClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Public, unauthenticated read of the messages behind a share token. The token is the bearer capability and enforces tenant isolation against the host agent. An empty or invalid token yields an empty messages array.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.shares.getSharedMessages(token: "token")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter token: The share token
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getSharedMessages(token: String, requestOptions: RequestOptions? = nil) async throws -> GetSharedMessagesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/shares/\(token)",
            requestOptions: requestOptions,
            responseType: GetSharedMessagesResponse.self
        )
    }
}