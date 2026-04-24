# Market Intelligence Research OS — System Overview

## What this is
A structured system that turns real-world events into case-library records, research studies, evidence sheets, and validated research output — powered by a multi-agent team and a repeatable intake-to-analysis workflow.

---

## Team layer
### Agents
- main -> Chief Orchestrator
- scout -> News Hunter
- atlas -> Asset Mapper
- pulse -> Impact Analyst
- sage -> Strategy Researcher
- shield -> Validator / Risk Officer

### Model assignment
- scout -> local (.36 / qwen3)
- atlas -> local (.36 / qwen3)
- pulse -> local / deep lane
- sage -> local deep lane
- shield -> cloud
- main -> cloud

### Shared files
- `market-intel-team.md`
- `market-intel-policies.md`
- `market-intel-handoff.md`
- `handoff-template.json`

---

## Handoff layer
### Format
Every handoff uses a shared envelope with fields like:
- from_agent / to_agent
- stage
- facts / claims / uncertainties
- next_question

### Stages
- scout -> atlas = `news_normalized`
- atlas -> pulse = `asset_mapping`
- pulse -> sage = `impact_assessed`
- sage -> shield = `hypothesis_ready`
- shield -> main = `validated`

---

## Intake layer
### Flow
1. headline capture
2. event normalization
3. case creation
4. taxonomy classification
5. study suggestion
6. evidence stub generation

### Files
- `intake-prototype/README.md`
- `intake-prototype/source-intake-flow.md`
- `intake-prototype/templates/headline-input.md`
- `intake-prototype/templates/normalized-event.json`
- `intake-prototype/templates/intake-checklist.md`
- `intake-prototype/AUTOMATION-STUB-README.md`

### Automation
- `intake-prototype/create_event_stub.ps1`
  Creates raw event, normalized event, case, study stub, evidence stub

---

## Storage layer
### Record types
- raw_events
- normalized_events
- cases
- studies
- evidence
- benchmark_snapshots
- price_snapshots

### Folders
- `raw-events/`
- `normalized-events/`
- `case-library/cases/`
- `simulation-framework/studies/`
- `simulation-framework/evidence/`
- `snapshots/prices/`
- `snapshots/benchmarks/`

### Key files
- `storage-schema.md`
- `storage-layout.md`
- `record-definitions.md`

---

## Case library layer
### Folders
- `case-library/cases/`
- `case-library/templates/`
- `case-library/taxonomy/`

### Key files
- `case-library/README.md`
- `case-library/templates/case.md`
- `case-library/templates/meta.json`
- `case-library/templates/checklist.md`

### Existing cases
- case-2026-04-24-001-synthetic-copper
- case-2026-04-24-002-real-oil-hormuz
- case-2026-04-24-003-real-ecb-hold-rates
- case-2026-04-24-004-real-bitcoin-etf-surge
- case-2026-04-24-005-real-sec-crypto-pivot
- case-2026-04-24-007-btc-etf-flow (stub)

---

## Taxonomy layer
### Key files
- `case-library/taxonomy/event-types.md`
- `case-library/taxonomy/decision-ladder.md`
- `case-library/taxonomy/event-dimensions.md`
- `case-library/taxonomy/case-mapping.md`
- `case-library/taxonomy/playbook-notes.md`

### Event dimensions
- event family
- first-order impact path
- second-order impact path
- persistence profile
- validation method
- failure mode

---

## Simulation framework
### Folders
- `simulation-framework/templates/`
- `simulation-framework/studies/`
- `simulation-framework/evidence/`

### Key files
- `simulation-framework/README.md`
- `simulation-framework/templates/simulation-template.md`
- `simulation-framework/templates/persistence-study-template.md`
- `simulation-framework/templates/follow-through-study-template.md`
- `simulation-framework/templates/false-positive-template.md`
- `simulation-framework/templates/cross-asset-confirmation-template.md`
- `simulation-framework/evidence/templates/evidence-sheet-template.md`
- `simulation-framework/evidence/templates/window-snapshot-template.md`
- `simulation-framework/naming-conventions.md`

### Existing studies
- study-2026-04-24-001-sec-crypto-pivot-follow-through

### Existing evidence
- evidence-2026-04-24-001-sec-crypto-pivot

---

## Data and source layer
### Key files
- `simulation-framework/data-spec.md`
- `simulation-framework/data-collection-template.md`
- `simulation-framework/asset-benchmark-map.md`
- `simulation-framework/studies/study-input-spec-map.md`
- `simulation-framework/source-architecture.md`
- `simulation-framework/source-map.md`
- `simulation-framework/source-priority.md`
- `simulation-framework/starter-stack.md`

---

## Workflow and operator layer
### Key files
- `market-intel-workflow.md`
- `market-intel-routing-rules.md`
- `market-intel-operator-checklist.md`
- `market-intel-runbook.md`

---

## End-to-end flow
1. headline captured
2. raw event stored
3. normalized event created
4. case folder created
5. taxonomy assigned
6. handoff moves through scout -> atlas -> pulse -> sage -> shield -> main
7. study created
8. evidence collected
9. decision ladder result recorded
10. next action decided

---

## Design principles
1. Evidence first
2. Automate structure before judgment
3. Keep cases separated from studies
4. Keep studies separated from evidence
5. Always define a benchmark
6. Always note failure modes
7. Prefer watch/simulate over premature execution
