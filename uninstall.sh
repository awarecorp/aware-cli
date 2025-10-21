#!/bin/bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}⚠️  Uninstalling aware...${NC}"
echo ""

# Find the aware binary location
AWARE_PATH=$(which aware 2>/dev/null || echo "")

if [ -z "$AWARE_PATH" ]; then
    echo -e "${RED}Error: aware binary not found in PATH${NC}"
    echo "Please specify the location manually:"
    echo "  sudo rm /path/to/aware"
    exit 1
fi

echo "Found aware at: $AWARE_PATH"
echo ""

# Remove the binary
echo "Removing aware binary..."
if [ -w "$(dirname "$AWARE_PATH")" ]; then
    rm "$AWARE_PATH"
    echo -e "${GREEN}✓ Binary removed${NC}"
else
    sudo rm "$AWARE_PATH"
    echo -e "${GREEN}✓ Binary removed (with sudo)${NC}"
fi

echo ""
echo -e "${GREEN}✅ Aware has been completely uninstalled!${NC}"
echo ""
echo "To reinstall:"
echo "  curl -fsSL https://raw.githubusercontent.com/awarecorp/aware-cli/main/install.sh | sh"
