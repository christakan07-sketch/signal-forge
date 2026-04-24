# Naming Conventions

## Purpose
Define naming rules for all record types so the system stays consistent as it grows.

## General rules
- use lowercase with hyphens
- keep names human-readable
- include date in ISO format where possible
- avoid spaces and special characters
- keep names short enough to be readable but specific enough to be unique

---

## Event ID
Format: `event-YYYY-MM-DD-NNN`

Rules:
- date is event capture date
- NNN is a 3-digit incrementing sequence per day

Examples:
- `event-2026-04-24-001`
- `event-2026-04-24-002`

---

## Case ID
Format: `case-YYYY-MM-DD-NNN-slug`

Rules:
- date matches the linked event capture date
- NNN matches the event sequence
- slug is a short hyphenated topic descriptor

Examples:
- `case-2026-04-24-002-oil-hormuz`
- `case-2026-04-24-005-sec-crypto-pivot`
- `case-2026-04-24-007-btc-etf-flow`

---

## Study ID
Format: `study-case-YYYY-MM-DD-NNN-slug`

Rules:
- append `study-` to the full case ID

Examples:
- `study-case-2026-04-24-002-oil-hormuz`
- `study-case-2026-04-24-005-sec-crypto-pivot`

---

## Evidence ID
Format: `evidence-case-YYYY-MM-DD-NNN-slug`

Rules:
- append `evidence-` to the full case ID

Examples:
- `evidence-case-2026-04-24-002-oil-hormuz`
- `evidence-case-2026-04-24-005-sec-crypto-pivot`

---

## Raw event file
Format: `event-YYYY-MM-DD-NNN.json`

Rules:
- same as event ID

---

## Normalized event file
Format: `normalized-event-YYYY-MM-DD-NNN.json`

Rules:
- prefix `normalized-` to event ID

---

## Case folder
Format: same as case ID

Rules:
- folder lives under `case-library/cases/`

---

## Study file
Format: `study-case-YYYY-MM-DD-NNN-slug.md`

Rules:
- lives under `simulation-framework/studies/`

---

## Evidence file
Format: `evidence-case-YYYY-MM-DD-NNN-slug.md`

Rules:
- lives under `simulation-framework/evidence/`

---

## Snapshot files
### Price snapshot
Format: `symbol-YYYYMMDD-HHMM.json`

### Benchmark snapshot
Format: `benchmark-YYYYMMDD-HHMM.json`

---

## Quick reference table
- event ID        -> `event-YYYY-MM-DD-NNN`
- raw event file   -> `event-YYYY-MM-DD-NNN.json`
- normalized file  -> `normalized-event-YYYY-MM-DD-NNN.json`
- case ID          -> `case-YYYY-MM-DD-NNN-slug`
- case folder      -> `case-library/cases/case-YYYY-MM-DD-NNN-slug/`
- study ID         -> `study-case-YYYY-MM-DD-NNN-slug`
- study file       -> `simulation-framework/studies/study-case-YYYY-MM-DD-NNN-slug.md`
- evidence ID      -> `evidence-case-YYYY-MM-DD-NNN-slug`
- evidence file    -> `simulation-framework/evidence/evidence-case-YYYY-MM-DD-NNN-slug.md`
