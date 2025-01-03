package global

import (
	"booking_movie_ticket/pkg/settings"
	"database/sql"
)

var (
	Config     settings.Config
	Postgresql *sql.DB
)
