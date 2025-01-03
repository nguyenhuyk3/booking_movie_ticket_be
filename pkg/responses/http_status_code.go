package responses

const (
	Success = 20000
	// Auth
	InvalidEmail       = 20003
	InvalidToken       = 30001
	InvalidOTP         = 30002
	SendFailedEmailOtp = 30003
	// User Authentication
	FailedAuth = 40005
	// Register code
	UserHasExists = 50001 // user has already registered

	SystemError = 50000

	// Err login
	OtpNotExists     = 60009
	UserOtpNotExists = 60008
	// Two Factor Authentication
	TwoFactorAuthSetupFailed  = 80001
	TwoFactorAuthVerifyFailed = 80002
)

// message
var msg = map[int]string{
	Success: "success",

	InvalidEmail:       "email is invalid",
	InvalidToken:       "token is invalid",
	InvalidOTP:         "otp is invalid",
	SendFailedEmailOtp: "failed to send email OTP",

	FailedAuth: "authentication failed",

	UserHasExists: "user has already registered",

	SystemError: "system error has occured",

	OtpNotExists:     "otp exists but not registered",
	UserOtpNotExists: "user OTP not exists",
	// Two Factor Authentication
	TwoFactorAuthSetupFailed:  "two Factor Authentication setup failed",
	TwoFactorAuthVerifyFailed: "two Factor Authentication verify failed",
}
