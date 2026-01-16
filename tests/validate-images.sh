#!/bin/bash
# Validate images are optimized to WebP format

set -e

echo "Validating image optimization..."

# Count remaining JPG/PNG files
JPG_COUNT=$(find images/ -name "*.jpg" -o -name "*.jpeg" 2>/dev/null | wc -l)
PNG_COUNT=$(find images/ -name "*.png" 2>/dev/null | wc -l)

if [ "$JPG_COUNT" -gt 0 ] || [ "$PNG_COUNT" -gt 0 ]; then
  echo "FAIL: Unoptimized images found"
  echo "JPG files: $JPG_COUNT"
  echo "PNG files: $PNG_COUNT"
  echo ""
  echo "FIX: Run python3 optimize_images.py to convert to WebP"
  exit 1
fi
echo "✓ No JPG/PNG files remain"

# Count WebP files
WEBP_COUNT=$(find images/ -name "*.webp" 2>/dev/null | wc -l)
if [ "$WEBP_COUNT" -lt 35 ]; then
  echo "WARNING: Only $WEBP_COUNT WebP images found, expected 35+"
  echo "May be missing required images"
fi
echo "✓ WebP images: $WEBP_COUNT"

# Check for large images (over 150KB)
LARGE_IMAGES=$(find images/ -name "*.webp" -size +150k 2>/dev/null)
if [ -n "$LARGE_IMAGES" ]; then
  echo "WARNING: Some images are over 150KB:"
  echo "$LARGE_IMAGES"
  echo "Consider further compression for faster loading"
fi

# Check required image directories exist
REQUIRED_DIRS=("images/product" "images/testimonials" "images/comparison" "images/founder" "images/order-bump")
for dir in "${REQUIRED_DIRS[@]}"; do
  if [ ! -d "$dir" ]; then
    echo "FAIL: Required directory missing: $dir"
    echo "FIX: Create directory and add images"
    exit 1
  fi
done
echo "✓ All required image directories exist"

echo ""
echo "PASS: Images validated ✓"
exit 0
