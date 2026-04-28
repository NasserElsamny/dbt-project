{{ dbt_utils.deduplicate(
    relation=source('LANDING', 'ORDERITEMS'),
    partition_by='orderid',
    order_by="updated_at desc",
   )
}}