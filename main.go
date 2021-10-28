package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	g := gin.New()

	g.GET("/", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"success": true,
			"message": "Application running",
		})
	})

	g.POST("/ping", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{
			"success": true,
			"message": "Pong",
		})
	})

	g.Run()
}
