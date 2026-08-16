import Foundation

public final class ChannelsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns the status of the Discord channel. Used as a lightweight health/verification endpoint.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.channels.getDiscordChannelStatus(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The channel id
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getDiscordChannelStatus(id: String, requestOptions: RequestOptions? = nil) async throws -> GetDiscordChannelStatusResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/channels/\(id)/discord",
            requestOptions: requestOptions,
            responseType: GetDiscordChannelStatusResponse.self
        )
    }

    /// Receives Discord interaction callbacks for the channel. Requests are verified via Ed25519 signature headers; unsigned or invalid requests are rejected. Payload shape is defined by Discord.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.channels.receiveDiscordInteraction(
    ///         id: "id",
    ///         signatureEd25519: "x-signature-ed25519",
    ///         signatureTimestamp: "x-signature-timestamp",
    ///         request: [
    ///             "key": .string("value")
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The channel id
    /// - Parameter signatureEd25519: Discord request signature (hex).
    /// - Parameter signatureTimestamp: Discord request timestamp.
    /// - Parameter request: Discord interaction payload.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func receiveDiscordInteraction(id: String, signatureEd25519: String, signatureTimestamp: String, request: [String: JSONValue], requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .post,
            path: "/channels/\(id)/discord",
            headers: [
                "x-signature-ed25519": signatureEd25519, 
                "x-signature-timestamp": signatureTimestamp
            ],
            body: request,
            requestOptions: requestOptions
        )
    }

    /// Returns the status of the LINE channel. Used as a lightweight health/verification endpoint.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.channels.getLineChannelStatus(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The channel id
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getLineChannelStatus(id: String, requestOptions: RequestOptions? = nil) async throws -> GetLineChannelStatusResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/channels/\(id)/line",
            requestOptions: requestOptions,
            responseType: GetLineChannelStatusResponse.self
        )
    }

    /// Receives LINE Messaging API webhook events for the channel. Requests are verified via the `x-line-signature` HMAC-SHA256 (Base64) header using the channel secret unless an `api_key` is present. Payload shape is defined by LINE. The route acknowledges quickly and processes text `message` and `follow` events asynchronously.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.channels.receiveLineWebhook(
    ///         id: "id",
    ///         request: [
    ///             "key": .string("value")
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The channel id
    /// - Parameter lineSignature: Base64-encoded HMAC-SHA256 of the raw body keyed with the LINE channel secret. Required when the webhook URL does not include an api_key.
    /// - Parameter request: LINE webhook payload (`destination` + `events`).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func receiveLineWebhook(id: String, lineSignature: String? = nil, request: [String: JSONValue], requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .post,
            path: "/channels/\(id)/line",
            headers: [
                "x-line-signature": lineSignature
            ],
            body: request,
            requestOptions: requestOptions
        )
    }

    /// Handles the Meta webhook verification handshake, echoing `hub.challenge` when `hub.verify_token` matches the channel's configured token.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.channels.verifyFacebookWebhook(
    ///         id: "id",
    ///         hubMode: .subscribe,
    ///         hubVerifyToken: "hub.verify_token"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The channel id
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func verifyFacebookWebhook(id: String, hubMode: VerifyFacebookWebhookRequestHubMode, hubVerifyToken: String, hubChallenge: String? = nil, requestOptions: RequestOptions? = nil) async throws -> String {
        return try await httpClient.performRequest(
            method: .get,
            path: "/channels/\(id)/facebook",
            queryParams: [
                "hub.mode": .string(hubMode.rawValue), 
                "hub.verify_token": .string(hubVerifyToken), 
                "hub.challenge": hubChallenge.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: String.self
        )
    }

    /// Receives Facebook/Messenger (and Instagram-style) message events for the channel. Payload shape is defined by Meta.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.channels.receiveFacebookMessage(
    ///         id: "id",
    ///         request: [
    ///             "key": .string("value")
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The channel id
    /// - Parameter request: Meta webhook payload.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func receiveFacebookMessage(id: String, request: [String: JSONValue], requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .post,
            path: "/channels/\(id)/facebook",
            body: request,
            requestOptions: requestOptions
        )
    }

    /// Returns a static HTML privacy policy page for the Instagram integration.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.channels.getInstagramPrivacyPolicy(id: "id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The channel id
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getInstagramPrivacyPolicy(id: String, requestOptions: RequestOptions? = nil) async throws -> String {
        return try await httpClient.performRequest(
            method: .get,
            path: "/channels/\(id)/instagram/privacy",
            requestOptions: requestOptions,
            responseType: String.self
        )
    }

    /// Receives Telegram bot update events for the channel. Non-message updates are acknowledged and ignored. Payload shape is defined by Telegram.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.channels.receiveTelegramUpdate(
    ///         id: "id",
    ///         request: [
    ///             "key": .string("value")
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The channel id
    /// - Parameter request: Telegram update payload.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func receiveTelegramUpdate(id: String, request: [String: JSONValue], requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .post,
            path: "/channels/\(id)/telegram",
            body: request,
            requestOptions: requestOptions
        )
    }

    /// Receives inbound Twilio messages for the channel as form-encoded data. Payload fields are defined by Twilio.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.channels.receiveTwilioMessage(
    ///         id: "id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter id: The channel id
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func receiveTwilioMessage(id: String, request: Requests.ReceiveTwilioMessageRequest, requestOptions: RequestOptions? = nil) async throws -> Void {
        return try await httpClient.performRequest(
            method: .post,
            path: "/channels/\(id)/twilio",
            body: request,
            requestOptions: requestOptions
        )
    }
}