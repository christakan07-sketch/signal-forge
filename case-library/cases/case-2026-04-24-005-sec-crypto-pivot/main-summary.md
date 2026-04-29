# Case-005: SEC Crypto Pivot — Pipeline Run Summary

## Pipeline Execution
- Date: 2026-04-30
- Pipeline: scout → atlas → pulse → sage → shield
- Total time: 53 seconds
- Status: ✅ COMPLETE

## Step Results

### Scout (MiMo V2 Pro, 10s)
- 7 facts extracted
- 3 claims identified
- 7 uncertainties flagged
- Key question: What exact SEC statement/document supports the claim?

### Atlas (MiMo V2 Pro, 7s)
- Primary assets: BTC, ETH, COIN, HOOD
- Secondary assets: SOL, BNB, MSTR, IBIT
- Themes: reduced regulatory overhang, crypto policy easing, multiple expansion

### Pulse (qwen3.6:35b-a3b, 13s)
- Direction: Bullish (confidence 0.78)
- Watch priority: 4/5
- Horizon: days
- Strongest: COIN, HOOD (high magnitude)
- 3 invalidation conditions defined

### Sage (qwen3.6:35b-a3b, 16s)
- 4 hypotheses generated
- H1: COIN/HOOD outperform (confidence 0.82)
- H2: ETH catch-up if staking included (confidence 0.64)
- H3: Fade if rhetorical only (confidence 0.71)
- H4: U.S. regulated > offshore (confidence 0.77)
- Recommended: paper_trade_candidate

### Shield (claude-sonnet-4-6, 7s)
- Decision: Paper Trade Candidate
- Selected hypotheses: H1 + H3 + H4
- Confidence: 0.81
- Risks: rhetorical-only shift, flow absorption by BTC/ETH

## Final Decision
**Paper Trade Candidate** on COIN/HOOD overweight versus BTC/ETH, with tight invalidation tracking.

## Pipeline Quality
- Handoff quality: 5/5
- Speed: 4/5 (53s total)
- Output quality: 4/5
- Decision appropriateness: 4/5

## Verdict
First end-to-end pipeline run successful. System works as designed.