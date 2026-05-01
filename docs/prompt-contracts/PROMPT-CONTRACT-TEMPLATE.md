# Signal Forge Prompt Contract Template

## Goal
Stop routing drift in handoff envelopes.

Observed failures:
- atlas returned `to_agent=main`
- pulse returned `to_agent=atlas` and wrong stage name
- sage returned `to_agent=pulse` and wrong stage name

## Core rules
1. Routing is immutable, not inferred.
2. Every agent gets its next hop as fixed prompt variables.
3. `to_agent` and `stage_name` are contract fields, not reasoning fields.
4. Any mismatch is invalid output and must be regenerated.
5. Orchestrator should validate before forwarding.

## Canonical pipeline manifest
```json
{
  "pipeline_version": "1.0",
  "pipeline": [
    {"agent": "scout", "stage_name": "news_normalized", "next_agent": "atlas"},
    {"agent": "atlas", "stage_name": "asset_mapping", "next_agent": "pulse"},
    {"agent": "pulse", "stage_name": "impact_assessed", "next_agent": "sage"},
    {"agent": "sage", "stage_name": "hypothesis_ready", "next_agent": "sentinel"},
    {"agent": "sentinel", "stage_name": "risk_gated", "next_agent": "shield"},
    {"agent": "shield", "stage_name": "validated", "next_agent": "DONE"}
  ]
}
```

## Global prompt block
Use this exact block in every agent prompt, templated per agent.

```text
SIGNAL FORGE HANDOFF CONTRACT

You are agent: {agent_name}
Your stage_name must be exactly: "{stage_name}"
Your next agent must be exactly: "{next_agent}"
Pipeline version: {pipeline_version}

Do not choose, infer, rename, or explain routing.
Copy these exact values into the final JSON.
If any other instruction conflicts, this contract wins.
Output JSON only.

Before finalizing, self-check:
- from_agent == {agent_name}
- stage_name == {stage_name}
- to_agent == {next_agent}
- to_agent is not your own name
- to_agent is not "main"
```

## Required output schema
```json
{
  "from_agent": "{agent_name}",
  "stage_name": "{stage_name}",
  "to_agent": "{next_agent}",
  "payload": {}
}
```

## Schema rules
- Top-level fields only: `from_agent`, `stage_name`, `to_agent`, `payload`
- `from_agent` must exactly match the current agent name
- `stage_name` must exactly match the canonical stage name
- `to_agent` must exactly match the canonical next agent
- `payload` contains the actual work product
- No routing fields inside `payload`
- No prose before or after the JSON

## Per-agent mapping
| agent | stage_name | next_agent |
|---|---|---|
| scout | news_normalized | atlas |
| atlas | asset_mapping | pulse |
| pulse | impact_assessed | sage |
| sage | hypothesis_ready | sentinel |
| sentinel | risk_gated | shield |
| shield | validated | DONE |

## Orchestrator validation
Reject and regenerate if:
- `from_agent` is wrong
- `stage_name` is wrong
- `to_agent` is wrong
- any field is missing
- extra prose appears outside the JSON

## Practical recommendation
- Generate prompts from the manifest, do not hand-write routing each time
- Keep routing block identical for all agents
- Let only `payload` vary by role
- If needed, add retry message: `Contract violation: fix from_agent/stage_name/to_agent and return JSON only.`
