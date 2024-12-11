WITH raw_hosts AS (
    SELECT *
    FROM {{ source('airbnb', 'hosts') }}
)
SELECT
    ID AS host_id, 
    NAME AS host_name, 
    CASE WHEN IS_SUPERHOST = 't' THEN 1
    ELSE 0 END AS is_superhost, 
    CREATED_AT, 
    UPDATED_AT
FROM
    raw_hosts