import Foundation

/// Use this class to access the different functions within the SDK. You can instantiate any number of clients with different configuration that will propagate to these functions.
public final class ApiClient: Sendable {
    public let chat: ChatClient
    public let corpus: CorpusClient
    public let evaluators: EvaluatorsClient
    public let ctAs: CtAsClient
    public let users: UsersClient
    public let benchmarks: BenchmarksClient
    public let channels: ChannelsClient
    public let shares: SharesClient
    public let webhooks: WebhooksClient
    private let httpClient: HTTPClient

    /// Initialize the client with the specified configuration.
    ///
    /// - Parameter baseURL: The base URL to use for requests from the client. If not provided, the default base URL will be used.
    /// - Parameter apiKey: The API key to use for authentication.
    /// - Parameter headers: Additional headers to send with each request.
    /// - Parameter timeout: Request timeout in seconds. Defaults to 60 seconds. Ignored if a custom `urlSession` is provided.
    /// - Parameter maxRetries: Maximum number of retries for failed requests. Defaults to 2.
    /// - Parameter urlSession: Custom `URLSession` to use for requests. If not provided, a default session will be created with the specified timeout.
    public convenience init(
        baseURL: String = ApiEnvironment.default.rawValue,
        apiKey: String? = nil,
        headers: [String: String]? = nil,
        timeout: Int? = nil,
        maxRetries: Int? = nil,
        urlSession: Networking.URLSession? = nil
    ) {
        self.init(
            baseURL: baseURL,
            headerAuth: apiKey.map {
                .init(key: $0, header: "x-api-key")
            },
            bearerAuth: nil,
            basicAuth: nil,
            headers: headers,
            timeout: timeout,
            maxRetries: maxRetries,
            urlSession: urlSession
        )
    }

    init(
        baseURL: String,
        headerAuth: ClientConfig.HeaderAuth? = nil,
        bearerAuth: ClientConfig.BearerAuth? = nil,
        basicAuth: ClientConfig.BasicAuth? = nil,
        headers: [String: String]? = nil,
        timeout: Int? = nil,
        maxRetries: Int? = nil,
        urlSession: Networking.URLSession? = nil
    ) {
        let config = ClientConfig(
            baseURL: baseURL,
            headerAuth: headerAuth,
            bearerAuth: bearerAuth,
            basicAuth: basicAuth,
            headers: headers,
            timeout: timeout,
            maxRetries: maxRetries,
            urlSession: urlSession
        )
        self.chat = ChatClient(config: config)
        self.corpus = CorpusClient(config: config)
        self.evaluators = EvaluatorsClient(config: config)
        self.ctAs = CtAsClient(config: config)
        self.users = UsersClient(config: config)
        self.benchmarks = BenchmarksClient(config: config)
        self.channels = ChannelsClient(config: config)
        self.shares = SharesClient(config: config)
        self.webhooks = WebhooksClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }
}