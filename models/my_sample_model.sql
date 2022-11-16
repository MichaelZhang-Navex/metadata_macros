{{ config(
    materialized = 'view',
    dtabase = 'QA_COMMON_DB',
    schema = 'PUBLIC_2'
) }}
{{ say_my_name('John Doe') }}
