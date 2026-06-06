utils::globalVariables(c(
  "year", "is_monarchy", "is_democracy",
  "monarchies", "democracies", "count",
  "type", "regime_category", "country_name",
  "country_code", "female_leader", "gdp",
  "years_with_female_leader", "avg_gdp",
  "unemployment_rate", "above_10_percent",
  "number_of_countries", "percent_above_10", "."
))

## had to figure out why i kept getting global variable notes when i built the package and found this as the easiest solution
## by asking chatgpt, how to fix no visible global function defintion for _____.
