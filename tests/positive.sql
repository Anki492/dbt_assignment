
{% test positive(model, column_name) %}
-- Fails when the column is NOT strictly greater than zero.
-- Nulls are ignored here; use a separate `not_null` test if needed.
select *
from {{ model }}
where {{ column_name }} is not null
  and {{ column_name }} <= 0
{% endtest %}
``
