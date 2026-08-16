import Foundation
import Testing
import Apologist

@Suite("ConversationsClient Wire Tests") struct ConversationsClientWireTests {
    @Test func listConversations1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "id": "id",
                      "external_id": "external_id",
                      "agent_id": 1,
                      "team_id": 1,
                      "tags": {
                        "key": "value"
                      },
                      "started_at": "started_at",
                      "ended_at": "ended_at",
                      "agent_paused": true,
                      "agent_paused_at": "agent_paused_at",
                      "agent_resumed_at": "agent_resumed_at"
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
        let expectedResponse = ListConversationsResponse(
            data: Optional([
                Conversation(
                    id: Optional("id"),
                    externalId: Optional(Nullable<String>.value("external_id")),
                    agentId: Optional(1),
                    teamId: Optional(1),
                    tags: Optional(Nullable<[String: JSONValue]>.value([
                        "key": JSONValue.string("value")
                    ])),
                    startedAt: Optional("started_at"),
                    endedAt: Optional(Nullable<String>.value("ended_at")),
                    agentPaused: Optional(true),
                    agentPausedAt: Optional(Nullable<String>.value("agent_paused_at")),
                    agentResumedAt: Optional(Nullable<String>.value("agent_resumed_at"))
                )
            ]),
            total: Optional(1),
            page: Optional(1),
            perPage: Optional(1)
        )
        let response = try await client.conversations.listConversations(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func getConversation1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "id": "id",
                    "external_id": "external_id",
                    "agent_id": 1,
                    "team_id": 1,
                    "tags": {
                      "key": "value"
                    },
                    "started_at": "started_at",
                    "ended_at": "ended_at",
                    "agent_paused": true,
                    "agent_paused_at": "agent_paused_at",
                    "agent_resumed_at": "agent_resumed_at"
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
        let expectedResponse = GetConversationResponse(
            data: Optional(Conversation(
                id: Optional("id"),
                externalId: Optional(Nullable<String>.value("external_id")),
                agentId: Optional(1),
                teamId: Optional(1),
                tags: Optional(Nullable<[String: JSONValue]>.value([
                    "key": JSONValue.string("value")
                ])),
                startedAt: Optional("started_at"),
                endedAt: Optional(Nullable<String>.value("ended_at")),
                agentPaused: Optional(true),
                agentPausedAt: Optional(Nullable<String>.value("agent_paused_at")),
                agentResumedAt: Optional(Nullable<String>.value("agent_resumed_at"))
            ))
        )
        let response = try await client.conversations.getConversation(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func pauseConversation1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "id": "id",
                    "external_id": "external_id",
                    "agent_id": 1,
                    "team_id": 1,
                    "tags": {
                      "key": "value"
                    },
                    "started_at": "started_at",
                    "ended_at": "ended_at",
                    "agent_paused": true,
                    "agent_paused_at": "agent_paused_at",
                    "agent_resumed_at": "agent_resumed_at"
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
        let expectedResponse = PauseConversationResponse(
            data: Optional(Conversation(
                id: Optional("id"),
                externalId: Optional(Nullable<String>.value("external_id")),
                agentId: Optional(1),
                teamId: Optional(1),
                tags: Optional(Nullable<[String: JSONValue]>.value([
                    "key": JSONValue.string("value")
                ])),
                startedAt: Optional("started_at"),
                endedAt: Optional(Nullable<String>.value("ended_at")),
                agentPaused: Optional(true),
                agentPausedAt: Optional(Nullable<String>.value("agent_paused_at")),
                agentResumedAt: Optional(Nullable<String>.value("agent_resumed_at"))
            ))
        )
        let response = try await client.conversations.pauseConversation(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func resumeConversation1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "id": "id",
                    "external_id": "external_id",
                    "agent_id": 1,
                    "team_id": 1,
                    "tags": {
                      "key": "value"
                    },
                    "started_at": "started_at",
                    "ended_at": "ended_at",
                    "agent_paused": true,
                    "agent_paused_at": "agent_paused_at",
                    "agent_resumed_at": "agent_resumed_at"
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
        let expectedResponse = ResumeConversationResponse(
            data: Optional(Conversation(
                id: Optional("id"),
                externalId: Optional(Nullable<String>.value("external_id")),
                agentId: Optional(1),
                teamId: Optional(1),
                tags: Optional(Nullable<[String: JSONValue]>.value([
                    "key": JSONValue.string("value")
                ])),
                startedAt: Optional("started_at"),
                endedAt: Optional(Nullable<String>.value("ended_at")),
                agentPaused: Optional(true),
                agentPausedAt: Optional(Nullable<String>.value("agent_paused_at")),
                agentResumedAt: Optional(Nullable<String>.value("agent_resumed_at"))
            ))
        )
        let response = try await client.conversations.resumeConversation(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}