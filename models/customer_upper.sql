select
    customer_id,
    {{ string_to_upper('customer_name') }} as customer_name_upper
from {{ source('raw', 'customers')  }}
