{% macro random_macro() %}

{% set query %}

select distinct token_address from {{ ref('stg_token_transfers') }} limit 10

{% endset %}

{% if execute %}

{% set results = run_query(query) %}

{% set result_list = results.columns[0].values() %}

{% endif %}

{% set sql=[] %}

{% for i in result_list %}

{% do sql.append("'"~i~"'") %}

{% endfor %}

{{ log(sql | join(', '), info=True) }}

{{ return (result_list | join(', ')) }}

{% endmacro %}