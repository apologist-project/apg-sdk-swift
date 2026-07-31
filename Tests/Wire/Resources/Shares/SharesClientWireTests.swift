import Foundation
import Testing
import Api

@Suite("SharesClient Wire Tests") struct SharesClientWireTests {
    @Test func getSharedMessages1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "messages": [
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
        let expectedResponse = GetSharedMessagesResponse(
            messages: Optional([
                [
                    "key": JSONValue.string("value")
                ]
            ])
        )
        let response = try await client.shares.getSharedMessages(
            token: "token",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func getSharedMessages2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "messages": [
                    {
                      "messages": {
                        "key": "value"
                      }
                    },
                    {
                      "messages": {
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
        let expectedResponse = GetSharedMessagesResponse(
            messages: Optional([
                [
                    "messages": JSONValue.object(
                        [
                            "key": JSONValue.string("value")
                        ]
                    )
                ],
                [
                    "messages": JSONValue.object(
                        [
                            "key": JSONValue.string("value")
                        ]
                    )
                ]
            ])
        )
        let response = try await client.shares.getSharedMessages(
            token: "token",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}