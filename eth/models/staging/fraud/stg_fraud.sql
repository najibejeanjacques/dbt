
{{ config(group = 'fraud_risk', access='private') }}

SELECT 
t.from_address,
c.bytecode,
count(c.bytecode) bytecode_count

FROM {{ ref('stg_transactions_enriched') }} t
LEFT JOIN {{ ref('stg_contracts') }} c

WHERE t.transaction_category='contract_creation' 
AND c.bytecode is not NULL

GROUP BY 1,2