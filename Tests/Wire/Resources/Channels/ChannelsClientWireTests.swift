import Foundation
import Testing
import Apologist

@Suite("ChannelsClient Wire Tests") struct ChannelsClientWireTests {
    @Test func getDiscordChannelStatus1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "status": "status",
                  "channel": "channel",
                  "active": true
                }
                """#.utf8
            )
        )
        let client = ApologistAgentClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = GetDiscordChannelStatusResponse(
            status: Optional("status"),
            channel: Optional("channel"),
            active: Optional(true)
        )
        let response = try await client.channels.getDiscordChannelStatus(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func getDiscordChannelStatus2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "status": "status",
                  "channel": "channel",
                  "active": true
                }
                """#.utf8
            )
        )
        let client = ApologistAgentClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = GetDiscordChannelStatusResponse(
            status: Optional("status"),
            channel: Optional("channel"),
            active: Optional(true)
        )
        let response = try await client.channels.getDiscordChannelStatus(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func verifyFacebookWebhook1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                string
                """#.utf8
            )
        )
        let client = ApologistAgentClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = "string"
        let response = try await client.channels.verifyFacebookWebhook(
            id: "id",
            hubMode: .subscribe,
            hubVerifyToken: "hub.verify_token",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func getInstagramPrivacyPolicy1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                string
                """#.utf8
            )
        )
        let client = ApologistAgentClient(
            baseURL: "https://api.fern.com",
            apiKey: "<value>",
            urlSession: stub.urlSession
        )
        let expectedResponse = "string"
        let response = try await client.channels.getInstagramPrivacyPolicy(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}