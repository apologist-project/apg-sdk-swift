import Foundation

public final class AgentClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Pauses the agent globally and fans out pause transition messages to open conversations. Requires an API key.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.agent.pauseAgent()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pauseAgent(requestOptions: RequestOptions? = nil) async throws -> PauseAgentResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/pause",
            requestOptions: requestOptions,
            responseType: PauseAgentResponse.self
        )
    }

    /// Resumes the agent globally and fans out resume transition messages to open conversations. Requires an API key.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.agent.resumeAgent()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func resumeAgent(requestOptions: RequestOptions? = nil) async throws -> ResumeAgentResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/resume",
            requestOptions: requestOptions,
            responseType: ResumeAgentResponse.self
        )
    }
}