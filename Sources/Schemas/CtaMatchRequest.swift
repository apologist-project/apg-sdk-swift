import Foundation

public enum CtaMatchRequest: Codable, Hashable, Sendable {
    case jsonValue(JSONValue)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(JSONValue.self) {
            self = .jsonValue(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .jsonValue(let value):
            try container.encode(value)
        }
    }
}