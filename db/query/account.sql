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

-- name: ListAccount :one
select * from account order by id LIMIT $1 OFFSET $2;
