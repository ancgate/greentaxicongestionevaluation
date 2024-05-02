{{
    config(
         materialized='table'
    )
}}

WITH location_cte AS (

    SELECT 

    location_id AS location_id,
    borough AS borough,
    zone AS zone,
    zip_code AS zip_code,
    longitude AS longitude,
    latitude AS latitude
    FROM 
    taxi_lookup_raw
)

select * from location_cte