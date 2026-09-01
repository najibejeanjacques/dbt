{{
    config(tags=['stablecoin'], grants= {'+select': ['TESTER']})
}}

SELECT
    tt.date,
    sc.Type,
    {{ stablecoin_conversion('tt.value') }} as total_usd_value

FROM {{ ref('stg_token_transfers') }} tt

LEFT JOIN {{ ref('stablecoins') }} sc
ON tt.token_address = sc.contract_address

WHERE sc.contract_address is not null

GROUP BY 
    tt.date,
    sc.Type
