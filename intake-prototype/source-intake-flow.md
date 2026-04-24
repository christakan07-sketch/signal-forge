# Source Intake Flow

## Step 1: Capture headline
Collect:
- raw headline
- source
- timestamp
- source tier

## Step 2: Normalize event
Turn headline into:
- event_type
- event_family
- region
- entities
- summary
- directly exposed assets

## Step 3: Create case
Create a case folder in `case-library/cases/` with:
- case.md
- meta.json

## Step 4: Classify taxonomy
Assign:
- event_type
- event_family
- first-order impact path
- persistence profile
- likely validation method
- likely failure mode

## Step 5: Suggest study
Choose one first study:
- persistence
- follow-through
- false-positive
- cross-asset confirmation

## Step 6: Spawn evidence stub
Create an evidence sheet even if it is mostly empty.
This forces observation discipline from the start.

## Output of one completed intake
- one normalized event
- one case entry
- one study suggestion
- one evidence stub
