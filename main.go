package main

import (
	"fmt"
	"os"

	"github.com/gin-gonic/gin"
)

func getWebServerPort() string {
	port := os.Getenv("PORT")

	if len(port) == 0 {
		port = "80"
	}
	return fmt.Sprintf(":%s", port)
}

func main() {
	PORT := getWebServerPort()
	r := gin.Default()

	r.GET("/", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"name": "foo-service",
		})
	})

	r.GET("/version", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"version": 1.0,
		})
	})
	r.Run(PORT) // listen and serve on 0.0.0.0:8080 (for windows "localhost:8080")
}
