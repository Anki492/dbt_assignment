select * from {{ ref('incremental_orders') }}
where amount<0