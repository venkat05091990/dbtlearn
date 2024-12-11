{{
    config(
        materialized = "view"
    )
}}
WITH src_listings AS (
    SELECT * FROM {{ref("src_listings")}}
)
SELECT 
    listing_id,
    listing_name,
    CASE 
        WHEN MINIMUM_NIGHTS = 0 THEN 1
        ELSE MINIMUM_NIGHTS
    END AS minimum_nights,
    room_type,
    host_id,
    REPLACE(
        price_str,
        '$'
    ) :: NUMBER(10,2) AS price,
    CREATED_AT,
    UPDATED_AT
FROM src_listings