{% macro get_gld_table_metadata_qa(tablename) %}
    {% set query %}
SELECT
    '"' || source_field || '"' AS COLUMNS
FROM
    "QA_COMMON_DB"."GOLD_METADATA"."TABLE_METADATA"
WHERE
    source_field IS NOT NULL
    AND source_table IS NOT NULL
    AND object_type = 'Table'
    AND table_name = '{{ tablename }}' {% endset %}
    {% set results = run_query(query) %}
    {% for column in results %}
        {{ column [0] }}

        {%- if not loop.last %},
        {% endif -%}
    {% endfor %}
{% endmacro %}
