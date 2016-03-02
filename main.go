package main

import (
	"fmt"
	"github.com/gorilla/mux"
	"log"
	"net/http"
	"os"
)

func main() {
	// Add time, file name, and line number to log output.
	log.SetFlags(log.LstdFlags | log.Llongfile)

	r := mux.NewRouter()
	// Create a routine page.  Enter a routine name and pick a reminder schedule.
	r.HandleFunc("/", func(rw http.ResponseWriter, req *http.Request) {
		rw.Write([]byte("Hello World!"))
	})
	//
	//r.HandleFunc("/", ProductHandler)

	log.Print(fmt.Sprintf("Starting server on port %s", os.Getenv("PORT")))
	http.ListenAndServe(fmt.Sprintf(":%s", os.Getenv("PORT")), r)
}
