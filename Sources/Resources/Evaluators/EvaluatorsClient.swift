import Foundation

public final class EvaluatorsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of evaluations for the evaluator, scoped to the requesting agent.
    ///
    /// ```swift
    /// import Foundation
    /// import Api
    ///
    /// private func main() async throws {
    ///     let client = ApiClient(apiKey: "<value>")
    ///
    ///     _ = try await client.evaluators.listEvaluations(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ID or key of the evaluator
    /// - Parameter perPage: Results per page (clamped to 100).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func listEvaluations(id: String, page: Int? = nil, perPage: Int? = nil, minTimestamp: String? = nil, maxTimestamp: String? = nil, minDuration: String? = nil, maxDuration: String? = nil, minScore: String? = nil, maxScore: String? = nil, passed: String? = nil, benchmark: String? = nil, benchmarkRunId: String? = nil, benchmarkQuestionId: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListEvaluationsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/evaluators/\(id)/evaluations",
            queryParams: [
                "page": page.map { .int($0) }, 
                "per_page": perPage.map { .int($0) }, 
                "min_timestamp": minTimestamp.map { .string($0) }, 
                "max_timestamp": maxTimestamp.map { .string($0) }, 
                "min_duration": minDuration.map { .string($0) }, 
                "max_duration": maxDuration.map { .string($0) }, 
                "min_score": minScore.map { .string($0) }, 
                "max_score": maxScore.map { .string($0) }, 
                "passed": passed.map { .string($0) }, 
                "benchmark": benchmark.map { .string($0) }, 
                "benchmark_run_id": benchmarkRunId.map { .string($0) }, 
                "benchmark_question_id": benchmarkQuestionId.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListEvaluationsResponse.self
        )
    }

    /// Runs an evaluation on the provided content using the specified evaluator
    ///
    /// ```swift
    /// import Foundation
    /// import Api
    ///
    /// private func main() async throws {
    ///     let client = ApiClient(apiKey: "<value>")
    ///
    ///     _ = try await client.evaluators.evaluateContent(
    ///         id: "id",
    ///         request: .init(content: EvaluatorRequestContent.string(
    ///             "content"
    ///         ))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The ID or key of the evaluator
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func evaluateContent(id: String, request: Requests.EvaluatorRequest, requestOptions: RequestOptions? = nil) async throws -> EvaluateContentResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/evaluators/\(id)/evaluations",
            body: request,
            requestOptions: requestOptions,
            responseType: EvaluateContentResponse.self
        )
    }

    /// Returns a single evaluation for the evaluator, scoped to the requesting agent.
    ///
    /// ```swift
    /// import Foundation
    /// import Api
    ///
    /// private func main() async throws {
    ///     let client = ApiClient(apiKey: "<value>")
    ///
    ///     _ = try await client.evaluators.getEvaluation(
    ///         id: "id",
    ///         evaluationId: "evaluationId"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The id or key of the evaluator
    /// - Parameter evaluationId: The id or UUID of the evaluation
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getEvaluation(id: String, evaluationId: String, requestOptions: RequestOptions? = nil) async throws -> GetEvaluationResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/evaluators/\(id)/evaluations/\(evaluationId)",
            requestOptions: requestOptions,
            responseType: GetEvaluationResponse.self
        )
    }
}