import Foundation
import Testing
import Apologist

@Suite("AgentClient Wire Tests") struct AgentClientWireTests {
    @Test func pauseAgent1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "is_paused": true,
                    "paused_at": "paused_at",
                    "resumed_at": "resumed_at",
                    "emitted": 1,
                    "skipped": 1
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
        let expectedResponse = PauseAgentResponse(
            data: Optional(AgentPauseState(
                isPaused: Optional(true),
                pausedAt: Optional(Nullable<String>.value("paused_at")),
                resumedAt: Optional(Nullable<String>.value("resumed_at")),
                emitted: Optional(1),
                skipped: Optional(1)
            ))
        )
        let response = try await client.agent.pauseAgent(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func resumeAgent1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "is_paused": true,
                    "paused_at": "paused_at",
                    "resumed_at": "resumed_at",
                    "emitted": 1,
                    "skipped": 1
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
        let expectedResponse = ResumeAgentResponse(
            data: Optional(AgentPauseState(
                isPaused: Optional(true),
                pausedAt: Optional(Nullable<String>.value("paused_at")),
                resumedAt: Optional(Nullable<String>.value("resumed_at")),
                emitted: Optional(1),
                skipped: Optional(1)
            ))
        )
        let response = try await client.agent.resumeAgent(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }
}