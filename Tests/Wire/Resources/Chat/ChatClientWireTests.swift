import Foundation
import Testing
import Apologist

@Suite("ChatClient Wire Tests") struct ChatClientWireTests {
    @Test func listChatCompletions1() async throws -> Void {
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
        let expectedResponse = ListChatCompletionsResponse(
            data: Optional([
                [
                    "key": JSONValue.string("value")
                ]
            ]),
            total: Optional(1),
            page: Optional(1),
            perPage: Optional(1)
        )
        let response = try await client.chat.listChatCompletions(
            traceparent: "00-4bf92f3577b34da6a3ce929d0e0e4736-00f067aa0ba902b7-01",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func createChatCompletion1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "id": "id",
                  "object": "chat.completion",
                  "created": 1,
                  "model": "model",
                  "choices": [
                    {
                      "index": 1,
                      "logprobs": {
                        "key": "value"
                      },
                      "finish_reason": "finish_reason"
                    }
                  ],
                  "usage": {
                    "prompt_tokens": 1,
                    "completion_tokens": 1,
                    "total_tokens": 1
                  },
                  "cached": true
                }
                """#.utf8
            )
        )
        let client = ApologistAgentClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = ChatCompletionResponse(
            id: Optional("id"),
            object: Optional("chat.completion"),
            created: Optional(1),
            model: Optional("model"),
            choices: Optional([
                ChatCompletionResponseChoicesItem(
                    index: Optional(1),
                    logprobs: Optional(Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ])),
                    finishReason: Optional("finish_reason")
                )
            ]),
            usage: Optional(ChatCompletionResponseUsage(
                promptTokens: Optional(1),
                completionTokens: Optional(1),
                totalTokens: Optional(1)
            )),
            cached: Optional(true)
        )
        let response = try await client.chat.createChatCompletion(
            traceparent: "00-4bf92f3577b34da6a3ce929d0e0e4736-00f067aa0ba902b7-01",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func likeCompletion1() async throws -> Void {
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
        let response = try await client.chat.likeCompletion(
            id: "id",
            request: .init(liked: true),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func flagCompletion1() async throws -> Void {
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
        let response = try await client.chat.flagCompletion(
            id: "id",
            request: .init(flagged: true),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func feedbackCompletion1() async throws -> Void {
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
        let response = try await client.chat.feedbackCompletion(
            id: "id",
            request: .init(feedback: "feedback"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func shareCompletion1() async throws -> Void {
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
        let response = try await client.chat.shareCompletion(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func scrubCompletion1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "id": "id",
                    "mode": "scrub",
                    "messages_redacted": 1,
                    "remaining": 1
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
        let expectedResponse = ScrubCompletionResponse(
            data: Optional(CompletionRedactResponse(
                id: Optional("id"),
                mode: Optional(CompletionRedactResponseMode.scrub),
                messagesRedacted: Optional(1),
                remaining: Optional(1)
            ))
        )
        let response = try await client.chat.scrubCompletion(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func anonymizeCompletion1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "id": "id",
                    "mode": "scrub",
                    "messages_redacted": 1,
                    "remaining": 1
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
        let expectedResponse = AnonymizeCompletionResponse(
            data: Optional(CompletionRedactResponse(
                id: Optional("id"),
                mode: Optional(CompletionRedactResponseMode.scrub),
                messagesRedacted: Optional(1),
                remaining: Optional(1)
            ))
        )
        let response = try await client.chat.anonymizeCompletion(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func getChatCompletion1() async throws -> Void {
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
        let expectedResponse = GetChatCompletionResponse(
            data: Optional([
                "key": JSONValue.string("value")
            ])
        )
        let response = try await client.chat.getChatCompletion(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}