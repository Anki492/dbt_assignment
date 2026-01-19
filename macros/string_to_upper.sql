{% macro string_to_upper(column_name) %}
    upper({{ column_name }})
{% endmacro %}
