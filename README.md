## dbt-project: Feature Showcase

This repository demonstrates core dbt features and best practices for analytics engineering. It is designed as a public reference to showcase dbt knowledge and project structure.

### Project Structure

- **models/**: Staging, fact, and curated models with full documentation and tests
- **macros/**: Custom Jinja macros for reusable SQL logic
- **seeds/**: Example static data (e.g., sales targets)
- **snapshots/**: SCD Type 2 snapshot for customer history
- **tests/**: Custom and generic data quality tests
- **analyses/**: (Optional) Ad-hoc analysis queries

### Key Features Demonstrated

- Source definitions with documentation (see models/sources.yml)
- Staging models for raw data transformation
- Incremental models (orders_stg)
- Fact and curated models (orders_fact, customers_orders, customers_revenue)
- Use of dbt_utils and dbt-expectations packages
- Custom macros (generate_profit_model, generate_schema_name)
- Seeds and snapshots
- Extensive schema and column-level documentation
- Custom and generic tests (including dbt-expectations)
- **Python models**: Feature engineering (`traveller_features.py`) and discount logic (`trip_discounts.py`) using dbt Python model support
- **Pre- and post-hooks**: Audit logging for model runs (see `customers_revenue.sql` and `macros/audit_hooks.sql`)

### How to Run

1. Install dependencies:
	```
	dbt deps
	```
2. Run models:
	```
	dbt run
	```
3. Run tests:
	```
	dbt test
	```


### Model Overview

| Model                   | Materialization | Description                                         |
|-------------------------|-----------------|-----------------------------------------------------|
| customers_stg           | view            | Staged customer data                                |
| orders_stg              | incremental     | Staged orders with incremental logic                |
| order_items_stg         | view            | Staged order items                                  |
| orders_fact             | view            | Fact table for orders and revenue                   |
| customers_orders        | table           | Orders per customer (curated)                       |
| customers_revenue       | table           | Revenue per customer (curated, with audit hooks)    |
| traveller_features.py   | table           | Python model: Feature engineering for travellers     |
| trip_discounts.py       | table           | Python model: Booking discount calculation           |
| trip_bookings           | view            | Trip bookings staging                               |
| store_performance       | (add if exists) | Store sales vs. targets                             |
| profit_us/uk/india      | (macro)         | Profit calculation by region                        |


### Packages & Dependencies Used
- [dbt-utils](https://hub.getdbt.com/dbt-labs/dbt_utils/latest/)
- [dbt-expectations](https://github.com/calogica/dbt-expectations)
- Python dependencies: `scikit-learn`, `dateutil` (see Python model configs)

### More Resources
- [dbt Documentation](https://docs.getdbt.com/docs/introduction)
- [dbt Community](https://getdbt.com/community)
