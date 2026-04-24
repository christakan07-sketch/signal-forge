# Automation Stub

## File
- `create_event_stub.ps1`

## Purpose
Create the first layer of repeatable automation for the research system.

It generates:
- raw event file
- normalized event file
- case stub
- study stub
- evidence stub

## Example
```powershell
powershell -ExecutionPolicy Bypass -File .\intake-prototype\create_event_stub.ps1 \
  -EventId event-2026-04-24-006 \
  -Headline "Example regulator headline" \
  -Source "Manual input" \
  -Timestamp "2026-04-24" \
  -SourceTier "top-tier-reporting" \
  -EventType "regulatory_action" \
  -EventFamily "regulatory_regime" \
  -CaseSlug "example-regulator-case"
```

## Notes
- This is intentionally a stub, not a full pipeline.
- It automates file creation, not judgment.
- Human or agents should still fill the analysis and validation layers.
