{% macro generate_profit_model(schema_name, table_name) %}
    select
        sales_date,
        sum(quantity_sold * unit_sell_price) as total_revenue,
        sum(quantity_sold * unit_purchase_cost) as total_cost,
        sum(quantity_sold * unit_sell_price)
        - sum(quantity_sold * unit_purchase_cost) as total_profit
    from {{ source(schema_name, table_name) }}
    group by sales_date
{% endmacro %}
