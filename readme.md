#  Udemy Bank Golang Project 
## Drive link :- https://docs.google.com/document/d/1cevTM2nU3cP_p-sTxdX99uJPhR2hKw2ulVHj-T4PpTM/edit?usp=sharing
## Step 1 : Design Db Schema 
```
Go to Dbdiagrams  io Design a Schema 
Schema link :- https://dbdiagram.io/d/Golang_bank_db-6699f5fd8b4bb5230ec4917a
and export postgres SQL 
```

## Step 2 : Setup postgres 
```
docker pull postgres:12-alpine
docker images
docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=ro
ot -e POSTGRES_PASSWORD=secret -d postgres:12-alpine
docker ps
docker exec -it postgres12 psql  -U root
```
## Step 3 : Install  tableplus and connect postgres
```
select now(); 
```

## Step 3 : install golang migrate 
```
brew install golang-migrate
mkdir -p db/migration
migrate create -ext sq
l -dir db/migration -seq init_schema
it creates two up and down file up use for forward change and down use to revert the change
copy db diagram sql in up file and drop commands in down file for revert 

```
## Step 4 : make a make file for fellow developers to setup 
```
make postgres
make createdb
make  dropdb
```

## Step 5: Run migrations to do changes 
```
migrate -path db/migration --database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable"  -verbose up
```

## Step 6: Generate CRUD golang code from SQL 
```
Using Golang GORM library,GORM is slower 
SQLX  library 
SQLC : fast and wasy to use  
```
