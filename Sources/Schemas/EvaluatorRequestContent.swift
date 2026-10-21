import Foundation

/// Text to evaluate, an array of strings, or chat messages.
public enum EvaluatorRequestContent: Codable, Hashable, Sendable {
    case string(String)
    case evaluatorRequestContentOneItemArray([EvaluatorRequestContentOneItem])

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode([EvaluatorRequestContentOneItem].self) {
            self = .evaluatorRequestContentOneItemArray(value)
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
        case .string(let value):
            try container.encode(value)
        case .evaluatorRequestContentOneItemArray(let value):
            try container.encode(value)
        }
    }
}