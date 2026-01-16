# Brunson Protocol v2.0 - Template Instructions

> **READ THIS FILE** when using this template with Claude or Antigravity skills.

## File Architecture

| HTML File                   | Content             | Variables               |
| --------------------------- | ------------------- | ----------------------- |
| `08-multirow.html`          | 4 Micro Features    | `FEATURE_`, `MULTIROW_` |
| `11-image-with-text-1.html` | Founder Story       | `FOUNDER_`              |
| `12-image-with-text-2.html` | Secret 1 (Vehicle)  | `SECRET_..._1`          |
| `13-image-with-text-3.html` | Secret 2 (Internal) | `SECRET_..._2`          |
| `13b-secret-3.html`         | Secret 3 (External) | `SECRET_..._3`          |

## Psychological Flow

```
Founder Story (11) → Earns Trust
Secret 1 (12) → Fixes "It won't work"
Secret 2 (13) → Fixes "I can't do it"
Secret 3 (13b) → Fixes "Too expensive"
FAQ (14) → Cleanup objections
```

## CRITICAL RULES

### 1. No Framework Labels

NEVER write "The Backstory:", "THE EPIPHANY:", "The Result:" in copy.
The framework guides THINKING, not WRITING.

### 2. No Placeholder Bugs

- `$00` → Use real price like `$600`
- `XX months` → Use real number
- `[amount]` → Fill with actual data

### 3. Variable Separation

- Micro Grid: `MULTIROW_IMAGE_1..4`
- Secrets: `SECRET_IMAGE_1..3`
- Never use `FEATURE_IMAGE` for secrets

### 4. Config Order

Place at TOP of product.config:

- All `FOUNDER_` variables
- All `SLIDESHOW_` variables
- All `CTA_` variables

### 5. Comparison Optional

If `images/comparison/` is empty:

- Set `COMPARISON_SECTION_VISIBLE=false`
- Do NOT block the build

## Founder Story Variables

```
FOUNDER_SECTION_HEADING
FOUNDER_BACKSTORY
FOUNDER_WALL
FOUNDER_EPIPHANY
FOUNDER_PLAN
FOUNDER_TRANSFORMATION
FOUNDER_INVITATION
FOUNDER_IMAGE
```

## Secret Variables (per secret)

```
SECRET_HEADLINE_X     (Eyebrow caption)
SECRET_HEADING_X      (Main H2 title)
SECRET_PARAGRAPH_X    (First paragraph)
SECRET_PARAGRAPH_X_2  (Second paragraph)
SECRET_IMAGE_X
SECRET_BENEFIT_TEXT   (Secret 3 only)
```

## Build Command

```bash
bash build.sh
```

Concatenates all `sections/*.html` alphabetically → `index.html`
