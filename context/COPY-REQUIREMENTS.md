# MANDATORY COPY REQUIREMENTS

> ⚠️ **THIS FILE MUST BE READ BEFORE WRITING ANY SECTION COPY**
> ⚠️ **FAILURE TO FOLLOW THESE RULES = REJECTED OUTPUT**

---

## 🎀 WOMEN'S FASHION/LIFESTYLE FRAMING (CRITICAL)

**This is NOT a tech product. Write for WOMEN buying fashion/lifestyle products.**

| ❌ DON'T Write                | ✅ DO Write                             |
| ----------------------------- | --------------------------------------- |
| "Advanced fabric technology"  | "So soft you won't want to take it off" |
| "Engineered for performance"  | "Designed to make you feel amazing"     |
| "Specifications and features" | "The compliments you'll get"            |
| "Product benefits"            | "How confident you'll feel"             |
| "Technical materials"         | "Luxurious feel against your skin"      |
| "Problem-solution"            | "Finally finding THE piece"             |

**Voice:** Trusted girlfriend sharing a discovery, NOT a salesperson listing features

---

## STEP 1: READ RESEARCH FIRST (MANDATORY)

Before writing ANY section, you MUST:

```
1. Open and READ: context/research-summary.md
2. Identify the specific pain points for this section
3. Identify the specific desires for this section
4. Note the exact language from Voice & Tone
```

**If research-summary.md does not exist, STOP and create it first.**

---

## STEP 2: SECTION-SPECIFIC REQUIREMENTS

### Section 03: Hero

- **MUST USE:** Pain 1, Pain 2, Big Domino headline
- **MUST REFERENCE:** Dream Customer from research
- **IMAGE:** `{{HERO_IMAGE_1}}` from images/product/

### Section 07: Big Domino

- **MUST USE:** Big Domino belief statement (EXACT from research)
- **MUST USE:** Old Belief vs New Belief contrast
- **MUST REFERENCE:** Secret 1 (Vehicle) to explain why old way failed
- **PATTERN INTERRUPTS:** Minimum 3 (Question, Contradiction, Shocking Stat)

### Section 08: Pricing

- **MUST USE:** `{{SINGLE_PRICE}}` = $19 (HARDCODED)
- **MUST USE:** `{{ORDER_BUMP_PRICE}}` = $10 (HARDCODED)
- **MUST INCLUDE:** `checked="checked"` on order bump checkbox
- **IMAGE:** `{{ORDER_BUMP_IMAGE}}` from images/order-bump/

### Section 09: Features

- **MUST USE:** Pain 1, Pain 2, Pain 3, Pain 4 (one per feature)
- **MUST CONNECT:** Each feature SOLVES a specific pain
- **IMAGES:** `{{TESTIMONIAL_IMAGE_6}}` through `{{TESTIMONIAL_IMAGE_10}}`

### Section 11: Comparison

- **MUST USE:** Before/After transformation
- **IMAGES:** `{{COMPARISON_BAD_IMAGE}}`, `{{COMPARISON_GOOD_IMAGE}}`
- **POSITION:** Must appear at 40% scroll (early in page)

### Section 14: Secret 1 (Vehicle)

- **MUST USE:** Secret 1 from research (why other products failed)
- **MUST REFERENCE:** Pain 1, Pain 2
- **IMAGE:** `{{TESTIMONIAL_IMAGE_8}}`
- **PATTERN INTERRUPTS:** Minimum 3

### Section 16: Secret 2 (Internal)

