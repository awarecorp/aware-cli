#!/bin/bash

set -e

INSTALL_DIR="${INSTALL_DIR:-/usr/local/bin}"
BINARY_NAME="aware"
REPO="awarecorp/aware-cli"
VERSION="${VERSION:-latest}"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}Installing aware...${NC}"

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

case $ARCH in
    x86_64) ARCH="amd64" ;;
    arm64|aarch64) ARCH="arm64" ;;
    *) 
        echo -e "${RED}Error: Unsupported architecture: $ARCH${NC}"
        exit 1
        ;;
esac

case $OS in
    darwin|linux) ;;
    *)
        echo -e "${RED}Error: Unsupported OS: $OS${NC}"
        exit 1
        ;;
esac

# Determine download path (from GitHub Releases)
if [ "$VERSION" = "latest" ]; then
    DOWNLOAD_URL="https://github.com/${REPO}/releases/latest/download/aware-${OS}-${ARCH}"
else
    DOWNLOAD_URL="https://github.com/${REPO}/releases/download/${VERSION}/aware-${OS}-${ARCH}"
fi

echo "Downloading aware..."
echo "From: $DOWNLOAD_URL"

TMP_FILE="/tmp/${BINARY_NAME}-$$"
if command -v curl > /dev/null 2>&1; then
    if ! curl -fsSL "$DOWNLOAD_URL" -o "$TMP_FILE"; then
        echo -e "${RED}Error: Download failed${NC}"
        echo -e "${YELLOW}URL: $DOWNLOAD_URL${NC}"
        exit 1
    fi
elif command -v wget > /dev/null 2>&1; then
    if ! wget -q "$DOWNLOAD_URL" -O "$TMP_FILE"; then
        echo -e "${RED}Error: Download failed${NC}"
        echo -e "${YELLOW}URL: $DOWNLOAD_URL${NC}"
        exit 1
    fi
else
    echo -e "${RED}Error: curl or wget is required${NC}"
    exit 1
fi

if [ ! -f "$TMP_FILE" ] || [ ! -s "$TMP_FILE" ]; then
    echo -e "${RED}Error: Downloaded file is empty or missing${NC}"
    exit 1
fi

chmod +x "$TMP_FILE"

if [ -w "$INSTALL_DIR" ]; then
    mv "$TMP_FILE" "$INSTALL_DIR/$BINARY_NAME"
else
    echo -e "${YELLOW}Installing to $INSTALL_DIR requires sudo...${NC}"
    sudo mv "$TMP_FILE" "$INSTALL_DIR/$BINARY_NAME"
fi

echo -e "${GREEN}✓ aware installed successfully!${NC}"
echo ""
echo "Get started with:"
echo "  aware login"
echo "  aware configure"
echo ""
echo "For more commands, run:"
echo "  aware --help"
echo ""
INSTALLED_VERSION=$(aware --version 2>/dev/null || echo 'unknown')
echo "Installed version: $INSTALLED_VERSION"
