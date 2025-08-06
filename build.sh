#!/bin/bash

# Minecraft Datapack Build Script
# Usage: ./build.sh <target_directory>

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if target directory is provided
if [ $# -eq 0 ]; then
    print_error "No target directory provided!"
    echo "Usage: $0 <target_directory>"
    echo "Example: $0 ~/minecraft/datapacks"
    exit 1
fi

TARGET_DIR="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DATAPACK_NAME="elikopoko"
ZIP_NAME="${DATAPACK_NAME}.zip"
TEMP_BUILD_DIR="${SCRIPT_DIR}/build_temp"

print_info "Starting datapack build process..."
print_info "Source directory: ${SCRIPT_DIR}"
print_info "Target directory: ${TARGET_DIR}"

# Validate that we're in a datapack directory
if [ ! -f "${SCRIPT_DIR}/pack.mcmeta" ]; then
    print_error "pack.mcmeta not found! Are you in the correct datapack directory?"
    exit 1
fi

# Create target directory if it doesn't exist
if [ ! -d "$TARGET_DIR" ]; then
    print_info "Creating target directory: $TARGET_DIR"
    mkdir -p "$TARGET_DIR"
fi

# Remove any existing temp build directory
if [ -d "$TEMP_BUILD_DIR" ]; then
    print_info "Cleaning up previous build..."
    rm -rf "$TEMP_BUILD_DIR"
fi

# Create temporary build directory
print_info "Creating temporary build directory..."
mkdir -p "$TEMP_BUILD_DIR"

# Copy datapack files to temp directory
print_info "Copying datapack files..."
cp -r "${SCRIPT_DIR}/pack.mcmeta" "$TEMP_BUILD_DIR/"
cp -r "${SCRIPT_DIR}/data" "$TEMP_BUILD_DIR/"

# Create the zip file
print_info "Creating zip archive: ${ZIP_NAME}"
cd "$TEMP_BUILD_DIR"
zip -r "${ZIP_NAME}" . -x "*.DS_Store" "*.git*" "build_temp/*" "build.sh"

# Move zip to target directory
print_info "Moving zip file to target directory..."
mv "${ZIP_NAME}" "$TARGET_DIR/"

# Clean up temp directory
print_info "Cleaning up temporary files..."
cd "$SCRIPT_DIR"
rm -rf "$TEMP_BUILD_DIR"

# Verify the file was created successfully
TARGET_FILE="${TARGET_DIR}/${ZIP_NAME}"
if [ -f "$TARGET_FILE" ]; then
    FILE_SIZE=$(ls -lh "$TARGET_FILE" | awk '{print $5}')
    print_success "Datapack successfully built and copied!"
    print_success "Location: ${TARGET_FILE}"
    print_success "Size: ${FILE_SIZE}"
else
    print_error "Failed to create datapack zip file!"
    exit 1
fi

print_info "Build complete! 🎮"
echo ""
echo "To install the datapack:"
echo "1. Copy ${ZIP_NAME} to your Minecraft world's datapacks folder"
echo "2. Or extract it directly into the datapacks folder"
echo "3. Run /reload in-game to load the datapack"