import Foundation
import Testing
import Apologist

@Suite("UsersClient Wire Tests") struct UsersClientWireTests {
    @Test func listUsers1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "id": "id",
                      "external_id": "external_id",
                      "team_id": 1,
                      "created_at": "created_at",
                      "migrated_at": "migrated_at",
                      "migrated_to_user_id": "migrated_to_user_id",
                      "tags": [
                        {}
                      ],
                      "responder_id": 1
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
        let expectedResponse = ListUsersResponse(
            data: Optional([
                User(
                    id: Optional("id"),
                    externalId: Optional(Nullable<String>.value("external_id")),
                    teamId: Optional(1),
                    createdAt: Optional("created_at"),
                    migratedAt: Optional(Nullable<String>.value("migrated_at")),
                    migratedToUserId: Optional(Nullable<String>.value("migrated_to_user_id")),
                    tags: Optional([
                        TagRef(

                        )
                    ]),
                    responderId: Optional(Nullable<Int>.value(1))
                )
            ]),
            total: Optional(1),
            page: Optional(1),
            perPage: Optional(1)
        )
        let response = try await client.users.listUsers(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func listUsers2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "id": "id",
                      "external_id": "external_id",
                      "team_id": 1,
                      "created_at": "created_at",
                      "migrated_at": "migrated_at",
                      "migrated_to_user_id": "migrated_to_user_id",
                      "tags": [
                        {
                          "id": 1,
                          "name": "name"
                        },
                        {
                          "id": 1,
                          "name": "name"
                        }
                      ],
                      "responder_id": 1
                    },
                    {
                      "id": "id",
                      "external_id": "external_id",
                      "team_id": 1,
                      "created_at": "created_at",
                      "migrated_at": "migrated_at",
                      "migrated_to_user_id": "migrated_to_user_id",
                      "tags": [
                        {
                          "id": 1,
                          "name": "name"
                        },
                        {
                          "id": 1,
                          "name": "name"
                        }
                      ],
                      "responder_id": 1
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
        let expectedResponse = ListUsersResponse(
            data: Optional([
                User(
                    id: Optional("id"),
                    externalId: Optional(Nullable<String>.value("external_id")),
                    teamId: Optional(1),
                    createdAt: Optional("created_at"),
                    migratedAt: Optional(Nullable<String>.value("migrated_at")),
                    migratedToUserId: Optional(Nullable<String>.value("migrated_to_user_id")),
                    tags: Optional([
                        TagRef(
                            id: Optional(1),
                            name: Optional("name")
                        ),
                        TagRef(
                            id: Optional(1),
                            name: Optional("name")
                        )
                    ]),
                    responderId: Optional(Nullable<Int>.value(1))
                ),
                User(
                    id: Optional("id"),
                    externalId: Optional(Nullable<String>.value("external_id")),
                    teamId: Optional(1),
                    createdAt: Optional("created_at"),
                    migratedAt: Optional(Nullable<String>.value("migrated_at")),
                    migratedToUserId: Optional(Nullable<String>.value("migrated_to_user_id")),
                    tags: Optional([
                        TagRef(
                            id: Optional(1),
                            name: Optional("name")
                        ),
                        TagRef(
                            id: Optional(1),
                            name: Optional("name")
                        )
                    ]),
                    responderId: Optional(Nullable<Int>.value(1))
                )
            ]),
            total: Optional(1),
            page: Optional(1),
            perPage: Optional(1)
        )
        let response = try await client.users.listUsers(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func listUserFlags1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "id": 1,
                      "name": "name",
                      "user_id": 1,
                      "team_id": 1,
                      "synced_at": "synced_at"
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
        let expectedResponse = ListUserFlagsResponse(
            data: Optional([
                UserFlag(
                    id: Optional(1),
                    name: Optional("name"),
                    userId: Optional(Nullable<Int>.value(1)),
                    teamId: Optional(Nullable<Int>.value(1)),
                    syncedAt: Optional("synced_at")
                )
            ]),
            total: Optional(1),
            page: Optional(1),
            perPage: Optional(1)
        )
        let response = try await client.users.listUserFlags(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func listUserFlags2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "id": 1,
                      "name": "name",
                      "user_id": 1,
                      "team_id": 1,
                      "synced_at": "synced_at"
                    },
                    {
                      "id": 1,
                      "name": "name",
                      "user_id": 1,
                      "team_id": 1,
                      "synced_at": "synced_at"
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
        let expectedResponse = ListUserFlagsResponse(
            data: Optional([
                UserFlag(
                    id: Optional(1),
                    name: Optional("name"),
                    userId: Optional(Nullable<Int>.value(1)),
                    teamId: Optional(Nullable<Int>.value(1)),
                    syncedAt: Optional("synced_at")
                ),
                UserFlag(
                    id: Optional(1),
                    name: Optional("name"),
                    userId: Optional(Nullable<Int>.value(1)),
                    teamId: Optional(Nullable<Int>.value(1)),
                    syncedAt: Optional("synced_at")
                )
            ]),
            total: Optional(1),
            page: Optional(1),
            perPage: Optional(1)
        )
        let response = try await client.users.listUserFlags(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func getUser1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "id": "id",
                    "external_id": "external_id",
                    "team_id": 1,
                    "created_at": "created_at",
                    "migrated_at": "migrated_at",
                    "migrated_to_user_id": "migrated_to_user_id",
                    "tags": [
                      {}
                    ],
                    "responder_id": 1
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
        let expectedResponse = GetUserResponse(
            data: Optional(User(
                id: Optional("id"),
                externalId: Optional(Nullable<String>.value("external_id")),
                teamId: Optional(1),
                createdAt: Optional("created_at"),
                migratedAt: Optional(Nullable<String>.value("migrated_at")),
                migratedToUserId: Optional(Nullable<String>.value("migrated_to_user_id")),
                tags: Optional([
                    TagRef(

                    )
                ]),
                responderId: Optional(Nullable<Int>.value(1))
            ))
        )
        let response = try await client.users.getUser(
            userId: "user_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func getUser2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "id": "id",
                    "external_id": "external_id",
                    "team_id": 1,
                    "created_at": "created_at",
                    "migrated_at": "migrated_at",
                    "migrated_to_user_id": "migrated_to_user_id",
                    "tags": [
                      {
                        "id": 1,
                        "name": "name"
                      },
                      {
                        "id": 1,
                        "name": "name"
                      }
                    ],
                    "responder_id": 1
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
        let expectedResponse = GetUserResponse(
            data: Optional(User(
                id: Optional("id"),
                externalId: Optional(Nullable<String>.value("external_id")),
                teamId: Optional(1),
                createdAt: Optional("created_at"),
                migratedAt: Optional(Nullable<String>.value("migrated_at")),
                migratedToUserId: Optional(Nullable<String>.value("migrated_to_user_id")),
                tags: Optional([
                    TagRef(
                        id: Optional(1),
                        name: Optional("name")
                    ),
                    TagRef(
                        id: Optional(1),
                        name: Optional("name")
                    )
                ]),
                responderId: Optional(Nullable<Int>.value(1))
            ))
        )
        let response = try await client.users.getUser(
            userId: "user_id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func updateUser1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "id": "id",
                    "external_id": "external_id",
                    "team_id": 1,
                    "created_at": "created_at",
                    "migrated_at": "migrated_at",
                    "migrated_to_user_id": "migrated_to_user_id",
                    "tags": [
                      {}
                    ],
                    "responder_id": 1
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
        let expectedResponse = UpdateUserResponse(
            data: Optional(User(
                id: Optional("id"),
                externalId: Optional(Nullable<String>.value("external_id")),
                teamId: Optional(1),
                createdAt: Optional("created_at"),
                migratedAt: Optional(Nullable<String>.value("migrated_at")),
                migratedToUserId: Optional(Nullable<String>.value("migrated_to_user_id")),
                tags: Optional([
                    TagRef(

                    )
                ]),
                responderId: Optional(Nullable<Int>.value(1))
            ))
        )
        let response = try await client.users.updateUser(
            userId: "user_id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func updateUser2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "id": "id",
                    "external_id": "external_id",
                    "team_id": 1,
                    "created_at": "created_at",
                    "migrated_at": "migrated_at",
                    "migrated_to_user_id": "migrated_to_user_id",
                    "tags": [
                      {
                        "id": 1,
                        "name": "name"
                      },
                      {
                        "id": 1,
                        "name": "name"
                      }
                    ],
                    "responder_id": 1
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
        let expectedResponse = UpdateUserResponse(
            data: Optional(User(
                id: Optional("id"),
                externalId: Optional(Nullable<String>.value("external_id")),
                teamId: Optional(1),
                createdAt: Optional("created_at"),
                migratedAt: Optional(Nullable<String>.value("migrated_at")),
                migratedToUserId: Optional(Nullable<String>.value("migrated_to_user_id")),
                tags: Optional([
                    TagRef(
                        id: Optional(1),
                        name: Optional("name")
                    ),
                    TagRef(
                        id: Optional(1),
                        name: Optional("name")
                    )
                ]),
                responderId: Optional(Nullable<Int>.value(1))
            ))
        )
        let response = try await client.users.updateUser(
            userId: "user_id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}