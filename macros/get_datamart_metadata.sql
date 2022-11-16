{% macro get_datamart_metadata(
        datamart,
        dbname,
        schemaname
    ) %}
    {% set query %}
SELECT
    table_schema || '.' || table_name || ' AS ' || table_alias AS source_table,
    primary_table,
    join_type,
    IFNULL(
        join_logic,
        ''
    )
FROM
    "DEV_COMMON_DB"."SILVER_METADATA"."DATAMARTS_METADATA"
WHERE
    datamart_name = '{{ datamart }}'
ORDER BY
    table_id ASC;
{% endset %}
    {% set results = run_query(query) %}
    {% for column in results %}
        {{ dbname ~ '.' ~ column [0].replace(
            "SQL_SERVER_DBO",
            schemaname
        ) ~ ' ' ~ column [3] }}

        {%- if not loop.last %}
            {{ column [2] }}
        {% endif -%}
    {% endfor %}
{% endmacro %}
