# Source Priority

## Priority order for event truth
1. official primary source
2. top-tier financial reporting
3. curated structured feed
4. broad web/source aggregation
5. social or unstructured rumor

## Priority order for market data
1. exchange or primary market source
2. consolidated provider
3. public API or lightweight provider
4. manual snapshot

## Rule
If the source tier is weak, the system should reduce confidence automatically.

## Suggested prototype rule
- official + market confirmation -> can become strong research candidate
- Reuters-grounded / top-tier financial reporting only -> research candidate
- broad web aggregation only -> watch / caution unless confirmed elsewhere
- social-only -> watchlist or ignore until confirmed
