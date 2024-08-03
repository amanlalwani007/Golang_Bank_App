postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=ro
ot -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=root --owner=root simple_bank

migrateup:
	migrate -path db/migration --database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable"  -verbose up

migratedown:
	migrate -path db/migration --database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable"  -verbose down

sqlc:
	sqlc generate

dropdb: 
	docker exec -it postgres12 dropdb simple_bank

.PHONY: 
	postgres createdb dropdb migrateup migratedown sqlc

	