-- Define the minimum record counts for each table
{% set expected_counts = {
    "CUSTOMERS": 50,
    "EMPLOYEES": 20,
    "STORES": 10,
    "SUPPLIERS": 5,
    "PRODUCTS": 100,
    "ORDERITEMS": 1000,
    "ORDERS": 200,
} %}

-- Test the count of records in each table
{% for table, expected_count in expected_counts.items() %}
    select
        '{{ table }}' as table_name,
        (select count(*) from {{ source("LANDING", table) }}) as record_count,
        {{ expected_count }} as expected_count
    where (select count(*) from {{ source("LANDING", table) }}) < {{ expected_count }}
    {% if not loop.last %}
        union all
    {% endif %}
{% endfor %}
