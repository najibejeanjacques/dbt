{% macro etherum_conversion(column_name) %}

SUM( {{ column_name }} )/1e18

{% endmacro %}

{% macro stablecoin_conversion(column_name) %}

SUM( {{ column_name }} )/1e6

{% endmacro %}