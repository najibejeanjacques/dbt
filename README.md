# dbt

dbt projects for on-chain analytics. This repo currently contains one project, [`eth`](eth/), targeting Snowflake.

## eth

A dbt project that models Ethereum on-chain activity (transactions, contracts, token transfers) sourced from a Snowflake schema (`eth.eth_schema`).

- **Staging** (`models/base/`) — cleans raw `contracts`, `token_transfers`, and `transactions` tables.
- **Enrichment** (`models/staging/`) — classifies each transaction as `contract_creation`, `token_transfer`, `plain_eth_transfer`, or `other`.
- **Marts** (`models/mart/`) — daily activity tables:
  - `eth_activity_per_day` — transaction counts and ETH value by category.
  - `stablecoin_activity_per_day` — daily USD volume per stablecoin (seeded from `seeds/stablecoins.csv`).
  - `token_activity_per_day` — daily USD volume for an arbitrary token, configured via the `token_name_var` / `token_address_var` vars in `dbt_project.yml`.

### Requirements

- A Snowflake account
- A `~/.dbt/profiles.yml` with a profile named `eth`

### Usage

```bash
cd eth
dbt deps
dbt build
```

### Package dependencies

- `dbt-labs/dbt_utils`
- `dbt-labs/codegen`
- `dbt-labs/audit_helper`
