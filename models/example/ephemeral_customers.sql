{{ config(materialized='ephemeral') }}

select
    customer_id,
    customer_name,
    country_code
from {{ source('raw', 'customers') }}
