{{ config(tags=['token'], alias=var('token_name_var')~'activity_per_day') }}

SELECT
    tt.date,
    tt.token_address,
    {{ stablecoin_conversion('tt.value') }} as total_usd_value

FROM {{ ref('stg_token_transfers') }} tt

WHERE lower(tt.token_address) = '{{ var("token_address_var") }}'

GROUP BY 
    tt.date,
    tt.token_address