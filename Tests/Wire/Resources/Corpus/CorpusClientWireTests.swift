import Foundation
import Testing
import Api

@Suite("CorpusClient Wire Tests") struct CorpusClientWireTests {
    @Test func searchCorpus1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "results": [
                    {
                      "key": "value"
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = ApiClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SearchCorpusResponse(
            results: Optional([
                [
                    "key": JSONValue.string("value")
                ]
            ])
        )
        let response = try await client.corpus.searchCorpus(
            request: .init(query: "query"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func searchCorpus2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "results": [
                    {
                      "results": {
                        "key": "value"
                      }
                    },
                    {
                      "results": {
                        "key": "value"
                      }
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = ApiClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SearchCorpusResponse(
            results: Optional([
                [
                    "results": JSONValue.object(
                        [
                            "key": JSONValue.string("value")
                        ]
                    )
                ],
                [
                    "results": JSONValue.object(
                        [
                            "key": JSONValue.string("value")
                        ]
                    )
                ]
            ])
        )
        let response = try await client.corpus.searchCorpus(
            request: .init(query: "query"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func logCorpusView1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "success": true,
                  "message": "message"
                }
                """#.utf8
            )
        )
        let client = ApiClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SuccessResponse(
            success: true,
            message: "message"
        )
        let response = try await client.corpus.logCorpusView(
            model: "model",
            id: "id",
            request: .init(promptId: "prompt_id"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func logCorpusView2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "success": true,
                  "message": "message"
                }
                """#.utf8
            )
        )
        let client = ApiClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SuccessResponse(
            success: true,
            message: "message"
        )
        let response = try await client.corpus.logCorpusView(
            model: "model",
            id: "id",
            request: .init(promptId: "prompt_id"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func logCorpusImpression1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "success": true,
                  "message": "message"
                }
                """#.utf8
            )
        )
        let client = ApiClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SuccessResponse(
            success: true,
            message: "message"
        )
        let response = try await client.corpus.logCorpusImpression(
            model: "model",
            id: "id",
            request: .init(promptId: "prompt_id"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func logCorpusImpression2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "success": true,
                  "message": "message"
                }
                """#.utf8
            )
        )
        let client = ApiClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SuccessResponse(
            success: true,
            message: "message"
        )
        let response = try await client.corpus.logCorpusImpression(
            model: "model",
            id: "id",
            request: .init(promptId: "prompt_id"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func logCorpusReferralRedirect1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "success": true,
                  "message": "message"
                }
                """#.utf8
            )
        )
        let client = ApiClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SuccessResponse(
            success: true,
            message: "message"
        )
        let response = try await client.corpus.logCorpusReferralRedirect(
            model: "model",
            id: "id",
            promptId: "prompt_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func logCorpusReferralRedirect2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "success": true,
                  "message": "message"
                }
                """#.utf8
            )
        )
        let client = ApiClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SuccessResponse(
            success: true,
            message: "message"
        )
        let response = try await client.corpus.logCorpusReferralRedirect(
            model: "model",
            id: "id",
            promptId: "prompt_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func logCorpusReferral1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "success": true,
                  "message": "message"
                }
                """#.utf8
            )
        )
        let client = ApiClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SuccessResponse(
            success: true,
            message: "message"
        )
        let response = try await client.corpus.logCorpusReferral(
            model: "model",
            id: "id",
            request: .init(promptId: "prompt_id"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func logCorpusReferral2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "success": true,
                  "message": "message"
                }
                """#.utf8
            )
        )
        let client = ApiClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SuccessResponse(
            success: true,
            message: "message"
        )
        let response = try await client.corpus.logCorpusReferral(
            model: "model",
            id: "id",
            request: .init(promptId: "prompt_id"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}