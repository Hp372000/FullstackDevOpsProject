package main

import (
	"fmt"
	"net/http"
	"os"
)

func loginHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Auth Service: Login successful")
}

func signupHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Auth Service: Signup successful")
}

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8081"
	}

	http.HandleFunc("/auth/login", loginHandler)
	http.HandleFunc("/auth/signup", signupHandler)

	fmt.Println("Auth service starting on port", port)
	err := http.ListenAndServe(":" + port, nil)
	if err != nil {
		panic(err)
	}
}
