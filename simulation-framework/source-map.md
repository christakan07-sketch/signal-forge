# Source Map

## Event data by case family
### Supply shock / energy shock
Good sources:
- Reuters / major financial news
- official government or ministry statements
- OPEC / IEA / shipping chokepoint news
- exchange notices where relevant

### Monetary policy signal
Good sources:
- central bank press releases
- central bank calendars
- Reuters / major macro news
- official speech / statement pages

### Regulatory regime
Good sources:
- regulator press releases
- enforcement / litigation pages
- official policy statements
- Reuters / major financial news

### Demand or flow cases
Good sources:
- ETF flow summaries
- exchange data
- fund flow reporting
- Reuters / major market reporting

## Market data by asset group
### Crypto
- exchange OHLCV APIs
- consolidated crypto market APIs

### Commodities / energy
- futures data source
- commodity ETFs or proxies for lightweight prototyping

### Macro / rates / FX
- FX provider
- bond/rates proxy source
- macro market data provider

### Equities / sectors
- sector ETF data
- broad index data
- single-stock OHLCV

## Benchmark logic
- every case should define at least one primary benchmark and one control or broad-beta benchmark
- benchmark selection should be written down, not improvised later
