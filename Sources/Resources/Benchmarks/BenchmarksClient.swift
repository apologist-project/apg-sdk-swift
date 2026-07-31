import Foundation

public final class BenchmarksClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of runs for a benchmark, scoped to the requesting agent. Each run carries nested evaluators, questions, and a flat evaluations array.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.benchmarks.listBenchmarkRuns(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The id or key of the benchmark
    /// - Parameter perPage: Results per page (clamped to 100).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func listBenchmarkRuns(id: String, page: Int? = nil, perPage: Int? = nil, minTimestamp: String? = nil, maxTimestamp: String? = nil, minDuration: String? = nil, maxDuration: String? = nil, minScore: String? = nil, maxScore: String? = nil, passed: String? = nil, minResponses: String? = nil, maxResponses: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListBenchmarkRunsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/benchmarks/\(id)/runs",
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
                "min_responses": minResponses.map { .string($0) }, 
                "max_responses": maxResponses.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListBenchmarkRunsResponse.self
        )
    }

    /// Executes a benchmark run and returns the aggregated result with nested evaluators, questions, and a flat evaluations array.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.benchmarks.runBenchmark(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The id or key of the benchmark
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func runBenchmark(id: String, request: Requests.BenchmarkRunRequest, requestOptions: RequestOptions? = nil) async throws -> [String: JSONValue] {
        return try await httpClient.performRequest(
            method: .post,
            path: "/benchmarks/\(id)/runs",
            body: request,
            requestOptions: requestOptions,
            responseType: [String: JSONValue].self
        )
    }

    /// Returns a single benchmark run by id or UUID, scoped to the requesting agent, including nested evaluators, questions, and evaluations.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.benchmarks.getBenchmarkRun(
    ///         id: "id",
    ///         runId: "runId"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The id or key of the benchmark
    /// - Parameter runId: The id or UUID of the run
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getBenchmarkRun(id: String, runId: String, requestOptions: RequestOptions? = nil) async throws -> GetBenchmarkRunResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/benchmarks/\(id)/runs/\(runId)",
            requestOptions: requestOptions,
            responseType: GetBenchmarkRunResponse.self
        )
    }
}