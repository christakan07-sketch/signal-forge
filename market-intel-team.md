# Market Intelligence Multi-Agent Team

## Team
- main -> Chief Orchestrator
- scout -> News Hunter
- atlas -> Asset Mapper
- pulse -> Impact Analyst
- sage -> Strategy Researcher
- shield -> Validator / Risk Officer

## Model assignment
- scout -> ollama/qwen3:8b
- atlas -> ollama/qwen3:8b
- pulse -> ollama/qwen3.6:35b-a3b
- sage -> ollama/qwen3.6:35b-a3b
- shield -> claude-cli/claude-sonnet-4-6
- main -> default primary/fallback chain

## Suggested pipeline
1. scout normalizes news/events
2. atlas maps relevance to assets/themes
3. pulse scores likely impact and urgency
4. sage proposes hypotheses and tests
5. shield validates evidence, risks, and next action
6. main summarizes for the human

## Handoff standard
- Shared spec: `market-intel-handoff.md`
- Base template: `handoff-template.json`
- scout -> atlas = `news_normalized`
- atlas -> pulse = `asset_mapping`
- pulse -> sage = `impact_assessed`
- sage -> shield = `hypothesis_ready`
- shield -> main = `validated`

## Decision ladder
- Ignore
- Archive
- Watch
- Research
- Simulate
- Paper Trade Candidate
- Manual Review Required
