{% macro say_my_name(my_name) -%}
SELECT
    {{ my_name }} AS NAME
{%- endmacro %}
