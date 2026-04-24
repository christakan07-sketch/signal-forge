# Storage Layout

## Recommended folder layout
- `raw-events/`
- `normalized-events/`
- `case-library/cases/`
- `simulation-framework/studies/`
- `simulation-framework/evidence/`
- `snapshots/prices/`
- `snapshots/benchmarks/`

## Why this layout works
- separates ingestion from interpretation
- keeps cases separate from studies
- keeps evidence separate from hypotheses
- makes future automation easier

## Suggested naming style
### Raw events
- `event-YYYY-MM-DD-001.json`

### Normalized events
- `normalized-event-YYYY-MM-DD-001.json`

### Cases
- `case-YYYY-MM-DD-001-topic/`

### Studies
- `study-YYYY-MM-DD-001-topic.md`

### Evidence
- `evidence-YYYY-MM-DD-001-topic.md`

### Price snapshots
- `symbol-YYYYMMDD-HHMM.csv` or `.json`

### Benchmark snapshots
- `benchmark-YYYYMMDD-HHMM.csv` or `.json`
