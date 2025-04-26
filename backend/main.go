package main

import (
	"fmt"
	"net/http"
	"os"
)

func healthHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Backend Service is healthy! (Environment: %s)", os.Getenv("ENV"))
}

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080" // default port
	}

	http.HandleFunc("/api/health", healthHandler)

	fmt.Println("Backend server starting on port", port)
	err := http.ListenAndServe(":" + port, nil)
	if err != nil {
		panic(err)
	}
}
