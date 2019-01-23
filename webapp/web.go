package main

import (
	"net/http"

	"github.com/labstack/echo"
)

//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==
// Routes
//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==

// Test Route
func TestRoute(c echo.Context) error {
	return c.String(http.StatusOK, "heyo")
}

//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==
// Main
//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==

func main() {
	e := echo.New()
	e.GET("/", TestRoute)
	e.Logger.Fatal(e.Start(":9000"))
}
