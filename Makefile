DB_URL=postgres://postgres:anhiuemlove33@127.0.0.1:5432/booking_movie_ticket?sslmode=disable

migrateup:
	migrate -path ./sql/migrations -database "$(DB_URL)" -verbose up
migratedown:
	migrate -path ./sql/migrations -database "$(DB_URL)" -verbose down

.PHONY:	migrateup migratedown