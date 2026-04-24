param(
  [Parameter(Mandatory=$true)] [string]$EventId,
  [Parameter(Mandatory=$true)] [string]$Headline,
  [Parameter(Mandatory=$true)] [string]$Source,
  [Parameter(Mandatory=$true)] [string]$Timestamp,
  [string]$SourceTier = "top-tier-reporting",
  [string]$EventType = "",
  [string]$EventFamily = "",
  [string]$CaseId = ""
)

# Derive CaseId if not provided
if (-not $CaseId) {
  $CaseId = "case-$EventId"
}

# --- Taxonomy auto-prefill lookup ---
$taxonomyLookup = @{
  "supply_shock" = @{
    first_order_impact_path   = "physical_supply"
    second_order_impact_paths = @("inflation_expectations","volatility_expansion","sector_rotation")
    persistence_profile       = "short_follow_through"
    validation_method         = @("price_reaction_window","cross_asset_confirmation")
    failure_mode              = @("fast_reversal","already_priced","weak_causal_link")
    suggested_study           = "persistence_study"
  }
  "policy_signal" = @{
    first_order_impact_path   = "policy_rate_expectation"
    second_order_impact_paths = @("sector_rotation","valuation_rerating")
    persistence_profile       = "slow_burn_repricing"
    validation_method         = @("rates_and_fx_reaction","relative_performance")
    failure_mode              = @("already_priced","attribution_is_unclear")
    suggested_study           = "follow_through_study"
  }
  "regulatory_regime" = @{
    first_order_impact_path   = "regulatory_risk_premium"
    second_order_impact_paths = @("valuation_rerating","narrative_reinforcement","sentiment_repricing")
    persistence_profile       = "regime_shift_candidate"
    validation_method         = @("follow_up_policy_confirmation","relative_performance","repeated_headline_pattern")
    failure_mode              = @("symbolic_policy_only","broad_beta_overwhelms_signal")
    suggested_study           = "follow_through_study"
  }
  "demand_or_flow" = @{
    first_order_impact_path   = "funding_or_liquidity"
    second_order_impact_paths = @("sentiment_repricing","volatility_expansion")
    persistence_profile       = "short_follow_through"
    validation_method         = @("price_reaction_window","repeated_headline_pattern")
    failure_mode              = @("already_priced","broad_beta_overwhelms_signal")
    suggested_study           = "persistence_study"
  }
  "macro_data" = @{
    first_order_impact_path   = "policy_rate_expectation"
    second_order_impact_paths = @("valuation_rerating","sector_rotation")
    persistence_profile       = "short_follow_through"
    validation_method         = @("price_reaction_window","rates_and_fx_reaction")
    failure_mode              = @("already_priced","attribution_is_unclear")
    suggested_study           = "follow_through_study"
  }
  "operational_incident" = @{
    first_order_impact_path   = "sentiment_repricing"
    second_order_impact_paths = @("narrative_reinforcement","volatility_expansion")
    persistence_profile       = "one_headline_spike"
    validation_method         = @("price_reaction_window")
    failure_mode              = @("fast_reversal","broad_beta_overwhelms_signal")
    suggested_study           = "false_positive_tracking"
  }
  "company_event" = @{
    first_order_impact_path   = "earnings_or_margin_pressure"
    second_order_impact_paths = @("valuation_rerating","sentiment_repricing")
    persistence_profile       = "short_follow_through"
    validation_method         = @("price_reaction_window","relative_performance")
    failure_mode              = @("already_priced","attribution_is_unclear")
    suggested_study           = "follow_through_study"
  }
}

# Resolve taxonomy defaults
$taxDefaults = $null
if ($EventFamily -and $taxonomyLookup.ContainsKey($EventFamily)) {
  $taxDefaults = $taxonomyLookup[$EventFamily]
}

# --- Paths ---
$root = "C:\Users\miv\.openclaw\workspace"
$rawDir       = Join-Path $root "raw-events"
$normDir      = Join-Path $root "normalized-events"
$caseRoot     = Join-Path $root "case-library\cases"
$studyRoot    = Join-Path $root "simulation-framework\studies"
$evidenceRoot = Join-Path $root "simulation-framework\evidence"

New-Item -ItemType Directory -Force $rawDir, $normDir, $caseRoot, $studyRoot, $evidenceRoot | Out-Null

$rawPath       = Join-Path $rawDir        ("$EventId.json")
$normPath      = Join-Path $normDir       ("normalized-$EventId.json")
$caseDir       = Join-Path $caseRoot      $CaseId
$studyPath     = Join-Path $studyRoot     ("study-$CaseId.md")
$evidencePath  = Join-Path $evidenceRoot  ("evidence-$CaseId.md")

