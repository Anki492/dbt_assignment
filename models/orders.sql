{{ config(
    materialized='incremental',

    pre_hook="
        INSERT INTO DBT_DB.RAW.AUDIT_LOG
        (MODEL_NAME, START_TIME, END_TIME)
        VALUES
        ('incremental_orders', CURRENT_TIMESTAMP, NULL)
    ",

    post_hook="
        UPDATE DBT_DB.RAW.AUDIT_LOG
        SET END_TIME = CURRENT_TIMESTAMP
        WHERE MODEL_NAME = 'incremental_orders'
          AND END_TIME IS NULL
    "
) }}



