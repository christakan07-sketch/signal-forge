# Case Library

## Purpose
This library stores market-intelligence cases in a consistent format so the team can:
- compare similar events
- build a reusable taxonomy
- accumulate evidence
- support future simulation and research work

## Folder structure
- `cases/` -> one folder per event case
- `templates/` -> reusable templates and starter files
- `taxonomy/` -> event types, impact classes, and classification rules

## Standard case contents
Each case should try to include:
- `case.md` -> plain-language overview
- `meta.json` -> structured metadata
- `scout.json`
- `atlas.json`
- `pulse.json`
- `sage.json`
- `shield.json`
- `main-summary.md`

## Minimum metadata goals
- case_id
- event_date
- event_type
- region
- primary_assets
- secondary_assets
- sectors
- themes
- decision_ladder_result
- confidence_band
- evidence_quality
- status

## Status suggestions
- draft
- active
- archived
- superseded

## Immediate use
Use this library first for:
1. storing manually reviewed real cases
2. grouping similar events
3. preparing simulation candidates
