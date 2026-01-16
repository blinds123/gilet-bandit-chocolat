---
name: brunson-protocol
description: Universal landing page generator using Russell Brunson frameworks (Big Domino, 3 Secrets, Epiphany Bridge), ENGAGE copywriting. Generates fully deployed landing pages from competitor analysis.
version: 2.0
---

# Brunson-Protocol Landing Page Generator v2.0

## When This Skill Activates

This skill activates when the user requests:

- "Build a landing page from [competitor URL]"
- "Create a brunson-protocol page"
- "Generate a sales page using Russell Brunson frameworks"

## CRITICAL: First Action (Self-Healing Injection)

**IMMEDIATELY after cloning/creating project, inject the corrected section files:**

```bash
cp resources/sections/*.html sections/
cp build.sh .
```

This ensures the correct file structure (11, 12, 13, 13b) regardless of template version.

## Required Inputs

Before starting, verify the user has:

1. **Competitor URL** - Product page to analyze
2. **35+ images** organized in folders:
   - `images/product/` (5+ images) - ALSO USED AS HERO IMAGES
   - `images/testimonials/` (25 images) - Features, Secrets, Testimonials
   - `images/order-bump/` (1+ images) - Order bump product image ONLY
   - `images/founder/` (1 image) - Founder story section ONLY
   - `images/comparison/` (2 images) - **OPTIONAL** (see Comparison Check below)
   - `images/universal-assets/` (trust badges, press logos)

### Comparison Check (NEW in v2.0)

The comparison section (06) requires 2 images. **If missing:**

- Set `COMPARISON_SECTION_VISIBLE=false` in product.config
- OR ask user to provide before/after images
- **DO NOT block the build** - comparison is optional

## File Architecture (v2.0)

**CRITICAL: Section 17 no longer exists. Secret 3 is now 13b.**

| HTML File                   | Content Goal          | Variable Prefix         |
| :-------------------------- | :-------------------- | :---------------------- |
| `08-multirow.html`          | Micro Features (Grid) | `FEATURE_`, `MULTIROW_` |
| `11-image-with-text-1.html` | Founder Story         | `FOUNDER_`              |
| `12-image-with-text-2.html` | Secret 1 (Vehicle)    | `SECRET_..._1`          |
| `13-image-with-text-3.html` | Secret 2 (Internal)   | `SECRET_..._2`          |
| `13b-secret-3.html`         | Secret 3 (External)   | `SECRET_..._3`          |
| `14-faq.html`               | FAQ (Logistics)       | `FAQ_`                  |

**Psychological Flow:**

```
Founder Story (11) → Earns Trust
Secret 1 (12) → "It won't work" objection
Secret 2 (13) → "I can't do it" objection
Secret 3 (13b) → "Too expensive" objection
FAQ (14) → Cleanup remaining objections
```

## Execution Phases

Execute in order. Do NOT skip phases.

### Phase 0: Pre-Check

- **Inject resources:** `cp resources/sections/*.html sections/`
- Verify images directory exists
- Test competitor URL is accessible
- Create workspace folders: `sections/`, `context/`
- **Comparison Check:** If `images/comparison/` empty, note for config

### Phase 1: Research (CRITICAL)

- Navigate to competitor URL using browser
- Scroll entire page slowly, take screenshots
- Extract and document in `context/research-summary.md`:
  - 5+ Pain Points (exact customer language)
  - 4+ Desires (transformation outcomes)
  - 6+ Objections with answers
  - Big Domino (ONE belief shift)
  - 3 Secrets (Vehicle/Internal/External)
  - Epiphany Bridge (5 story elements)
  - Voice & Tone patterns
  - Dream Customer profile

**STOP and ask user to review research before proceeding.**

### Phase 2: Copy Drafting (THE INTERMEDIATE ARTIFACT)

**CRITICAL RULE:** You are **FORBIDDEN** from writing copy directly into `product.config`.
**REASON:** Configuration files kill creativity. You must write a manuscript first.

1. **Create Manuscript:**
   - Copy template: `cp ~/.gemini/antigravity/skills/brunson-protocol/resources/copy-manuscript.template.md context/copy-manuscript.md`
   - Fill it out completely using `context/research-summary.md` as source.

