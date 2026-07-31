import Foundation
import Testing
import Apologist

@Suite("BenchmarksClient Wire Tests") struct BenchmarksClientWireTests {
    @Test func listBenchmarkRuns1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "key": "value"
                    }
                  ],
                  "total": 1,
                  "page": 1,
                  "per_page": 1
                }
                """#.utf8
            )
        )
        let client = ApologistAgentClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ListBenchmarkRunsResponse(
            data: Optional([
                [
                    "key": JSONValue.string("value")
                ]
            ]),
            total: Optional(1),
            page: Optional(1),
            perPage: Optional(1)
        )
        let response = try await client.benchmarks.listBenchmarkRuns(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func runBenchmark1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "key": "value"
                }
                """#.utf8
            )
        )
        let client = ApologistAgentClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = [
            "key": JSONValue.string("value")
        ]
        let response = try await client.benchmarks.runBenchmark(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func getBenchmarkRun1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "key": "value"
                  }
                }
                """#.utf8
            )
        )
        let client = ApologistAgentClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = GetBenchmarkRunResponse(
            data: Optional([
                "key": JSONValue.string("value")
            ])
        )
        let response = try await client.benchmarks.getBenchmarkRun(
            id: "id",
            runId: "runId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}