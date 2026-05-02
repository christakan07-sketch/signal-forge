# Signal Forge Validation Log â€” 2026-05-01

## Purpose
Record the validation work that moved Signal Forge from a loose prototype into a governed research pipeline.

## What was validated

### 1) Full pipeline works end-to-end
Pipeline used:
`scout -> atlas -> pulse -> sage -> sentinel -> shield`

Validated across two domains:
- **Crypto:** case-005 (SEC crypto pivot)
- **Energy:** case-009 (oil / Hormuz)

### 2) Prompt contract fix solved routing drift
Observed prior failures:
- atlas returned `to_agent=main`
- pulse returned wrong `to_agent` and wrong `stage`
- sage returned wrong `to_agent` and wrong `stage`

After applying the new prompt-contract system, all agents returned correct:
- `from_agent`
- `stage_name`
- `to_agent`

Validated agents:
- scout âœ…
- atlas âœ…
- pulse âœ…
- sage âœ…
- sentinel âœ…
- shield âœ…

### 3) Sentinel risk gate is useful, not ceremonial
Sentinel was inserted between `sage` and `shield`.

Validated behaviors:
- assigns explicit `risk_rating`
- enforces `paper_trade_only` when evidence is incomplete
- sets `max_allocation_pct = 0`
- produces concrete kill-switches
- prevents premature escalation by shield

This was confirmed in:
- crypto domain
- energy domain

### 4) Shield respects sentinel
Shield did not override sentinel casually.
It stayed within the risk ceiling and selected more disciplined outcomes.

## Case results

### case-005 â€” SEC crypto pivot
- Initial older run without final governance discipline: `Paper Trade Candidate`
- Governed rerun with fixed contracts + sentinel:
  - Decision: `Research`
  - Reason: catalyst still unverified, confirmation required

### case-009 â€” oil / Hormuz
- Governed pipeline result:
  - Decision: `Research`
  - Selected hypothesis: Brent-led seaborne crude risk premium
  - Sentinel rated risk high and kept stance at paper-trade-only

## What is now considered stable
- multi-agent routing contract
- handoff schema discipline
- risk-gated pipeline flow
- shield decision discipline
- cross-domain usability (crypto + energy)

## What still needs work
- persist these prompts into actual runtime injection path if not already wired
- build a reusable orchestrator-side validator / auto-retry loop for contract violations
- add outcome tracking loop after paper trades
- continue validating on more cases and more domains

## Summary
Signal Forge is no longer just a promising prototype.
It now has:
- a working governed pipeline
- a validated contract system
- a functioning risk gate
- evidence that the system generalizes beyond one asset class

This is an important transition point in the project.
