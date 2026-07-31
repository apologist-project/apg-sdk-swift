import Foundation

public enum ChatCompletionRequestResponseFormatType: String, Codable, Hashable, CaseIterable, Sendable {
    case text
    case html
    case json
    case raw
    case jsonSchema = "json_schema"
}