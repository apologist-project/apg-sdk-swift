import Foundation

public enum ChatCompletionRequestToolChoice: Codable, Hashable, Sendable {
    case chatCompletionRequestToolChoiceZero(ChatCompletionRequestToolChoiceZero)
    case nullableStringToJsonValueDictionary(Nullable<[String: JSONValue]>)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(ChatCompletionRequestToolChoiceZero.self) {
            self = .chatCompletionRequestToolChoiceZero(value)
        } else if let value = try? container.decode(Nullable<[String: JSONValue]>.self) {
            self = .nullableStringToJsonValueDictionary(value)
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
        case .chatCompletionRequestToolChoiceZero(let value):
            try container.encode(value)
        case .nullableStringToJsonValueDictionary(let value):
            try container.encode(value)
        }
    }
}