package db

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/mattn/go-sqlite3"
)

type Game struct {
	Id     int
	Code   string
	Solved int
}

var database *sql.DB

func init() {
	db, err := sql.Open("sqlite3", "./mastermind.db")
	if err != nil {
		log.Fatal(err)
	}
	database = db
	seed()

}
func seed() {
	_, err := database.Exec("create table games(id int, code text,solved int)")
	if err != nil {
		fmt.Println(err)
	}
	_, err = database.Exec("insert into games values(1,'1,2,3,4',1)")
	if err != nil {
		fmt.Println(err)
	}
}
func QueryGames() {
	rows, err := database.Query("select * from games")
	if err != nil {
		fmt.Println(err)
	}
	defer rows.Close()
	var game Game
	for rows.Next() {
		rows.Scan(&game.Id, &game.Code, &game.Solved)
		fmt.Println(game)
	}
	if err = rows.Err(); err != nil {
		fmt.Println(err)
	}
}
