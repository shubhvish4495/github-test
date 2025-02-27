# PHONY targets (these don't represent files)
.PHONY: all build run lint clean install-lint

# Go parameters
BINARY_NAME=relay-service
BUILD_DIR=bin
GOLANGCI_LINT_URL=github.com/golangci/golangci-lint/cmd/golangci-lint@v1.63.4
SRC=$(shell find . -type f -name '*.go')

# Check if golangci-lint is installed
GOLANGCI_LINT=$(shell command -v golangci-lint 2>/dev/null)


# Default target
all: build

# Build the Go application
build: clean lint $(SRC)
	@echo "+ $@"
	@mkdir -p $(BUILD_DIR)
	@echo "    🔨 Building the binary..."
	@go build -o $(BUILD_DIR)/$(BINARY_NAME) .

# Run the application
run: build
	@echo "🚀 Running the application..."
	@$(BUILD_DIR)/$(BINARY_NAME)

# Install golangci-lint if not installed
install-lint:
	@echo "+ $@"
	@if [ -z "$(GOLANGCI_LINT)" ]; then \
		echo "    ⚙️  Installing golangci-lint..."; \
		go install $(GOLANGCI_LINT_URL); \
	else \
		echo "    ✅ golangci-lint is already installed"; \
	fi

# Run linting only on the current directory (excluding ~/go/pkg/mod)
lint: install-lint
	@echo "+ $@"
	@echo "    🔍 Running linter in current directory only..."
	@golangci-lint run
	@echo "    ✅ Linter passed"

# Clean build artifacts
clean:
	@echo "+ $@"
	@echo "    🗑️  Cleaning up..."
	@rm -rf $(BUILD_DIR)


