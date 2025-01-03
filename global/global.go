package global

import (
	"booking_movie_ticket/pkg/logger"
	"booking_movie_ticket/pkg/settings"
	"database/sql"
)

var (
	Config     settings.Config
	Logger     *logger.LoggerZap
	Postgresql *sql.DB
)
