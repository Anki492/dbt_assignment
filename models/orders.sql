{{ config(
    materialized='incremental',

    pre_hook="
        INSERT INTO DBT_DB.ANALYTICS.MODEL_AUDIT_LOG
        (MODEL_NAME, START_TIME, END_TIME)
        VALUES
        ('incremental_orders', CURRENT_TIMESTAMP, NULL)
    ",

    post_hook="
        UPDATE DBT_DB.ANALYTICS.MODEL_AUDIT_LOG
        SET END_TIME = CURRENT_TIMESTAMP
        WHERE MODEL_NAME = 'incremental_orders'
          AND END_TIME IS NULL
    "
) }}

select
    order_id,
    customer_id,
    order_date,
    amount,
    status,
    updated_at
from {{ source('raw', 'orders') }}

