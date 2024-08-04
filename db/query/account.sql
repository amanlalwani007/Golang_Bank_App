-- name: CreateAccount :one
INSERT INTO account (
          owner,
          balance,
          currency
) VALUES (
  $1, $2, $3
)
RETURNING *;

-- name: GetAccount :one
select * from account where id = $1 LIMIT 1;

-- name: ListAccount :many
select * from account order by id LIMIT $1 OFFSET $2;

-- name: UpdateAccount :batchexec
UPDATE account
SET balance = $2
WHERE id = $1
RETURNING *;


-- name: DeleteAccount :batchexec
DELETE FROM account
WHERE id = $1;
