{{
    config(tags=['stablecoin'])
}}

SELECT 
    transaction_hash,
    date,
    token_address,
    value
FROM {{ source('eth', 'token_transfers') }}

-- {% if target.name == 'dev' %}
-- where date >= dateadd('day', -3, current_date)
-- {% endif %}