New-Item -ItemType Directory -Force $caseDir | Out-Null

# --- Raw event ---
$raw = [ordered]@{
  event_id        = $EventId
  headline_raw    = $Headline
  source          = $Source
  timestamp       = $Timestamp
  source_tier     = $SourceTier
  ingest_method   = "automation_stub"
  raw_payload_ref = $null
} | ConvertTo-Json -Depth 4

# --- Normalized event ---
$normalized = [ordered]@{
  event_id           = $EventId
  normalized_summary = $Headline
  event_type         = $EventType
  event_family       = $EventFamily
  first_order_impact_path   = if ($taxDefaults) { $taxDefaults.first_order_impact_path } else { "" }
  second_order_impact_paths = if ($taxDefaults) { $taxDefaults.second_order_impact_paths } else { @() }
  persistence_profile       = if ($taxDefaults) { $taxDefaults.persistence_profile } else { "" }
  validation_method         = if ($taxDefaults) { $taxDefaults.validation_method } else { @() }
  failure_mode              = if ($taxDefaults) { $taxDefaults.failure_mode } else { @() }
  region            = @()
  primary_entities  = @()
  direct_assets     = @()
  secondary_assets  = @()
  novelty           = ""
  urgency           = ""
  noise_flag        = $false
} | ConvertTo-Json -Depth 8

# --- Meta ---
$meta = [ordered]@{
  case_id                = $CaseId
  event_date             = $Timestamp
  event_type             = $EventType
  event_family           = $EventFamily
  first_order_impact_path   = if ($taxDefaults) { $taxDefaults.first_order_impact_path } else { "" }
  second_order_impact_paths = if ($taxDefaults) { $taxDefaults.second_order_impact_paths } else { @() }
  persistence_profile       = if ($taxDefaults) { $taxDefaults.persistence_profile } else { "" }
  validation_method         = if ($taxDefaults) { $taxDefaults.validation_method } else { @() }
  failure_mode              = if ($taxDefaults) { $taxDefaults.failure_mode } else { @() }
  region                 = @()
  source_refs            = @("raw-events/$EventId.json")
  primary_assets         = @()
  secondary_assets       = @()
  themes                 = @()
  decision_ladder_result = "research"
  confidence_band        = "low"
  evidence_quality       = "low"
  status                 = "draft"
  notes                  = @("generated by automation stub")
} | ConvertTo-Json -Depth 8

# --- Case.md ---
$suggestedStudy = if ($taxDefaults) { $taxDefaults.suggested_study } else { "to be chosen" }

$caseMd = @"
# Case Overview

## Case ID
`$CaseId

## Event summary
$Headline

## Why it matters
- to be filled

## Direct exposure
- 

## Indirect exposure
- 

## Current decision ladder result
- Research

## Suggested first study
- $suggestedStudy
"@

# --- Study.md ---
$studyMd = @"
# Study Stub

## Study ID
study-$CaseId

## Linked case
- case_id: $CaseId
- case_path: $caseDir

## Study type
- $suggestedStudy

## Objective
- to be defined

## Notes
- generated by automation stub
"@

# --- Evidence.md ---
$evidenceMd = @"
# Evidence Stub

## Evidence ID
evidence-$CaseId

## Linked case
- case_id: $CaseId

## Current state
- created by automation stub
- awaiting observations
"@

Set-Content -Path $rawPath                          -Value $raw        -Encoding UTF8
Set-Content -Path $normPath                         -Value $normalized -Encoding UTF8
Set-Content -Path (Join-Path $caseDir "meta.json")  -Value $meta       -Encoding UTF8
Set-Content -Path (Join-Path $caseDir "case.md")    -Value $caseMd     -Encoding UTF8
Set-Content -Path $studyPath                        -Value $studyMd    -Encoding UTF8
Set-Content -Path $evidencePath                     -Value $evidenceMd -Encoding UTF8

Write-Host "Created:"
Write-Host "- $rawPath"
Write-Host "- $normPath"
Write-Host "- $caseDir\meta.json"
Write-Host "- $caseDir\case.md"
Write-Host "- $studyPath"
Write-Host "- $evidencePath"
if ($taxDefaults) {
  Write-Host ""
  Write-Host "Taxonomy auto-prefilled:"
  Write-Host "- first_order_impact_path: $($taxDefaults.first_order_impact_path)"
  Write-Host "- persistence_profile: $($taxDefaults.persistence_profile)"
  Write-Host "- suggested_study: $($taxDefaults.suggested_study)"
}
