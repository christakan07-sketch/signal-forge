# Signal Forge Outcome Tracking Design

## Purpose
Create a feedback loop so Signal Forge learns from outcomes instead of only generating research outputs.

## Core problem
Current pipeline can produce:
- Research
- Simulate
- Paper Trade Candidate
- Manual Review Required

But it does not yet answer:
- Was the call correct?
- Which hypothesis worked?
- Did sentinel gate too hard or too softly?
- Did shield choose the right ladder step?
- Which assets actually led?
- Over what horizon did the signal work or fail?

## Goal
Turn Signal Forge from a one-way research engine into a learning system.

## Proposed new component
### echo â€” Outcome Tracker
**Role:** compare forecast vs reality after the event window passes.

Recommended model:
- `ollama/qwen3:8b` for simple structured logging
- or `claude-cli/claude-sonnet-4-6` if explanation quality matters

Initial recommendation:
- start with **no separate agent yet**
- define the data model first
- add agent later if manual review becomes too heavy

## Tracking unit
Track outcomes at the **case level**.

Each tracked case should record:
- final decision ladder result
- selected hypothesis
- target assets
- expected direction
- horizon
- invalidation conditions
- actual observed outcome
- accuracy score
- lessons learned

## Minimal schema
```json
{
  "case_id": "case-...",
  "decision_date": "YYYY-MM-DD",
  "decision_ladder_result": "Research/Simulate/Paper Trade Candidate/...",
  "selected_hypothesis": "H1",
  "tracked_assets": ["..."],
  "expected_direction": "bullish/bearish/neutral",
  "expected_horizon": "days/weeks",
  "invalidation_conditions": ["..."],
  "outcome_window": {
    "t_plus_1d": "...",
    "t_plus_3d": "...",
    "t_plus_1w": "..."
  },
  "actual_outcome": {
    "direction": "...",
    "strength": "low/medium/high",
    "did_invalidate": true
  },
  "verdict": "correct/partially_correct/incorrect/unresolved",
  "notes": ["..."]
}
```

## Scoring logic
### correct
- direction right
- main asset expression right
- invalidation not triggered

### partially_correct
- direction right but asset leadership wrong
- move happened but weaker/shorter than expected
- thesis partly worked but risk framing was off

### incorrect
- direction wrong
- invalidation happened quickly
- no follow-through within stated horizon

### unresolved
- insufficient data yet
- horizon not finished

## What to learn from tracking
### For pulse
- was confidence calibrated?
- did high-confidence calls outperform low-confidence ones?

### For sage
- did selected hypothesis actually become the best expression?
- were research priorities the right missing questions?

### For sentinel
- was risk too strict, too loose, or appropriate?
- did kill-switches trigger in useful ways?

### For shield
- was the ladder step correct?
- should Research have been Simulate?
- should Paper Trade Candidate have stayed only Research?

## Suggested file locations
- `simulation-framework/outcomes/`
- one file per case, for example:
  - `simulation-framework/outcomes/case-2026-04-24-009-outcome.json`
  - `simulation-framework/outcomes/case-2026-04-24-005-outcome.json`

## Suggested workflow
1. pipeline produces decision
2. summary / evidence captured
3. after horizon passes, open outcome file
4. compare forecast vs reality
5. record verdict
6. update lessons / threshold notes

## First version
Keep v1 simple:
- manual or semi-manual updates
- no automation dependency yet
- focus on 3 windows:
  - T+1d
  - T+3d
  - T+1w

## Expansion later
When stable, add:
- agent-level scorecards
- confidence calibration charts
- per-domain hit rates (crypto, energy, macro)
- sentinel strictness review
- shield ladder accuracy review

## Recommendation
Do this in 2 steps:
1. create outcome schema + folder structure now
2. start filling outcomes for case-005 and case-009 first

That gives Signal Forge its first true learning loop.
