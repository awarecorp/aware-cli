# aware - MCP Observability CLI

aware is a CLI tool that easily adds Aware observability to MCP (Model Context Protocol) servers.

## Installation

### Quick Install
```bash
curl -fsSL https://raw.githubusercontent.com/awarecorp/aware-cli/main/install.sh | sh
```

### Install Specific Version
```bash
curl -fsSL https://raw.githubusercontent.com/awarecorp/aware-cli/main/install.sh | VERSION=v0.1.0 sh
```

### Manual Install

1. Download the binary for your OS from the [Releases page](https://github.com/awarecorp/aware-cli/releases)
2. Make it executable and add to PATH:
```bash
chmod +x aware-*
sudo mv aware-* /usr/local/bin/aware
```

### Uninstall

```bash
aware uninstall
```

This command will:
- Remove the aware binary
- Delete stored data (`~/.aware/`)
- Rollback MCP configurations to their original state

## Usage

### 1. Login
```bash
aware login
```
Enter your API key to authenticate with the server.

### 2. Configure MCP Servers
```bash
# Transform all MCP servers
aware configure

# Transform a specific server only
aware configure slack
```

### 3. Register Project Paths (Optional)
```bash
# Register a specific project
aware paths add .

# Register a parent folder to scan subdirectories automatically
aware paths add --scan ~/projects

# List registered paths
aware paths list
```

### 4. Check Status
```bash
aware status
```

### 5. Update
```bash
aware update
```

## Supported Clients

- Claude Desktop
- Cursor
- Claude Code

## Development

### Local Build
```bash
go mod download
go build -o aware cmd/aware/main.go
./aware --help
```

### Multi-platform Build
```bash
./scripts/build.sh v1.0.0
```

### Deployment
See [docs/RELEASE.md](docs/RELEASE.md) for detailed deployment instructions.

## License

MIT License
