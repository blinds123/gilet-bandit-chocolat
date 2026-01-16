#!/bin/bash
# Validate the built index.html

set -e

if [ ! -f "index.html" ]; then
  echo "FAIL: index.html not found"
  echo "FIX: Run ./build.sh to assemble sections"
  exit 1
fi

echo "Validating index.html..."

# Check file size (should be substantial)
SIZE=$(wc -c < "index.html")
if [ "$SIZE" -lt 10000 ]; then
  echo "FAIL: index.html too small ($SIZE bytes)"
  echo "FIX: Ensure all 25 sections are included"
  exit 1
fi
echo "✓ File size: $SIZE bytes"

# Check all 25 sections are included (look for section markers or unique content)
SECTION_COUNT=$(grep -c 'class="' index.html 2>/dev/null || echo 0)
if [ "$SECTION_COUNT" -lt 20 ]; then
  echo "WARNING: May be missing sections (only $SECTION_COUNT class attributes found)"
fi

# Verify basic HTML structure
if ! grep -q '<html' index.html; then
  echo "FAIL: Missing <html> tag"
  exit 1
fi

if ! grep -q '</html>' index.html; then
  echo "FAIL: Missing </html> closing tag"
  exit 1
fi

if ! grep -q '<head' index.html; then
  echo "FAIL: Missing <head> tag"
  exit 1
fi

if ! grep -q '<body' index.html; then
  echo "FAIL: Missing <body> tag"
  exit 1
fi
echo "✓ Basic HTML structure valid"

echo ""
echo "PASS: Build validated ✓"
exit 0
