import Foundation

public enum EvaluatorRequestContentOneItem: Codable, Hashable, Sendable {
    case string(String)
    case chatMessage(ChatMessage)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode(ChatMessage.self) {
            self = .chatMessage(value)
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
        case .chatMessage(let value):
            try container.encode(value)
        }
    }
}