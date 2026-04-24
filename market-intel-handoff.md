# Market Intelligence Handoff Format

This document defines the shared handoff contract for:
- scout
- atlas
- pulse
- sage
- shield
- main

## Core principles
- Keep claims evidence-first
- Separate facts from interpretation
- Preserve uncertainty explicitly
- Prefer structured outputs over prose walls
- Escalate instead of pretending certainty

## Shared envelope
Every handoff should include:

```json
{
  "handoff_version": "v1",
  "item_id": "news-2026-04-24-001",
  "created_at": "2026-04-24T11:00:00+07:00",
  "from_agent": "scout",
  "to_agent": "atlas",
  "stage": "news_normalized",
  "status": "ready",
  "priority": "normal",
  "source_count": 2,
  "confidence": 0.62,
  "human_review_required": false,
  "summary": "Short one-paragraph summary of the handoff",
  "facts": [],
  "claims": [],
  "uncertainties": [],
  "attachments": [],
  "next_question": "What should the next agent answer?"
}
```

## Field meanings
- `facts`: verified or directly observed statements from source material
- `claims`: interpreted conclusions from the current agent
- `uncertainties`: what is still ambiguous, missing, or unverified
- `next_question`: the exact decision/question for the next agent

## Stage contracts

### 1) scout -> atlas
**stage:** `news_normalized`

Required fields:
- `source_refs`
- `event_summary`
- `entities`
- `category`
- `novelty`
- `urgency`
- `noise_flag`

Example payload fragment:
```json
{
  "event_summary": "Country X announced a sudden export restriction on copper.",
  "entities": ["Country X", "copper"],
  "category": "macro_supply",
  "novelty": "medium",
  "urgency": "high",
  "noise_flag": false
}
```

### 2) atlas -> pulse
**stage:** `asset_mapping`

Required fields:
- `related_assets`
- `related_sectors`
- `themes`
- `direct_links`
- `indirect_links`
- `relevance_score`

### 3) pulse -> sage
**stage:** `impact_assessed`

Required fields:
- `impact_direction`
- `impact_horizon`
- `confidence`
- `watch_priority`
- `catalyst_or_noise`
- `key_uncertainties`

### 4) sage -> shield
**stage:** `hypothesis_ready`

Required fields:
- `hypothesis`
- `strategy_candidates`
- `assumptions`
- `invalidation_conditions`
- `test_plan`
- `required_data`

### 5) shield -> main
**stage:** `validated`

Required fields:
- `verdict`
- `risk_notes`
- `evidence_gaps`
- `recommended_next_action`
- `approval_level`

Approval levels:
- `ignore`
- `archive`
- `watch`
- `research`
- `simulate`
- `paper_trade_candidate`
- `manual_review_required`

## Writing rules by agent

### scout
- Write compact factual summaries
- Avoid market prediction language
- Mark rumor-quality sources explicitly

### atlas
- Explain why each asset is related
- Separate direct from thematic reach
- Avoid overstating weak links

### pulse
- Be explicit about time horizon
- Distinguish sentiment from expected market effect
- Keep uncertainty visible

### sage
- Frame output as hypotheses, not truths
- Include invalidation conditions every time
- Prefer testable proposals

### shield
- Be conservative
- Prefer no-go over weakly supported go
- Highlight missing evidence before green-lighting anything

### main
- Summarize decisions for the human
- Do not erase uncertainty from upstream work
- Present next step options clearly
