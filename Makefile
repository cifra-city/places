#PROTO_DIR=api/proto
#PROTO_GEN_DIR=internal/api
#GOOGLEAPIS_DIR=internal/pkg/googleapis
#DOCS_DIR=api/docs
#DOCS_FILE=sso.json

DB_URL=postgresql://postgres:postgres@localhost:6666/postgres?sslmode=disable

create-db-image:
	docker run --name cifra-places -p 6666:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -d postgres:12-alpine

generate-sqlc:
	sqlc generate

migrate-up:
	migrate -path internal/db/migration -database $(DB_URL) -verbose up

migrate-down:
	migrate -path internal/db/migration -database $(DB_URL) -verbose down
