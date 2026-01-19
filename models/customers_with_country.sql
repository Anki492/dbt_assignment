SELECT
    c.customer_id,
    c.customer_name,
    c.country_code,
    s.country_name
FROM {{ source('raw', 'customers') }} c
LEFT JOIN {{ ref('country_codes') }} s
  ON c.country_code = s.country_code;
