package send

import "time"

type MessageRequest struct {
	Phone             string        `json:"phone" form:"phone"`
	Message           string        `json:"message" form:"message"`
	ReplyMessageID    *string       `json:"reply_message_id" form:"reply_message_id"`
	BaseTypingDelay   time.Duration `json:"base_typing_delay" form:"base_typing_delay"`
	MarginTypingDelay time.Duration `json:"margin_typing_delay" form:"margin_typing_delay"`
}
