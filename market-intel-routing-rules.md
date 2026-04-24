# Market Intelligence Routing Rules

## Core routing logic
### Route to archive/watch only when
- source tier is weak
- event relevance is low
- impact confidence is low
- no clear directly exposed assets are identified

### Route to Sage when
- event relevance is medium/high
- impact is non-trivial
- event belongs to a meaningful family (policy, supply shock, regulatory, flow)
- there is a real question worth testing

### Route to Shield when
- Sage produced a real hypothesis
- the idea could become a study or simulation candidate
- there is enough structure to review evidence gaps and risk

### Route back to human quickly when
- source quality is unclear but event is potentially important
- event touches high-risk interpretation area
- there is risk of overreacting to a fast headline

## Fast-lane candidates
Good fast-lane candidates for scout -> atlas -> pulse:
- clear macro data surprise
- clear regulator announcement
- obvious commodity supply shock
- obvious ETF flow or exchange event

## Slow-lane candidates
Need scout -> atlas -> pulse -> sage -> shield:
- regulatory regime shifts
- policy-signaling events with uncertain persistence
- narrative-heavy crypto events
- geopolitical events with unclear duration
