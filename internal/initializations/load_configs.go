package initializations

import (
	"booking_movie_ticket/global"
	"fmt"

	"github.com/spf13/viper"
)

func loadConfig() {
	viper := viper.New()

	// file name
	viper.SetConfigName("local")
	viper.SetConfigType("yaml")
	// path to config
	viper.AddConfigPath("configs/")
	// read configuration
	err := viper.ReadInConfig()
	if err != nil {
		panic(fmt.Errorf("failed to read configuration (loadConfig): %w", err))
	}

	// structure config
	if err := viper.Unmarshal(&global.Config); err != nil {
		fmt.Printf("unable to decode configuration (loadConfig): %v", err)
	}
}
