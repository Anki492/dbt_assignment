{{ config(materialized='view') }}

select
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.amount
from {{ ref('ephemeral_customers') }} c
join {{ source('raw', 'orders') }} o
  on c.customer_id = o.customer_id
