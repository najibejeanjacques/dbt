SELECT
    date,
    transaction_category,
    COUNT(*) as tx_count,
    {{ etherum_conversion('value') }} as eth_value

FROM {{ ref('stg_transactions_enriched') }} 

GROUP BY 
    date, 
    transaction_category
