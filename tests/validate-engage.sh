#!/bin/bash
# Validate ENGAGE framework pattern interrupts in a section
# Usage: bash validate-engage.sh sections/07-big-domino.html 3
# Second argument is minimum number of pattern interrupts required

set -e

SECTION_FILE="$1"
MIN_HOOKS="${2:-1}"

if [ -z "$SECTION_FILE" ]; then
  echo "FAIL: No section file specified"
  exit 1
fi

if [ ! -f "$SECTION_FILE" ]; then
  echo "FAIL: Section file not found: $SECTION_FILE"
  exit 1
fi

echo "Validating ENGAGE framework in: $SECTION_FILE"
echo "Minimum pattern interrupts required: $MIN_HOOKS"

# Count different hook types
QUESTION_HOOKS=$(grep -ciE 'what if|how can|why does|have you ever|could it be' "$SECTION_FILE" 2>/dev/null || echo 0)
CONTRADICTION_HOOKS=$(grep -ciE 'everyone says|most people think|you.ve been told|conventional wisdom|they say' "$SECTION_FILE" 2>/dev/null || echo 0)
STAT_HOOKS=$(grep -ciE '[0-9]+%|[0-9,]+ (women|people|customers|users)|studies show|research proves' "$SECTION_FILE" 2>/dev/null || echo 0)
UNEXPECTED_HOOKS=$(grep -ciE 'you don.t need|stop|forget|instead of|the truth is' "$SECTION_FILE" 2>/dev/null || echo 0)
READER_HOOKS=$(grep -ciE 'if you.re reading|you already know|you.ve probably|you might be' "$SECTION_FILE" 2>/dev/null || echo 0)
CONFESSION_HOOKS=$(grep -ciE 'here.s what|nobody talks about|the secret|what .* won.t tell|the real reason' "$SECTION_FILE" 2>/dev/null || echo 0)
TIME_TRAVEL_HOOKS=$(grep -ciE 'imagine [0-9]+ days|picture yourself|a month from now|in just [0-9]+|tomorrow you could' "$SECTION_FILE" 2>/dev/null || echo 0)
PERMISSION_HOOKS=$(grep -ciE 'stop .*, start|it.s okay to|you have permission|give yourself' "$SECTION_FILE" 2>/dev/null || echo 0)

TOTAL_HOOKS=$((QUESTION_HOOKS + CONTRADICTION_HOOKS + STAT_HOOKS + UNEXPECTED_HOOKS + READER_HOOKS + CONFESSION_HOOKS + TIME_TRAVEL_HOOKS + PERMISSION_HOOKS))

echo ""
echo "Pattern Interrupts Found:"
echo "  Question Hooks (What if...): $QUESTION_HOOKS"
echo "  Contradiction Hooks (Everyone says...): $CONTRADICTION_HOOKS"
echo "  Shocking Stat Hooks (97%...): $STAT_HOOKS"
echo "  Unexpected Claim Hooks (You don't need...): $UNEXPECTED_HOOKS"
echo "  Reader Callout Hooks (If you're reading...): $READER_HOOKS"
echo "  Confession Hooks (Here's what...): $CONFESSION_HOOKS"
echo "  Time Travel Hooks (Imagine 30 days...): $TIME_TRAVEL_HOOKS"
echo "  Permission Hooks (Stop..., Start...): $PERMISSION_HOOKS"
echo "  ─────────────────────────────────"
echo "  TOTAL: $TOTAL_HOOKS"

if [ "$TOTAL_HOOKS" -lt "$MIN_HOOKS" ]; then
  echo ""
  echo "FAIL: Not enough pattern interrupts"
  echo "Found: $TOTAL_HOOKS, Required: $MIN_HOOKS"
  echo ""
  echo "FIX: Add more pattern interrupts using these techniques:"
  echo "  - Question: 'What if [opposite of belief]?'"
  echo "  - Contradiction: 'Everyone says X. We say Y.'"
  echo "  - Shocking Stat: '97% of women report...'"
  echo "  - Unexpected: 'You don't need [hard]. You need [easy].'"
  echo "  - Reader Callout: 'If you're reading this, you already know...'"
  echo "  - Confession: 'Here's what they won't tell you...'"
  echo "  - Time Travel: 'Imagine 30 days from now...'"
  echo "  - Permission: 'Stop [X]. Start [Y].'"
  exit 1
fi

# Check for variety (at least 2 different hook types if more than 3 hooks required)
if [ "$MIN_HOOKS" -ge 3 ]; then
  TYPES_USED=0
  [ "$QUESTION_HOOKS" -gt 0 ] && ((TYPES_USED++)) || true
  [ "$CONTRADICTION_HOOKS" -gt 0 ] && ((TYPES_USED++)) || true
  [ "$STAT_HOOKS" -gt 0 ] && ((TYPES_USED++)) || true
  [ "$UNEXPECTED_HOOKS" -gt 0 ] && ((TYPES_USED++)) || true
  [ "$READER_HOOKS" -gt 0 ] && ((TYPES_USED++)) || true
  [ "$CONFESSION_HOOKS" -gt 0 ] && ((TYPES_USED++)) || true
  [ "$TIME_TRAVEL_HOOKS" -gt 0 ] && ((TYPES_USED++)) || true
  [ "$PERMISSION_HOOKS" -gt 0 ] && ((TYPES_USED++)) || true

  if [ "$TYPES_USED" -lt 2 ]; then
    echo ""
    echo "WARNING: Low hook variety - only $TYPES_USED type(s) used"
    echo "Consider adding different hook types for more engagement"
  else
    echo "✓ Hook variety: $TYPES_USED different types used"
  fi
fi

echo ""
echo "PASS: ENGAGE framework validated ✓"
exit 0
