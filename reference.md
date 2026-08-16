# Reference
## Chat
<details><summary><code>client.chat.<a href="/Sources/Resources/Chat/ChatClient.swift">listChatCompletions</a>(page: Int?, perPage: Int?, agentId: String?, channelId: String?, bibleId: String?, cached: String?, client: String?, configId: String?, conversationId: String?, deviceId: String?, flagged: String?, favorited: String?, language: String?, liked: String?, sessionId: String?, userId: String?, minTimestamp: String?, maxTimestamp: String?, requestOptions: RequestOptions?) -> ListChatCompletionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of chat completions (prompts) for the agent, with applied tags expanded as { id, name } and share metadata.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.chat.listChatCompletions()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page:** `Int?` 
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `Int?` — Results per page (clamped to 100).
    
</dd>
</dl>

<dl>
<dd>

**agentId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**channelId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**bibleId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**cached:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**client:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**configId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**conversationId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**deviceId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**flagged:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**favorited:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**language:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**liked:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**sessionId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**minTimestamp:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**maxTimestamp:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.chat.<a href="/Sources/Resources/Chat/ChatClient.swift">createChatCompletion</a>(request: ChatCompletionRequest, requestOptions: RequestOptions?) -> ChatCompletionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a chat completion using the agent's configured model. Supports both streaming and non-streaming responses.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.chat.createChatCompletion(request: ChatCompletionRequest.jsonValue(
        .object([
            "key": .string("value")
        ])
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `ChatCompletionRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.chat.<a href="/Sources/Resources/Chat/ChatClient.swift">likeCompletion</a>(id: String, request: Requests.LikeRequest, requestOptions: RequestOptions?) -> SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the like status of a specific chat completion
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.chat.likeCompletion(
        id: "id",
        request: .init(liked: true)
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the chat completion
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.LikeRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.chat.<a href="/Sources/Resources/Chat/ChatClient.swift">flagCompletion</a>(id: String, request: Requests.FlagRequest, requestOptions: RequestOptions?) -> SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates the flagged status of a specific chat completion
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.chat.flagCompletion(
        id: "id",
        request: .init(flagged: true)
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the chat completion
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.FlagRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.chat.<a href="/Sources/Resources/Chat/ChatClient.swift">feedbackCompletion</a>(id: String, request: Requests.FeedbackRequest, requestOptions: RequestOptions?) -> SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Adds user feedback to a specific chat completion
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.chat.feedbackCompletion(
        id: "id",
        request: .init(feedback: "feedback")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the chat completion
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.FeedbackRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.chat.<a href="/Sources/Resources/Chat/ChatClient.swift">shareCompletion</a>(id: String, request: Requests.ShareRequest, requestOptions: RequestOptions?) -> SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Creates a share record for a specific chat completion
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.chat.shareCompletion(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the chat completion
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ShareRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.chat.<a href="/Sources/Resources/Chat/ChatClient.swift">getChatCompletion</a>(id: String, requestOptions: RequestOptions?) -> GetChatCompletionResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a single chat completion (prompt) by numeric id or UUID, including applied tags, guardrail/cta metadata, share metadata, and automation results.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.chat.getChatCompletion(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The numeric id or UUID of the chat completion
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Corpus
<details><summary><code>client.corpus.<a href="/Sources/Resources/Corpus/CorpusClient.swift">searchCorpus</a>(request: Requests.CorpusSearchRequest, requestOptions: RequestOptions?) -> SearchCorpusResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Performs a semantic search across the agent's corpus of knowledge
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.corpus.searchCorpus(request: .init(query: "query"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CorpusSearchRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.corpus.<a href="/Sources/Resources/Corpus/CorpusClient.swift">logCorpusView</a>(model: String, id: String, request: Requests.ViewRequest, requestOptions: RequestOptions?) -> SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Records that a user viewed a specific corpus item
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.corpus.logCorpusView(
        model: "model",
        id: "id",
        request: .init(promptId: "prompt_id")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**model:** `String` — The model type (e.g., 'source')
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — The ID of the corpus item
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ViewRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.corpus.<a href="/Sources/Resources/Corpus/CorpusClient.swift">logCorpusImpression</a>(model: String, id: String, request: Requests.ImpressionRequest, requestOptions: RequestOptions?) -> SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Records that a corpus item was shown to a user
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.corpus.logCorpusImpression(
        model: "model",
        id: "id",
        request: .init(promptId: "prompt_id")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**model:** `String` — The model type (e.g., 'source')
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — The ID of the corpus item
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ImpressionRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.corpus.<a href="/Sources/Resources/Corpus/CorpusClient.swift">logCorpusReferralRedirect</a>(model: String, id: String, promptId: String, userId: String?, url: String?, requestOptions: RequestOptions?) -> SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Records a referral for a corpus item and, when a `url` is supplied, issues a 302 redirect to it. Without a `url`, responds with a success message. Requires either the search API entitlement or a signed `browser_key` cookie.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.corpus.logCorpusReferralRedirect(
        model: "model",
        id: "id",
        promptId: "prompt_id"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**model:** `String` — The model type (e.g., 'source')
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — The numeric ID of the corpus item
    
</dd>
</dl>

<dl>
<dd>

**promptId:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**userId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**url:** `String?` — URL-encoded destination to redirect to after logging the referral.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.corpus.<a href="/Sources/Resources/Corpus/CorpusClient.swift">logCorpusReferral</a>(model: String, id: String, request: Requests.ReferralRequest, requestOptions: RequestOptions?) -> SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Records that a user was referred to a corpus item
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.corpus.logCorpusReferral(
        model: "model",
        id: "id",
        request: .init(promptId: "prompt_id")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**model:** `String` — The model type (e.g., 'source')
    
</dd>
</dl>

<dl>
<dd>

**id:** `String` — The ID of the corpus item
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ReferralRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Evaluators
<details><summary><code>client.evaluators.<a href="/Sources/Resources/Evaluators/EvaluatorsClient.swift">listEvaluations</a>(id: String, page: Int?, perPage: Int?, minTimestamp: String?, maxTimestamp: String?, minDuration: String?, maxDuration: String?, minScore: String?, maxScore: String?, passed: String?, benchmark: String?, benchmarkRunId: String?, benchmarkQuestionId: String?, requestOptions: RequestOptions?) -> ListEvaluationsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of evaluations for the evaluator, scoped to the requesting agent.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.evaluators.listEvaluations(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID or key of the evaluator
    
</dd>
</dl>

<dl>
<dd>

**page:** `Int?` 
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `Int?` — Results per page (clamped to 100).
    
</dd>
</dl>

<dl>
<dd>

**minTimestamp:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**maxTimestamp:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**minDuration:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**maxDuration:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**minScore:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**maxScore:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**passed:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**benchmark:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**benchmarkRunId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**benchmarkQuestionId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.evaluators.<a href="/Sources/Resources/Evaluators/EvaluatorsClient.swift">evaluateContent</a>(id: String, request: Requests.EvaluatorRequest, requestOptions: RequestOptions?) -> EvaluateContentResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Runs an evaluation on the provided content using the specified evaluator
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.evaluators.evaluateContent(
        id: "id",
        request: .init(content: EvaluatorRequestContent.string(
            "content"
        ))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID or key of the evaluator
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.EvaluatorRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.evaluators.<a href="/Sources/Resources/Evaluators/EvaluatorsClient.swift">getEvaluation</a>(id: String, evaluationId: String, requestOptions: RequestOptions?) -> GetEvaluationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a single evaluation for the evaluator, scoped to the requesting agent.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.evaluators.getEvaluation(
        id: "id",
        evaluationId: "evaluationId"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id or key of the evaluator
    
</dd>
</dl>

<dl>
<dd>

**evaluationId:** `String` — The id or UUID of the evaluation
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## CTAs
<details><summary><code>client.ctAs.<a href="/Sources/Resources/CtAs/CtAsClient.swift">matchCtas</a>(request: CtaMatchRequest, requestOptions: RequestOptions?) -> MatchCtasResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Finds matching CTAs based on conversation context, user, session, device, or messages
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.ctAs.matchCtas(request: CtaMatchRequest.jsonValue(
        .object([
            "key": .string("value")
        ])
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `CtaMatchRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.ctAs.<a href="/Sources/Resources/CtAs/CtAsClient.swift">logCtaClick</a>(id: String, request: Requests.CtaClickRequest, requestOptions: RequestOptions?) -> SuccessResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Records that a user clicked on a specific CTA
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.ctAs.logCtaClick(
        id: "id",
        request: .init(promptId: "prompt_id")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The ID of the CTA
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.CtaClickRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Users
<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">listUsers</a>(page: Int?, perPage: Int?, externalId: String?, tags: String?, responderId: String?, minTimestamp: String?, maxTimestamp: String?, requestOptions: RequestOptions?) -> ListUsersResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of users for the agent's team, with applied tags expanded as { id, name } and the persisted responder id.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.users.listUsers()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page:** `Int?` 
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `Int?` — Results per page (clamped to 100).
    
</dd>
</dl>

<dl>
<dd>

**externalId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**tags:** `String?` — Comma-separated tag ids.
    
</dd>
</dl>

<dl>
<dd>

**responderId:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**minTimestamp:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**maxTimestamp:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">listUserFlags</a>(page: Int?, perPage: Int?, requestOptions: RequestOptions?) -> ListUserFlagsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of user flag definitions for the agent's team (all columns from user_flags), ordered by id ascending.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.users.listUserFlags()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**page:** `Int?` 
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `Int?` — Results per page (clamped to 100).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">getUser</a>(userId: String, requestOptions: RequestOptions?) -> GetUserResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a single user by external id or internal id, with expanded tags and the persisted responder for the agent.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.users.getUser(userId: "user_id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**userId:** `String` — The user's external id or internal id
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.users.<a href="/Sources/Resources/Users/UsersClient.swift">updateUser</a>(userId: String, request: Requests.UserUpdateRequest, requestOptions: RequestOptions?) -> UpdateUserResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Updates a user's external_id and/or tags and upserts the persisted responder for the agent. Only provided fields are changed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.users.updateUser(
        userId: "user_id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**userId:** `String` — The user's external id or internal id
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UserUpdateRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Benchmarks
<details><summary><code>client.benchmarks.<a href="/Sources/Resources/Benchmarks/BenchmarksClient.swift">listBenchmarkRuns</a>(id: String, page: Int?, perPage: Int?, minTimestamp: String?, maxTimestamp: String?, minDuration: String?, maxDuration: String?, minScore: String?, maxScore: String?, passed: String?, minResponses: String?, maxResponses: String?, requestOptions: RequestOptions?) -> ListBenchmarkRunsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a paginated list of runs for a benchmark, scoped to the requesting agent. Each run carries nested evaluators, questions, and a flat evaluations array.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.benchmarks.listBenchmarkRuns(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id or key of the benchmark
    
</dd>
</dl>

<dl>
<dd>

**page:** `Int?` 
    
</dd>
</dl>

<dl>
<dd>

**perPage:** `Int?` — Results per page (clamped to 100).
    
</dd>
</dl>

<dl>
<dd>

**minTimestamp:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**maxTimestamp:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**minDuration:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**maxDuration:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**minScore:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**maxScore:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**passed:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**minResponses:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**maxResponses:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.benchmarks.<a href="/Sources/Resources/Benchmarks/BenchmarksClient.swift">runBenchmark</a>(id: String, request: Requests.BenchmarkRunRequest, requestOptions: RequestOptions?) -> [String: JSONValue]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Executes a benchmark run and returns the aggregated result with nested evaluators, questions, and a flat evaluations array.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.benchmarks.runBenchmark(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id or key of the benchmark
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.BenchmarkRunRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.benchmarks.<a href="/Sources/Resources/Benchmarks/BenchmarksClient.swift">getBenchmarkRun</a>(id: String, runId: String, requestOptions: RequestOptions?) -> GetBenchmarkRunResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a single benchmark run by id or UUID, scoped to the requesting agent, including nested evaluators, questions, and evaluations.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.benchmarks.getBenchmarkRun(
        id: "id",
        runId: "runId"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The id or key of the benchmark
    
</dd>
</dl>

<dl>
<dd>

**runId:** `String` — The id or UUID of the run
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Channels
<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">getDiscordChannelStatus</a>(id: String, requestOptions: RequestOptions?) -> GetDiscordChannelStatusResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the status of the Discord channel. Used as a lightweight health/verification endpoint.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.channels.getDiscordChannelStatus(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The channel id
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">receiveDiscordInteraction</a>(id: String, signatureEd25519: String, signatureTimestamp: String, request: [String: JSONValue], requestOptions: RequestOptions?) -> Void</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Receives Discord interaction callbacks for the channel. Requests are verified via Ed25519 signature headers; unsigned or invalid requests are rejected. Payload shape is defined by Discord.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.channels.receiveDiscordInteraction(
        id: "id",
        signatureEd25519: "x-signature-ed25519",
        signatureTimestamp: "x-signature-timestamp",
        request: [
            "key": .string("value")
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The channel id
    
</dd>
</dl>

<dl>
<dd>

**signatureEd25519:** `String` — Discord request signature (hex).
    
</dd>
</dl>

<dl>
<dd>

**signatureTimestamp:** `String` — Discord request timestamp.
    
</dd>
</dl>

<dl>
<dd>

**request:** `[String: JSONValue]` — Discord interaction payload.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">getLineChannelStatus</a>(id: String, requestOptions: RequestOptions?) -> GetLineChannelStatusResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns the status of the LINE channel. Used as a lightweight health/verification endpoint.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.channels.getLineChannelStatus(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The channel id
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">receiveLineWebhook</a>(id: String, lineSignature: String?, request: [String: JSONValue], requestOptions: RequestOptions?) -> Void</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Receives LINE Messaging API webhook events for the channel. Requests are verified via the `x-line-signature` HMAC-SHA256 (Base64) header using the channel secret unless an `api_key` is present. Payload shape is defined by LINE. The route acknowledges quickly and processes text `message` and `follow` events asynchronously.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.channels.receiveLineWebhook(
        id: "id",
        request: [
            "key": .string("value")
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The channel id
    
</dd>
</dl>

<dl>
<dd>

**lineSignature:** `String?` — Base64-encoded HMAC-SHA256 of the raw body keyed with the LINE channel secret. Required when the webhook URL does not include an api_key.
    
</dd>
</dl>

<dl>
<dd>

**request:** `[String: JSONValue]` — LINE webhook payload (`destination` + `events`).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">verifyFacebookWebhook</a>(id: String, hubMode: VerifyFacebookWebhookRequestHubMode, hubVerifyToken: String, hubChallenge: String?, requestOptions: RequestOptions?) -> String</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Handles the Meta webhook verification handshake, echoing `hub.challenge` when `hub.verify_token` matches the channel's configured token.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.channels.verifyFacebookWebhook(
        id: "id",
        hubMode: .subscribe,
        hubVerifyToken: "hub.verify_token"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The channel id
    
</dd>
</dl>

<dl>
<dd>

**hubMode:** `VerifyFacebookWebhookRequestHubMode` 
    
</dd>
</dl>

<dl>
<dd>

**hubVerifyToken:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**hubChallenge:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">receiveFacebookMessage</a>(id: String, request: [String: JSONValue], requestOptions: RequestOptions?) -> Void</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Receives Facebook/Messenger (and Instagram-style) message events for the channel. Payload shape is defined by Meta.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.channels.receiveFacebookMessage(
        id: "id",
        request: [
            "key": .string("value")
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The channel id
    
</dd>
</dl>

<dl>
<dd>

**request:** `[String: JSONValue]` — Meta webhook payload.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">getInstagramPrivacyPolicy</a>(id: String, requestOptions: RequestOptions?) -> String</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns a static HTML privacy policy page for the Instagram integration.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.channels.getInstagramPrivacyPolicy(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The channel id
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">receiveTelegramUpdate</a>(id: String, request: [String: JSONValue], requestOptions: RequestOptions?) -> Void</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Receives Telegram bot update events for the channel. Non-message updates are acknowledged and ignored. Payload shape is defined by Telegram.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.channels.receiveTelegramUpdate(
        id: "id",
        request: [
            "key": .string("value")
        ]
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The channel id
    
</dd>
</dl>

<dl>
<dd>

**request:** `[String: JSONValue]` — Telegram update payload.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.channels.<a href="/Sources/Resources/Channels/ChannelsClient.swift">receiveTwilioMessage</a>(id: String, request: Requests.ReceiveTwilioMessageRequest, requestOptions: RequestOptions?) -> Void</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Receives inbound Twilio messages for the channel as form-encoded data. Payload fields are defined by Twilio.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.channels.receiveTwilioMessage(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` — The channel id
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ReceiveTwilioMessageRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Shares
<details><summary><code>client.shares.<a href="/Sources/Resources/Shares/SharesClient.swift">getSharedMessages</a>(token: String, requestOptions: RequestOptions?) -> GetSharedMessagesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Public, unauthenticated read of the messages behind a share token. The token is the bearer capability and enforces tenant isolation against the host agent. An empty or invalid token yields an empty messages array.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Apologist

private func main() async throws {
    let client = ApologistAgentClient(apiKey: "<value>")

    _ = try await client.shares.getSharedMessages(token: "token")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**token:** `String` — The share token
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

