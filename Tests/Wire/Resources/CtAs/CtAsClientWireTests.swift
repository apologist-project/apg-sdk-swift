import Foundation
import Testing
import Apologist

@Suite("CtAsClient Wire Tests") struct CtAsClientWireTests {
    @Test func matchCtas1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "ctas": [
                    {
                      "ctas": {
                        "key": "value"
                      }
                    },
                    {
                      "ctas": {
                        "key": "value"
                      }
                    }
                  ]
                }
                """#.utf8
            )
        )
        let client = ApologistAgentClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = MatchCtasResponse(
            ctas: Optional([
                [
                    "ctas": JSONValue.object(
                        [
                            "key": JSONValue.string("value")
                        ]
                    )
                ],
                [
                    "ctas": JSONValue.object(
                        [
                            "key": JSONValue.string("value")
                        ]
                    )
                ]
            ])
        )
        let response = try await client.ctAs.matchCtas(
            request: CtaMatchRequest.jsonValue(
                .object([
                    "key": .string("value")
                ])
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func logCtaClick1() async throws -> Void {
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
        let client = ApologistAgentClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SuccessResponse(
            success: true,
            message: "message"
        )
        let response = try await client.ctAs.logCtaClick(
            id: "id",
            request: .init(promptId: "prompt_id"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func logCtaClick2() async throws -> Void {
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
        let client = ApologistAgentClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = SuccessResponse(
            success: true,
            message: "message"
        )
        let response = try await client.ctAs.logCtaClick(
            id: "id",
            request: .init(promptId: "prompt_id"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}