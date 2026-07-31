import Foundation
import Testing
import Api

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
        let client = ApiClient(
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

    @Test func listBenchmarkRuns2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "data": {
                        "key": "value"
                      }
                    },
                    {
                      "data": {
                        "key": "value"
                      }
                    }
                  ],
                  "total": 1,
                  "page": 1,
                  "per_page": 1
                }
                """#.utf8
            )
        )
        let client = ApiClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ListBenchmarkRunsResponse(
            data: Optional([
                [
                    "data": JSONValue.object(
                        [
                            "key": JSONValue.string("value")
                        ]
                    )
                ],
                [
                    "data": JSONValue.object(
                        [
                            "key": JSONValue.string("value")
                        ]
                    )
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
        let client = ApiClient(
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

    @Test func runBenchmark2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "string": {
                    "key": "value"
                  }
                }
                """#.utf8
            )
        )
        let client = ApiClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = [
            "string": JSONValue.object(
                [
                    "key": JSONValue.string("value")
                ]
            )
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
        let client = ApiClient(
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

    @Test func getBenchmarkRun2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "data": {
                      "key": "value"
                    }
                  }
                }
                """#.utf8
            )
        )
        let client = ApiClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = GetBenchmarkRunResponse(
            data: Optional([
                "data": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
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