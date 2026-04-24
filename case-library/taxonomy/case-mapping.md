# Case Mapping

## case-2026-04-24-001 (synthetic copper)
- event_type: commodity_supply_shock
- event_family: supply_shock
- first_order_impact_path: physical_supply
- second_order_impact_path:
  - volatility_expansion
  - earnings_or_margin_pressure
- persistence_profile: short_follow_through
- typical_validation_method:
  - price_reaction_window
  - cross_asset_confirmation
- typical_failure_mode:
  - weak_causal_link
  - fast_reversal

## case-2026-04-24-002 (oil / Hormuz)
- event_type: energy_supply_shock
- event_family: supply_shock
- first_order_impact_path: physical_supply
- second_order_impact_path:
  - inflation_expectations
  - sector_rotation
  - volatility_expansion
- persistence_profile: short_follow_through or regime_shift_candidate depending duration
- typical_validation_method:
  - price_reaction_window
  - relative_performance
  - cross_asset_confirmation
- typical_failure_mode:
  - fast_reversal
  - already_priced

## case-2026-04-24-003 (ECB hold)
- event_type: monetary_policy_signal
- event_family: policy_signal
- first_order_impact_path: policy_rate_expectation
- second_order_impact_path:
  - sector_rotation
  - valuation_rerating
- persistence_profile: slow_burn_repricing
- typical_validation_method:
  - rates_and_fx_reaction
  - relative_performance
- typical_failure_mode:
  - already_priced
  - attribution_is_unclear

## case-2026-04-24-004 (Bitcoin ETF surge)
- event_type: liquidity_or_flow_signal
- event_family: demand_or_flow
- first_order_impact_path: funding_or_liquidity
- second_order_impact_path:
  - sentiment_repricing
  - volatility_expansion
- persistence_profile: short_follow_through
- typical_validation_method:
  - price_reaction_window
  - repeated_headline_pattern
- typical_failure_mode:
  - already_priced
  - broad_beta_overwhelms_signal

## case-2026-04-24-005 (SEC crypto pivot)
- event_type: regulatory_action
- event_family: regulatory_regime
- first_order_impact_path: regulatory_risk_premium
- second_order_impact_path:
  - valuation_rerating
  - narrative_reinforcement
  - sentiment_repricing
- persistence_profile: regime_shift_candidate
- typical_validation_method:
  - follow_up_policy_confirmation
  - relative_performance
  - repeated_headline_pattern
- typical_failure_mode:
  - symbolic_policy_only
  - broad_beta_overwhelms_signal
