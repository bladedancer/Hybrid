#!/bin/sh

# DB
docker build -t addressbookdb mongo
docker tag addressbookdb:latest bladedancer/addressbookdb
docker push bladedancer/addressbookdb

# Address Book
docker build -t addressbook addressbook
docker tag addressbook:latest bladedancer/addressbook
docker push bladedancer/addressbook

# Address Book CRUD
docker build -t addressbookcrud addressbookcrud
docker tag addressbookcrud:latest bladedancer/addressbookcrud
docker push bladedancer/addressbookcrud