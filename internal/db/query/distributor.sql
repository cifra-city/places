-- name: GetDistributorByID :one
SELECT * FROM distributor
WHERE id = $1 LIMIT 1;

-- name: AddMember :one
UPDATE distributor
SET member = array_append(member, $2)
WHERE id = $1
    RETURNING *;

-- name: CreateDistributor :one
INSERT INTO distributor (id, name, member, owner)
VALUES ($1, $2, $3, $4)
    RETURNING *;
