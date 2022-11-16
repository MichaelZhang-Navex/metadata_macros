{% macro get_datamart_metadata_qa(datamart,dbname,schemaname) %} 
{% set query %} SELECT TABLE_SCHEMA || '.' || TABLE_NAME || ' AS ' || TABLE_ALIAS AS SOURCE_TABLE, PRIMARY_TABLE,JOIN_TYPE, IFNULL(JOIN_LOGIC,'') FROM "QA_COMMON_DB"."SILVER_METADATA"."DATAMARTS_METADATA" WHERE DATAMART_NAME = '{{ datamart }}' ORDER BY TABLE_ID ASC; {% endset %}
{% set results = run_query(query) %}
{% for column in results %} 
{{ dbname ~ '.' ~ column[0].replace("SQL_SERVER_DBO",schemaname) ~ ' ' ~ column[3] }} {%- if not loop.last %} {{ column[2] }}{% endif -%}
{% endfor %}
{% endmacro %}