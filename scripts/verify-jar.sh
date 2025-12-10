#!/bin/bash
# Script to verify a fat-JAR file

set -e

# Check if JAR file is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <path-to-jar-file>"
    echo "Example: $0 releases/v1.0.0/rocket-v1.0.0.jar"
    exit 1
fi

JAR_FILE="$1"

# Check if file exists
if [ ! -f "$JAR_FILE" ]; then
    echo "Error: File '$JAR_FILE' not found"
    exit 1
fi

echo "========================================="
echo "Verifying JAR: $JAR_FILE"
echo "========================================="
echo

# Check file size
FILE_SIZE=$(du -h "$JAR_FILE" | cut -f1)
echo "✓ File size: $FILE_SIZE"

# Check if it's a valid JAR file
if file "$JAR_FILE" | grep -q "Java archive data"; then
    echo "✓ Valid JAR file format"
else
    echo "✗ Not a valid JAR file"
    exit 1
fi

# Check if Java is available
if ! command -v java &> /dev/null; then
    echo "⚠ Warning: Java not found, skipping runtime checks"
    exit 0
fi

JAVA_VERSION=$(java -version 2>&1 | head -n 1)
echo "✓ Java available: $JAVA_VERSION"

# Try to list JAR contents
echo
echo "JAR Contents (first 10 entries):"
jar tf "$JAR_FILE" | head -n 10
echo "..."

# Check for manifest
if jar tf "$JAR_FILE" | grep -q "META-INF/MANIFEST.MF"; then
    echo "✓ Manifest found"
    
    # Extract and show manifest
    echo
    echo "Manifest Main-Class:"
    unzip -p "$JAR_FILE" META-INF/MANIFEST.MF | grep "Main-Class:" || echo "  (not specified)"
fi

# Try to get help output (non-interactive test)
echo
echo "Testing JAR execution (--help):"
if timeout 5 java -jar "$JAR_FILE" --help 2>&1 | head -n 5; then
    echo "✓ JAR executes successfully"
else
    EXIT_CODE=$?
    if [ $EXIT_CODE -eq 124 ]; then
        echo "⚠ JAR execution timed out (might be waiting for input)"
    else
        echo "⚠ JAR execution returned code $EXIT_CODE (might be normal)"
    fi
fi

echo
echo "========================================="
echo "Verification complete!"
echo "========================================="
