select
    customer_id,
    {{ upper('customer_name') }} as customer_name,
    {{ upper('country_name') }} as country_name
from {{source('raw', 'customers') }}
