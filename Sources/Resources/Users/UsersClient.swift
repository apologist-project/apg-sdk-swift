import Foundation

public final class UsersClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Returns a paginated list of users for the agent's team, with applied tags expanded as { id, name } and the persisted responder id.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.users.listUsers()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter perPage: Results per page (clamped to 100).
    /// - Parameter tags: Comma-separated tag ids.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func listUsers(page: Int? = nil, perPage: Int? = nil, externalId: String? = nil, tags: String? = nil, responderId: String? = nil, minTimestamp: String? = nil, maxTimestamp: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ListUsersResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users",
            queryParams: [
                "page": page.map { .int($0) }, 
                "per_page": perPage.map { .int($0) }, 
                "external_id": externalId.map { .string($0) }, 
                "tags": tags.map { .string($0) }, 
                "responder_id": responderId.map { .string($0) }, 
                "min_timestamp": minTimestamp.map { .string($0) }, 
                "max_timestamp": maxTimestamp.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListUsersResponse.self
        )
    }

    /// Returns a paginated list of user flag definitions for the agent's team (all columns from user_flags), ordered by id ascending.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.users.listUserFlags()
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter perPage: Results per page (clamped to 100).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func listUserFlags(page: Int? = nil, perPage: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ListUserFlagsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/flags",
            queryParams: [
                "page": page.map { .int($0) }, 
                "per_page": perPage.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListUserFlagsResponse.self
        )
    }

    /// Returns a single user by external id or internal id, with expanded tags and the persisted responder for the agent.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.users.getUser(userId: "user_id")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter userId: The user's external id or internal id
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getUser(userId: String, requestOptions: RequestOptions? = nil) async throws -> GetUserResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/users/\(userId)",
            requestOptions: requestOptions,
            responseType: GetUserResponse.self
        )
    }

    /// Updates a user's external_id and/or tags and upserts the persisted responder for the agent. Only provided fields are changed.
    ///
    /// ```swift
    /// import Foundation
    /// import Apologist
    ///
    /// private func main() async throws {
    ///     let client = ApologistAgentClient(apiKey: "<value>")
    ///
    ///     _ = try await client.users.updateUser(
    ///         userId: "user_id",
    ///         request: .init()
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter userId: The user's external id or internal id
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func updateUser(userId: String, request: Requests.UserUpdateRequest, requestOptions: RequestOptions? = nil) async throws -> UpdateUserResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/users/\(userId)",
            body: request,
            requestOptions: requestOptions,
            responseType: UpdateUserResponse.self
        )
    }
}