package main

import (
	"fmt"
	"net/http"
	"os"
)

func healthHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Backend API Gateway is healthy!")
}

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	http.HandleFunc("/api/health", healthHandler)

	fmt.Println("Backend API Gateway starting on port", port)
	err := http.ListenAndServe(":"+port, nil)
	if err != nil {
		panic(err)
	}
}
