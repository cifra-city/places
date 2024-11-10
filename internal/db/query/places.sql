-- name: GetPlaceByID :one
SELECT * FROM places
WHERE id = $1;

-- name: GetPlaceByUsername :one
SELECT * FROM places
WHERE username = $1;

-- name: FilterByGradeAbove :many
SELECT * FROM places
WHERE grade > $1;

-- name: FilterByGradeBelow :many
SELECT * FROM places
WHERE grade < $1;

-- name: FilterByReviewsNum :many
SELECT * FROM places
WHERE reviews_num > $1;

-- name: FilterByTags :many
SELECT * FROM places
WHERE tags @> $1;

-- name: InsertPlace :one
INSERT INTO places (id, distributor, username, name, title, description, address, grade, reviews_num, tags)
VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
    RETURNING *;

-- name: UpdateGrade :one
UPDATE places
SET grade = $2
WHERE id = $1
    RETURNING *;

-- name: UpdateTags :one
UPDATE places
SET tags = $2
WHERE id = $1
    RETURNING *;

-- name: UpdateReviewsNum :one
UPDATE places
SET reviews_num = $2
WHERE id = $1
    RETURNING *;

-- name: UpdateTitle :one
UPDATE places
SET title = $2
WHERE id = $1
    RETURNING *;

-- name: UpdateDescription :one
UPDATE places
SET description = $2
WHERE id = $1
    RETURNING *;

-- name: UpdateAddress :one
UPDATE places
SET address = $2
WHERE id = $1
    RETURNING *;
