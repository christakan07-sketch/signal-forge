# Signal Forge — Session Bootstrap File

> **READ THIS FIRST** if you are starting a new session about Signal Forge.
> This file contains everything you need to understand the project and continue working.

---

## What is Signal Forge?
Signal Forge is a multi-agent market intelligence research system that turns real-world events into structured research output.

**The pipeline:**
headline → scout → atlas → pulse → shield → main → case → study → evidence → decision

**The goal:**
Find and validate market edge through systematic event research, not gut-feel trading signals.

---

## Project directory
- **Workspace:** `C:\Users\miv\.openclaw\workspace\`
- **GitHub:** https://github.com/christakan07-sketch/signal-forge.git
- **Branch:** master (protected, PR required)

---

## Team (6 agents)
### shield — Project Lead + Validator
- Model: claude-cli/claude-sonnet-4-6
- Role: coordinate, review, decide go/no-go
- Workspace: C:\Users\miv\.openclaw\workspace\shield

### scout — News Hunter
- Model: ollama/qwen3:8b
- Role: normalize events, extract facts, flag noise

### atlas — Asset Mapper
- Model: ollama/qwen3:8b
- Role: map events to assets, sectors, themes, relevance

### pulse — Impact Analyst
- Model: ollama/qwen3.6:35b-a3b
- Role: score direction, horizon, confidence, watch priority

### sage — Strategy Researcher
- Model: ollama/qwen3.6:35b-a3b
- Role: propose hypotheses, strategy candidates, invalidation conditions

### PM — Project Manager (via main session)
- Model: claude-cli/claude-sonnet-4-6
- Role: track, report, escalate
- Cron: 09:00 daily (Asia/Bangkok)

---

## Handoff contract
Every handoff uses a shared envelope:
- from_agent / to_agent
- stage
- facts / claims / uncertainties
- next_question

### Stages
- scout → atlas = news_normalized
- atlas → pulse = asset_mapping
- pulse → sage = impact_assessed
- sage → shield = hypothesis_ready
- shield → main = validated

---

## Decision ladder
- Ignore
- Archive
- Watch
- Research
- Simulate
- Paper Trade Candidate
- Manual Review Required

---

## Current cases (12)
| case | description | status |
|---|---|---|
| case-001 | synthetic copper (prototype) | done |
| case-002 | oil/Hormuz (real) | done |
| case-003 | ECB hold rates | stub |
| case-004 | BTC ETF surge | stub |
| case-005 | SEC crypto pivot (full pipeline) | done |
| case-007 | BTC ETF flow (stub) | stub |
| case-008 | oil Hormuz test (stub) | stub |
| case-009 | oil Hormuz live (persistence study) | T0 captured |
| case-010 | IMF global growth cut | stub |
| case-011 | BTC-stock correlation 0.96 | stub |
| case-012 | BTC midterm cycle | stub |
| case-013 | bond-stock correlation fractured | stub |

---

## Persistence study — case-009
- objective: measure oil price persistence after Hormuz disruption
- T0 captured: Brent $106.21, WTI $96.77 (+1%)
- T+1d: pending
- evidence sheet: created

---

## Automation stub
File: `intake-prototype/create_event_stub.ps1`

Usage:
```powershell
powershell -ExecutionPolicy Bypass -File .\intake-prototype\create_event_stub.ps1 \
  -EventId event-YYYY-MM-DD-NNN \
  -Headline "..." \
  -Source "..." \
  -Timestamp "2026-04-24" \
  -SourceTier "top-tier-reporting" \
  -EventType "energy_supply_shock" \
  -EventFamily "supply_shock" \
  -CaseId "case-YYYY-MM-DD-NNN-slug"
```

Creates: raw event, normalized event, case folder, study stub, evidence stub.
Auto-prefills taxonomy if EventFamily is provided.

---

## Naming conventions
- event ID: event-YYYY-MM-DD-NNN
- case ID: case-YYYY-MM-DD-NNN-slug
- study ID: study-case-YYYY-MM-DD-NNN-slug
- evidence ID: evidence-case-YYYY-MM-DD-NNN-slug

Full spec: `simulation-framework/naming-conventions.md`

---

## What to do next (from PM tracker)
1. collect T+1d window case-009 (oil/Hormuz)
2. build evidence for 5 main cases
3. create historical analog set (5-10 examples)
4. validate 1 case through full simulation

---

## Key files to read
| file | purpose |
|---|---|
| `market-intel-system-overview.md` | full system architecture |
| `market-intel-usage-guide.md` | step-by-step usage |
| `market-intel-daily-workflow.md` | daily/weekly rhythm |
| `market-intel-team.md` | team roles |
| `market-intel-handoff.md` | handoff format spec |
| `market-intel-policies.md` | team policies |
| `simulation-framework/naming-conventions.md` | naming rules |
| `simulation-framework/data-spec.md` | data requirements |
| `SESSION-SUMMARY.md` | cross-session master file |

---

## Design principles
1. Evidence first
2. Automate structure before judgment
3. Keep cases separated from studies
4. Keep studies separated from evidence
5. Always define a benchmark
6. Always note failure modes
7. Prefer watch/simulate over premature execution

---

## How to update SESSION-SUMMARY.md
- read before writing
- append under "## Updates"
- include timestamp + channel name
- do NOT overwrite other sessions' updates

---

## Model config
| component | model |
|---|---|
| primary | openai-codex/gpt-5.5 |
| fallback 1 | claude-cli/claude-sonnet-4-6 |
| fallback 2 | xiaomi-coding/mimo-v2-pro |
| fallback 3 | ollama/qwen3:8b |
| shield | claude-sonnet-4-6 |
| tong (Rhea lead) | claude-sonnet-4-6 |
| scout | ollama/qwen3:8b |
| atlas | ollama/qwen3:8b |
| pulse | ollama/qwen3.6:35b-a3b |
| sage | ollama/qwen3.6:35b-a3b |

---

## Quick start for new session
1. read this file
2. read SESSION-SUMMARY.md for latest updates
3. check case-009 evidence status
4. continue from "what to do next"

---

## PM cron
- Job: pm-daily-report
- Schedule: 09:00 daily (Asia/Bangkok)
- Agent: pm
- Mode: announce to chat
- Reports on: all 5 projects including Signal Forge

---

## Other projects (context)
| project | status | lead |
|---|---|---|
| Rhea Auto Trading Bot | active (Phase 32) | tong |
| AIWorker / openclaw-bridge | stable | aiworker |
| OpenClaw Infra | operational | main |
| Bitkub Lead-Lag Premium Research | pipeline running (every 4h) | main |

---

**This file should be enough for any new session to continue Signal Forge work immediately.**
