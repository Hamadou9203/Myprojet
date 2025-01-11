package main
import (
 "net/http"
 "github.com/gin-gonic/gin"
)
func main() {
 r := gin.Default()
 r.GET("/myapp", func(c *gin.Context) {
   c.JSON(http.StatusOK, gin.H{
     "ringover": "is awesome",
}) 
// ajout d'une route healthcheck
r.GET("/healthcheck", func(c *gin.Context) {
  c.JSON(http.StatusOK, gin.H{
    "message": "i'm alive",
    "date": time.Now().UTC().Format(time.RFC3339),
})


})
r.Run() 
}
