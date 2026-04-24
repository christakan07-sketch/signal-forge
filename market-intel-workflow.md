# Market Intelligence Workflow

## Goal
Define how one new headline moves through the multi-agent team from intake to research output.

## Manual phase
### Step 1: Human or operator captures headline
Input:
- raw headline
- source
- timestamp
- quick why-it-matters note

### Step 2: Scout
Scout normalizes the event:
- summarize
- identify entities
- classify event type
- flag novelty / urgency / noise

Output:
- normalized event
- scout handoff

### Step 3: Atlas
Atlas maps the event:
- direct assets
- indirect assets
- sectors
- themes
- relevance score

Output:
- atlas handoff

### Step 4: Pulse
Pulse scores likely impact:
- direction
- horizon
- confidence
- watch priority
- catalyst vs noise

Output:
- pulse handoff

### Step 5: Decision fork
If low relevance or low confidence:
- archive or watch

If high relevance and meaningful uncertainty:
- send to Sage

### Step 6: Sage
Sage proposes:
- hypothesis
- study type
- assumptions
- invalidation conditions

Output:
- sage handoff

### Step 7: Shield
Shield reviews:
- evidence sufficiency
- likely false-positive risk
- next action recommendation

Output:
- research / simulate / caution / manual review

### Step 8: Main
Main summarizes for the human:
- what happened
- why it matters
- what the team thinks
- what the next step is

## Semi-automatic phase
Once manual workflow is stable, automate in this order:
1. headline capture form
2. normalized event creation
3. case folder generation
4. taxonomy prefill
5. study recommendation prefill
6. evidence stub generation

## Important rule
Automate the boring structure first, not the judgment.
