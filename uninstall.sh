#!/bin/bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}⚠️  Uninstalling pinta...${NC}"
echo ""

# Find the pinta binary location
BINARY_PATH=$(which pinta 2>/dev/null || echo "")

if [ -z "$BINARY_PATH" ]; then
    echo -e "${RED}Error: pinta binary not found in PATH${NC}"
    echo "Please specify the location manually:"
    echo "  sudo rm /path/to/pinta"
    exit 1
fi

echo "Found pinta at: $BINARY_PATH"
echo ""

# Remove the binary
echo "Removing pinta binary..."
if [ -w "$(dirname "$BINARY_PATH")" ]; then
    rm "$BINARY_PATH"
    echo -e "${GREEN}✓ Binary removed${NC}"
else
    sudo rm "$BINARY_PATH"
    echo -e "${GREEN}✓ Binary removed (with sudo)${NC}"
fi

echo ""
echo -e "${GREEN}✅ Pinta has been completely uninstalled!${NC}"
echo ""
echo "To reinstall:"
echo "  curl -fsSL https://raw.githubusercontent.com/awarecorp/aware-cli/main/install.sh | sh"