- **MUST USE:** Secret 2 from research (it's not their fault)
- **MUST INCLUDE:** Permission-giving language
- **IMAGE:** `{{TESTIMONIAL_IMAGE_15}}`
- **PATTERN INTERRUPTS:** Minimum 3

### Section 18: Founder Story

- **MUST USE:** ALL 5 Epiphany Bridge elements from research:
  1. Backstory
  2. Struggle
  3. Epiphany moment
  4. Solution
  5. Result
- **IMAGE:** `{{FOUNDER_IMAGE}}` from images/founder/
- **PATTERN INTERRUPTS:** Minimum 4

### Section 20: Secret 3 (External)

- **MUST USE:** Secret 3 from research (external obstacles)
- **IMAGE:** `{{TESTIMONIAL_IMAGE_22}}`
- **PATTERN INTERRUPTS:** Minimum 3

### Section 22: Segment

- **MUST USE:** Dream Customer profile from research
- **MUST INCLUDE:** Reader Callout: "If you're a [segment]..."
- **IMAGE:** `{{TESTIMONIAL_IMAGE_20}}`

### Section 23: FAQ

- **MUST USE:** Objections 1-6 from research (as questions)
- **MUST USE:** Objection answers from research
- **EACH ANSWER:** Must start with pattern interrupt
- **PATTERN INTERRUPTS:** Minimum 6 (one per FAQ)

### Section 24: Final CTA

- **MUST USE:** Time Travel hook ("Imagine X from now...")
- **MUST REFERENCE:** Desire 1, Desire 2
- **MUST INCLUDE:** Guarantee, price, urgency

---

## STEP 3: VALIDATION CHECKLIST

After writing EACH section, verify:

```
[ ] I opened and read research-summary.md
[ ] I used at least 2 SPECIFIC pain points from research
[ ] I used at least 1 SPECIFIC desire from research
[ ] My headline connects to the Big Domino belief
[ ] I used exact language from Voice & Tone section
[ ] This copy is SPECIFIC to this product (not generic)
[ ] I used the correct image variable for this section
[ ] I included the minimum required pattern interrupts
```

**If ANY checkbox is unchecked, REVISE before submitting.**

---

## BANNED PHRASES (WILL BE REJECTED)

Do NOT use these generic phrases:

- "amazing product"
- "life-changing"
- "incredible results"
- "best ever"
- "you won't believe"
- "game changer"
- "revolutionary"
- "transform your life"
- "unlock your potential"
- "take it to the next level"

**ALSO BANNED - Tech/Masculine Framing:**

- "engineered"
- "technology" / "tech"
- "performance"
- "specifications" / "specs"
- "features and benefits"
- "advanced materials"
- "cutting-edge"
- "state-of-the-art"
- "high-performance"
- "optimized"

**USE INSTEAD:** Feel, confidence, compliments, love, obsessed, finally, deserve, flattering, stunning, effortless

---

## IMAGE PLACEMENT REFERENCE

| Section             | Image Variable                                               | Source Folder            |
| ------------------- | ------------------------------------------------------------ | ------------------------ |
| Hero/Gallery        | `{{HERO_IMAGE_1-5}}`                                         | images/product/          |
| Order Bump          | `{{ORDER_BUMP_IMAGE}}`                                       | images/order-bump/       |
| Founder             | `{{FOUNDER_IMAGE}}`                                          | images/founder/          |
| Comparison (Slider) | `{{COMPARISON_IMAGE_BEFORE}}` + `{{COMPARISON_IMAGE_AFTER}}` | images/comparison/       |
| Features            | `{{TESTIMONIAL_IMAGE_6-10}}`                                 | images/testimonials/     |
| Secret 1            | `{{TESTIMONIAL_IMAGE_8}}`                                    | images/testimonials/     |
| Secret 2            | `{{TESTIMONIAL_IMAGE_15}}`                                   | images/testimonials/     |
| Secret 3            | `{{TESTIMONIAL_IMAGE_22}}`                                   | images/testimonials/     |
| Segment             | `{{TESTIMONIAL_IMAGE_20}}`                                   | images/testimonials/     |
| Testimonials 1-5    | `{{TESTIMONIAL_IMAGE_1-5}}`                                  | images/testimonials/     |
| Press Logos         | `{{PRESS_LOGO_1-6}}`                                         | images/universal-assets/ |

---

## ENFORCEMENT

This file will be validated by `tests/validate-copy-requirements.sh`

The script checks:

1. Pain point references exist in copy
2. Desire references exist in copy
3. Big Domino language appears
4. Banned phrases are absent
5. Required image variables are present
6. Minimum pattern interrupts met

**Sections that fail validation will be regenerated.**
