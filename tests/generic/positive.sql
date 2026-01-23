
{% test positive(model, column_name, allow_zero=false) %}
-- Fails if the column value is not positive.
-- Set allow_zero=true to allow non-negative values (>= 0).
{% if allow_zero %}
  {% set op = '<' %}
{% else %}
  {% set op = '<=' %}
{% endif %}

select *
from {{ model }}
where {{ column_name }} is not null
  and {{ column_name }} {{ op }} 0
{% endtest %}
