package service

import (
	"context"
	"places/internal/config"

	"github.com/go-chi/chi"
)

func Run(ctx context.Context, cfg config.Config) {
	r := chi.NewRouter()

	r.Route("/places", func(r chi.Router) {
		//TODO: Add routes
	})
}
