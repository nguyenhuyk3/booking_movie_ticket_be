package initializations

func Run() {
	loadConfig()
	initLogger()
	initPostgresql()
}
