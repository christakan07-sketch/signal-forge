# Market Intelligence — Usage Guide

## What this is
A step-by-step guide for using the market intelligence research system.
Use this when you have one new headline or event and want to turn it into structured research output.

---

## Before you start
You need:
- one headline or event
- source name
- timestamp

Optional but helpful:
- brief note on why it might matter

---

## Step 1: Capture headline
- open `intake-prototype/templates/headline-input.md` or use your own notes
- write the raw headline
- write the source
- write the timestamp
- assign a source tier:
  - official
  - top-tier-reporting
  - structured-feed
  - web-aggregation
  - social

---

## Step 2: Run automation stub
- run `intake-prototype/create_event_stub.ps1` with:
  - EventId
  - Headline
  - Source
  - Timestamp
  - SourceTier
  - EventType (if known, otherwise leave empty)
  - EventFamily (if known, otherwise leave empty)
  - CaseId (optional)

This creates:
- raw event file
- normalized event file
- case stub
- study stub
- evidence stub

---

## Step 3: Normalize the event
- open the normalized event file
- fill in:
  - normalized_summary
  - event_type
  - event_family
  - region
  - primary_entities
  - direct_assets
  - secondary_assets
  - novelty
  - urgency
  - noise_flag

---

## Step 4: Classify taxonomy
- open `case-library/taxonomy/event-dimensions.md`
- assign:
  - event_family
  - first_order_impact_path
  - second_order_impact_path
  - persistence_profile
  - validation_method
  - failure_mode

---

## Step 5: Run Scout
- Scout summarizes and normalizes
- writes the scout handoff
- saves to `scout.json` inside the case folder

---

## Step 6: Run Atlas
- Atlas maps assets and sectors
- writes the atlas handoff
- saves to `atlas.json` inside the case folder

---

## Step 7: Run Pulse
- Pulse scores impact and confidence
- writes the pulse handoff
- saves to `pulse.json` inside the case folder

---

## Step 8: Decide fast-lane or slow-lane
### Fast-lane
If:
- low relevance
- low confidence
- no meaningful research question

Action:
- archive or watch

### Slow-lane
If:
- medium/high relevance
- real research question worth testing
- non-trivial uncertainty

Action:
- send to Sage

---

## Step 9: Run Sage
- Sage writes a hypothesis
- assigns a study type
- writes assumptions and invalidation conditions
- saves to `sage.json` inside the case folder

---

## Step 10: Run Shield
- Shield challenges the hypothesis
- lists evidence gaps and risk
- decides verdict
- saves to `shield.json` inside the case folder

---

## Step 11: Write Main summary
- Main summarizes for the human:
  - what happened
  - why it matters
  - what the team thinks
  - what the next step is
- saves to `main-summary.md` inside the case folder

---

## Step 12: Record final decision
- choose a decision ladder result:
  - Ignore
  - Archive
  - Watch
  - Research
  - Simulate
  - Paper Trade Candidate
  - Manual Review Required
- record it in `meta.json`

---

## Step 13: Create study and evidence
- open the study stub
- choose a study type:
  - persistence
  - follow-through
  - false-positive
  - cross-asset confirmation
- open the evidence stub
- define what evidence must be collected

---

## Step 14: Collect evidence
- collect window snapshots
- record confirmations and contradictions
- note missing evidence
- update the evidence sheet

---

## Step 15: Close or escalate
If evidence supports the thesis:
- escalate to deeper study or simulation

If evidence contradicts:
- record lessons
- archive with the reason why it failed

---

## Quick reference
1. capture headline
2. run automation stub
3. normalize event
4. classify taxonomy
5. scout
6. atlas
7. pulse
8. fast-lane or slow-lane
9. sage
10. shield
11. main summary
12. record final decision
13. create study and evidence
14. collect evidence
15. close or escalate
