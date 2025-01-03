package initializations

import (
	"booking_movie_ticket/global"
	"booking_movie_ticket/pkg/logger"
)

func initLogger() {
	global.Logger = logger.NewLogger(global.Config.Logger)
}
