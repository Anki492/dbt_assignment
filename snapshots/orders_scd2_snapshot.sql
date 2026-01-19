{% snapshot orders_scd2_snapshot %}

{{
    config(
        target_schema='SNAPSHOTS',
        unique_key='order_id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

SELECT
    order_id,
    customer_id,
    order_date,
    amount,
    status,
    updated_at
FROM {{ source('raw', 'orders') }}

{% endsnapshot %}
