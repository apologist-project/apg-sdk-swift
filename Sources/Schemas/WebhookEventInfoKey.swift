import Foundation

/// Stable machine-readable event key.
public enum WebhookEventInfoKey: String, Codable, Hashable, CaseIterable, Sendable {
    case promptSubmit = "prompt_submit"
    case responseStart = "response_start"
    case responseEnd = "response_end"
    case automationsEnd = "automations_end"
    case responseLike = "response_like"
    case responseFlag = "response_flag"
    case responseFeedback = "response_feedback"
    case referralClick = "referral_click"
    case ctaTrigger = "cta_trigger"
    case ctaClick = "cta_click"
    case guardrailTrigger = "guardrail_trigger"
    case attributionClick = "attribution_click"
    case footerClick = "footer_click"
    case newUser = "new_user"
    case newDevice = "new_device"
    case newSession = "new_session"
    case newConversation = "new_conversation"
    case error
}