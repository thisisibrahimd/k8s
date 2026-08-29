package main

import (
	"context"
	"log/slog"
	"os"

	cmd "github.com/thisisibrahimd/k8s/cmd/k8s-gen"
)

func main() {
	rootCmd := cmd.NewRootCommand()

	if err := rootCmd.Run(context.Background(), os.Args); err != nil {
		slog.Error("ran into an error", slog.Any("error", err))
		os.Exit(1)
	}
}
