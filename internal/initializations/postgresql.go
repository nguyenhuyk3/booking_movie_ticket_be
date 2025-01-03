package initializations

import (
	"booking_movie_ticket/global"
	"database/sql"
	"fmt"

	_ "github.com/lib/pq"
)

func initPostgresql() {
	config := global.Config.Postgresql
	connStr := fmt.Sprintf("host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
		config.Host, config.Port, config.Username, config.Password, config.DbName)
	db, err := sql.Open("postgres", connStr)
	if err != nil {
		fmt.Println("error connecting to the database (initPostgresql):", err)
		return
	}
	defer db.Close()

	global.Postgresql = db
}