2. **Self-Correction (The Ralph Loop):**
   - Review your `copy-manuscript.md`.
   - **Check Headlines:** Does every headline use an ENGAGE pattern? (Question, Contradiction, Confession, etc.)
   - **Check Story:** Does the Epiphany Bridge follow the 5-step narrative arc?
   - **Check Secrets:** Do they address Objections (Vehicle/Internal/External)?

3. **Validation:**
   - Only proceed if the manuscript is "Editor Approved" by your own internal critique.

### Phase 3: Configuration (Mapping)

1. **Map Manuscript to Config:**
   - NOW you may open `product.config`.
   - Copy/Paste your polished text from `context/copy-manuscript.md` into the variables.
   - **DO NOT** rewrite or "summarize" while pasting. Move the exact text.

2. **CRITICAL: Place these at TOP of product.config:**
   - All `FOUNDER_` variables
   - All `SLIDESHOW_` variables
   - All `CTA_` variables
3. **HARDCODED VALUES (DO NOT CHANGE):**
   - `SINGLE_PRICE=19`
   - `ORDER_BUMP_PRICE=10`
   - `ORDER_BUMP_PRECHECKED=true`

### Phase 4: Build & Deploy

- Run: `bash build.sh`
- Verify zero unfilled placeholders
- Deploy to Netlify

### Phase 5: Browser Testing

Test in **mobile viewport 375x667**:

- Page loads without errors
- All images load (zero 404s)
- Zero console errors
- Mobile responsive (no horizontal scroll)
- Add to Cart functional
- Order bump is pre-checked

## Russell Brunson Frameworks

### Big Domino

The ONE belief that makes everything else fall into place.

- Format: "The problem isn't X, it's Y"
- If they believe THIS, they buy

### 3 Secrets

1. **Vehicle (Secret 1)** - Why other products failed them
2. **Internal (Secret 2)** - Why it's not their fault
3. **External (Secret 3)** - What external factors held them back

### Epiphany Bridge

Founder story with 5 elements. **DO NOT label these explicitly in copy:**

1. Backstory - Same problem as customer
2. Wall - What they tried that failed
3. Epiphany - The "aha" moment
4. Plan - How product was born
5. Transformation - Result achieved

**CRITICAL:** The framework guides your THINKING, not your WRITING. Never write "The Backstory:" or "THE EPIPHANY:" - let the narrative flow naturally.

## BANNED - AI Placeholder Bugs

**NEVER write these:**

- `$00` or `00 designer` → Use REAL prices like `$600`
- `XX months` or `XX%` → Use REAL numbers from research
- `[amount]` or `[number]` → Fill in with actual data
- `The Backstory:` or `THE EPIPHANY:` → NO framework labels
- `The Result:` or `The Plan:` → Framework is INVISIBLE

## Variable Collision Prevention

**STRICTLY ENFORCE:**

- **Micro Grid (08)** uses `MULTIROW_IMAGE_1..4`
- **Macro Secrets (12, 13, 13b)** use `SECRET_IMAGE_1..3`
- **DO NOT** use generic `FEATURE_IMAGE` for secrets

## ENGAGE Framework (Perry Belcher)

8 pattern interrupt types - use throughout copy:

| Type             | Example                                       |
| ---------------- | --------------------------------------------- |
| Question         | "What if everything you knew was wrong?"      |
| Contradiction    | "Everyone says X. They're wrong."             |
| Shocking Stat    | "97% of women saw results in 30 days"         |
| Unexpected Claim | "You don't need [expected solution]"          |
| Reader Callout   | "If you're reading this, you already know..." |
| Confession       | "Here's what nobody talks about..."           |
| Time Travel      | "Imagine 30 days from now..."                 |
| Permission       | "It's okay to want this for yourself"         |

## Reference Files

- `resources/sections/` - Self-healing HTML sections (11, 12, 13, 13b)
- `references/COPY-REQUIREMENTS.md` - Mandatory copy rules
- `references/research-summary.template.md` - Phase 1 template
