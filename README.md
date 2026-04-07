# pinta - MCP Observability CLI

pinta is a CLI tool that easily adds observability to MCP (Model Context Protocol) servers.

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
chmod +x pinta-*
sudo mv pinta-* /usr/local/bin/pinta
```

### Uninstall

```bash
pinta uninstall
```

This command will:
- Remove the pinta binary
- Delete stored data (`~/.pinta/`)
- Rollback MCP configurations to their original state

## Usage

### 1. Login
```bash
pinta login
```
Enter your API key to authenticate with the server.

### 2. Configure MCP Servers
```bash
# Transform all MCP servers
pinta configure

# Transform a specific server only
pinta configure slack
```

### 3. Register Project Paths (Optional)
```bash
# Register a specific project
pinta paths add .

# Register a parent folder to scan subdirectories automatically
pinta paths add --scan ~/projects

# List registered paths
pinta paths list
```

### 4. Check Status
```bash
pinta status
```

### 5. Update
```bash
pinta update
```

## Supported Clients

- Claude Desktop
- Cursor
- Claude Code

## License

MIT License
