import Foundation
import Testing
import Api

@Suite("EvaluatorsClient Wire Tests") struct EvaluatorsClientWireTests {
    @Test func listEvaluations1() async throws -> Void {
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
        let expectedResponse = ListEvaluationsResponse(
            data: Optional([
                [
                    "key": JSONValue.string("value")
                ]
            ]),
            total: Optional(1),
            page: Optional(1),
            perPage: Optional(1)
        )
        let response = try await client.evaluators.listEvaluations(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func listEvaluations2() async throws -> Void {
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
        let expectedResponse = ListEvaluationsResponse(
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
        let response = try await client.evaluators.listEvaluations(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func evaluateContent1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "result": {
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
        let expectedResponse = EvaluateContentResponse(
            result: Optional([
                "key": JSONValue.string("value")
            ])
        )
        let response = try await client.evaluators.evaluateContent(
            id: "id",
            request: .init(content: EvaluatorRequestContent.string(
                "content"
            )),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func evaluateContent2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "result": {
                    "result": {
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
        let expectedResponse = EvaluateContentResponse(
            result: Optional([
                "result": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ])
        )
        let response = try await client.evaluators.evaluateContent(
            id: "id",
            request: .init(content: EvaluatorRequestContent.string(
                "content"
            )),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func getEvaluation1() async throws -> Void {
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
        let expectedResponse = GetEvaluationResponse(
            data: Optional([
                "key": JSONValue.string("value")
            ])
        )
        let response = try await client.evaluators.getEvaluation(
            id: "id",
            evaluationId: "evaluationId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func getEvaluation2() async throws -> Void {
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
        let expectedResponse = GetEvaluationResponse(
            data: Optional([
                "data": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ])
        )
        let response = try await client.evaluators.getEvaluation(
            id: "id",
            evaluationId: "evaluationId",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}