import Foundation

/// Content to evaluate. Required when `source_id` is supplied.
public enum BenchmarkRunRequestContent: Codable, Hashable, Sendable {
    case nullableString(Nullable<String>)
    case nullableJsonValueArray(Nullable<[JSONValue]>)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Nullable<String>.self) {
            self = .nullableString(value)
        } else if let value = try? container.decode(Nullable<[JSONValue]>.self) {
            self = .nullableJsonValueArray(value)
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
        case .nullableString(let value):
            try container.encode(value)
        case .nullableJsonValueArray(let value):
            try container.encode(value)
        }
    }
}