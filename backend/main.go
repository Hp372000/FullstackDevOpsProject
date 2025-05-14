package main

import (
	"fmt"
	"log"
	"net/http"
	"net/http/httputil"
	"net/url"
	"os"
)

func healthHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Backend API Gateway is healthy!")
}

// NEW: generic reverse proxy
func proxyHandler(targetHost string, stripPrefix string) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		target, err := url.Parse(targetHost)
		if err != nil {
			http.Error(w, "Invalid target host", http.StatusInternalServerError)
			return
		}

		// Properly strip the prefix
		prefixLen := len(stripPrefix)
		if len(r.URL.Path) >= prefixLen {
			r.URL.Path = r.URL.Path[prefixLen:]
			if !startsWithSlash(r.URL.Path) {
				r.URL.Path = "/" + r.URL.Path
			}
		}

		proxy := httputil.NewSingleHostReverseProxy(target)
		r.Host = target.Host
		proxy.ServeHTTP(w, r)
	}
}

func startsWithSlash(s string) bool {
	return len(s) > 0 && s[0] == '/'
}


func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	http.HandleFunc("/api/health", healthHandler)
	http.HandleFunc("/api/auth/", proxyHandler("http://auth:8081", "/api"))
	http.HandleFunc("/api/payment/", proxyHandler("http://payments:8082", "/api"))

	log.Printf("Backend API Gateway starting on port %s", port)
	err := http.ListenAndServe(":"+port, nil)
	if err != nil {
		panic(err)
	}
}


