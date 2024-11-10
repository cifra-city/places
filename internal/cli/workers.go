package cli

import (
	"context"
	"places/internal/config"
	"places/internal/service"
	"sync"
)

func runServices(ctx context.Context, cfg config.Config, wg *sync.WaitGroup) {
	var (
	// signals indicate the finished initialization of each worker
	)

	run := func(f func()) {
		wg.Add(1)
		go func() {
			f()
			wg.Done()
		}()
	}

	run(func() { service.Run(ctx, cfg) })
}
