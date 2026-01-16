# DEEP-DIVE RESEARCH PROTOCOL: The Brand Avatar Analysis

## Skill Purpose
This protocol forces a **Deep Psychological Audit** of the target customer before a single word of copy is written. It is designed to prevent "surface-level" marketing by digging into the fears, cultural biases, and secret desires of the 18-30 fashion consumer.

**MANDATORY ENFORCEMENT:**
The agent **MUST** populate this JSON structure completely.
You are **FORBIDDEN** from summarizing or skipping sections.
You **MUST** use this research to inform the `copy-manuscript.md`.

---

## 1. Research Prompt (Execute This Mental Step)

**Goal:** Produce a full Brand Avatar Profile based on the competitor URL and product category.

**Questions to Answer:**

1.  **WHAT KEEPS OUR READER AWAKE AT NIGHT?**
    *   Deep emotional/identity insecurities tied to fashion and self‑image.
    *   Situations where they feel anxiety, FOMO, comparison, or uncertainty.

2.  **FEARS, ANGERS, FRUSTRATIONS, SECRET DESIRES**
    *   What do they fear socially, aesthetically, economically?
    *   What frustrations do they carry about style?
    *   What they want but won’t openly admit?

3.  **CULTURAL TRENDS & BUILT‑IN BIASES**
    *   What macro trends influence them (TikTok aesthetics, social movements, nostalgia waves, sustainability signals)?
    *   What assumptions do they *take as truth* about fashion?
    *   What subcultures are they drawn to or avoid?

4.  **LANGUAGE, JARGON & PSYCHOLOGICAL TRIGGERS**
    *   Vocabulary they use for fashion and identity.
    *   Tone, buzz‑words, and triggers that make them feel *understood* — not just sold to.
    *   What turns them *off* in communication?

5.  **MEDIA, INFLUENCERS, AND DAILY DIGESTION HABITS**
    *   What content platforms, creators, or communities shape their taste?
    *   What format do they absorb most (short scrolls, long essays, moodboard reels)?

6.  **WEB HABITS & SHOPPING ROUTINES**
    *   Typical times, triggers, moods when they browse or window‑shop online.
    *   Patterns of saving vs buying vs comparing.

7.  **UNDERLYING EMOTION & ULTIMATE CRAVING**
    *   The core emotional story of this avatar in *one sentence*.
    *   What are they *really* trying to fix, prove, or feel — beyond the clothes?

---

## 2. Mandatory Output Artifact

Save the result of this analysis to: `context/avatar-profile.json`

```json
{
  "WhatKeepsOurReaderAwake": "...",
  "FearsAngersFrustrationsSecretDesires": "...",
  "CulturalTrendsAndBiases": "...",
  "LanguageAndTriggers": "...",
  "MediaAndInfluencers": "...",
  "WebHabitsAndShoppingRoutines": "...",
  "UnderlyingEmotionAndUltimateCraving": "..."
}
```

## 3. Usage Rule (The "Lock")
In Phase 2 (Copy Drafting), the agent **MUST** cite specific quotes from `context/avatar-profile.json` when writing the copy manuscript.
*   *Example:* "I used the fear of [FearsAngersFrustrationsSecretDesires] to write the Hook for Secret 1."
