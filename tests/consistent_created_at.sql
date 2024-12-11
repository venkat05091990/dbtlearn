WITH r AS (
    SELECT * FROM {{ref("fct_reviews")}}
), l As (
    SELECT * FROM {{ ref('dim_listings_cleansed')}}
)
SELECT *
FROM r 
LEFT JOIN l
ON (l.listing_id = r.listing_id)
WHERE r.review_date < l.created_at
LIMIT 10