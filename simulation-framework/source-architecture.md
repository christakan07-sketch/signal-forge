# Source Architecture

## Purpose
Define where event data, price data, and benchmark data should come from, and how to stage them from lightweight prototype sources into more reliable production sources.

## Core layers
1. event sources
2. market data sources
3. benchmark sources
4. enrichment and metadata sources
5. storage layer

## 1) Event sources
### Prototype tier
- manual headline entry
- RSS feeds
- official press release pages
- Reuters-grounded web search

### Research tier
- curated news APIs
- official regulator feeds
- exchange announcements
- central bank calendars / policy pages

### Production tier
- provider-backed real-time news feeds
- structured event/calendar feeds
- monitoring for follow-up policy and enforcement actions

## 2) Market data sources
### Prototype tier
- public price endpoints
- exchange OHLCV APIs
- TradingView/manual snapshots

### Research tier
- consolidated OHLCV provider
- sector ETF data source
- futures and FX data source

### Production tier
- low-latency market data provider
- normalized cross-venue pricing
- robust historical store with replay capability

## 3) Benchmark sources
Need benchmarks for each event class:
- crypto beta benchmarks
- broad equity or sector benchmarks
- commodity benchmarks
- FX/rates benchmarks

Prototype tier:
- manually selected comparison symbols

Research tier:
- consistent benchmark basket definitions

Production tier:
- maintained benchmark registry with versioning

## 4) Enrichment and metadata sources
- taxonomy labels from internal system
- source credibility tags
- duplicate clustering ids
- event-to-case linkage
- case-to-study linkage

## 5) Storage layer
Recommended stores:
- raw_events
- normalized_events
- price_snapshots
- benchmark_snapshots
- case_library
- studies
- evidence_sheets

## Recommended build order
1. start with manual headline + public market snapshots
2. add RSS and official event pages
3. add consistent OHLCV and benchmark collection
4. add regulator/exchange specific feeds
5. only then worry about real-time production ingestion

## Key design principle
Build a system that can be right slowly before trying to be fast automatically.
