#!/bin/bash
# Validate product.config
# Ensures all placeholders are filled and pricing is correct

set -e

CONFIG_FILE="product.config"

if [ ! -f "$CONFIG_FILE" ]; then
  echo "FAIL: product.config not found"
  echo "FIX: Ensure product.config exists in current directory"
  exit 1
fi

# Source the config to check values
source "$CONFIG_FILE"

# Check for remaining placeholders
PLACEHOLDER_COUNT=$(grep -c '\[PLACEHOLDER\]' "$CONFIG_FILE" 2>/dev/null || echo 0)
if [ "$PLACEHOLDER_COUNT" -gt 0 ]; then
  echo "FAIL: $PLACEHOLDER_COUNT [PLACEHOLDER] tags remain in config"
  echo "FIX: Fill all placeholders with values from Brand Avatar research"
  grep '\[PLACEHOLDER\]' "$CONFIG_FILE"
  exit 1
fi
echo "✓ No [PLACEHOLDER] tags remain"

# Validate pricing
if [ "$SINGLE_PRICE" != "19" ]; then
  echo "FAIL: SINGLE_PRICE should be 19, found: $SINGLE_PRICE"
  echo "FIX: Set SINGLE_PRICE=\"19\" in product.config"
  exit 1
fi
echo "✓ SINGLE_PRICE = 19"

if [ "$ORDER_BUMP_PRICE" != "10" ]; then
  echo "FAIL: ORDER_BUMP_PRICE should be 10, found: $ORDER_BUMP_PRICE"
  echo "FIX: Set ORDER_BUMP_PRICE=\"10\" in product.config"
  exit 1
fi
echo "✓ ORDER_BUMP_PRICE = 10"

if [ "$ORDER_BUMP_PRECHECKED" != "true" ]; then
  echo "FAIL: ORDER_BUMP_PRECHECKED should be true, found: $ORDER_BUMP_PRECHECKED"
  echo "FIX: Set ORDER_BUMP_PRECHECKED=\"true\" in product.config"
  exit 1
fi
echo "✓ ORDER_BUMP_PRECHECKED = true"

# Check required variables exist
REQUIRED_VARS=(
  "BRAND_NAME"
  "PRODUCT_NAME"
  "PRODUCT_HANDLE"
  "BIG_DOMINO_HEADLINE"
  "SECRET_1_HEADLINE"
  "SECRET_2_HEADLINE"
  "SECRET_3_HEADLINE"
  "FOUNDER_EPIPHANY"
  "HEADLINE_MAIN"
  "SUBHEADLINE"
)

for var in "${REQUIRED_VARS[@]}"; do
  value=$(eval echo \$$var)
  if [ -z "$value" ]; then
    echo "FAIL: Required variable $var is empty"
    echo "FIX: Set $var in product.config from Brand Avatar research"
    exit 1
  fi
done
echo "✓ All required variables have values"

# Count total variables
TOTAL_VARS=$(grep -c '^[A-Z]' "$CONFIG_FILE" 2>/dev/null || echo 0)
if [ "$TOTAL_VARS" -lt 50 ]; then
  echo "WARNING: Only $TOTAL_VARS variables found, expected 80+"
  echo "Some sections may have missing content"
fi
echo "✓ Total variables: $TOTAL_VARS"

echo ""
echo "PASS: product.config validated ✓"
exit 0
