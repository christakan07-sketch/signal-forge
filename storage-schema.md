# Storage Schema

## Purpose
Define how the research system should store raw events, normalized events, cases, studies, and evidence in a way that can grow from document-first prototyping into a more structured system later.

## Main record groups
1. raw_events
2. normalized_events
3. cases
4. studies
5. evidence
6. benchmark_snapshots
7. price_snapshots

## 1) raw_events
Minimal fields:
- event_id
- headline_raw
- source
- timestamp
- source_tier
- ingest_method
- raw_payload_ref

## 2) normalized_events
Minimal fields:
- event_id
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

## 3) cases
Minimal fields:
- case_id
- linked_event_id
- event_type
- event_family
- decision_ladder_result
- status
- case_path

## 4) studies
Minimal fields:
- study_id
- case_id
- study_type
- objective
- linked_assets
- windows
- current_state
- study_path

## 5) evidence
Minimal fields:
- evidence_id
- study_id
- case_id
- assessment
- missing_evidence
- next_action
- evidence_path

## 6) benchmark_snapshots
Minimal fields:
- snapshot_id
- benchmark_name
- timestamp
- value
- source
- notes

## 7) price_snapshots
Minimal fields:
- snapshot_id
- symbol
- asset_type
- timestamp
- open
- high
- low
- close
- volume
- source

## Recommended key relationship
raw_event -> normalized_event -> case -> study -> evidence

## Design rule
IDs should be stable and human-readable enough for document-first work, but unique enough to map into a future database.
