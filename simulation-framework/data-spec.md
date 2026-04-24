# Data Specification

## Purpose
This document defines the minimum input data needed to turn the research framework into a repeatable system.

## Core data groups
1. event data
2. asset price data
3. benchmark data
4. confirmation data
5. metadata and taxonomy data

## 1) Event data
Minimum fields:
- event_id
- headline
- source
- timestamp
- source_type
- event_type
- event_family
- region
- primary_entities
- summary

Nice to have:
- source credibility score
- duplicate cluster id
- language
- follow-up headline linkage

## 2) Asset price data
Minimum fields:
- symbol
- asset_type
- timestamp
- open
- high
- low
- close
- volume

Needed windows:
- pre-event baseline
- T0 to T+1h
- T+1h to T+4h
- T+4h to T+1d
- T+1d to T+3d
- T+3d to T+1w
- optional T+1w to T+1m

## 3) Benchmark data
Examples:
- BTC/ETH for crypto beta
- sector ETF proxies for equities
- broad market index
- commodity benchmark
- rates / FX benchmark for macro cases

Purpose:
- avoid mistaking broad market moves for case-specific signal

## 4) Confirmation data
Examples:
- follow-up headlines
- policy confirmations
- related asset moves
- relative-performance snapshots
- volatility expansion

## 5) Metadata and taxonomy data
Minimum fields:
- case_id
- study_id
- event_type
- event_family
- first_order_impact_path
- persistence_profile
- decision_ladder_result
- evidence_quality

## Rule of thumb
If a case cannot define:
- its event timestamp
- its directly exposed assets
- its benchmark comparison
- its observation windows
then it is not ready for serious study.
