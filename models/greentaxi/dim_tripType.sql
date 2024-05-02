{{
    config (
         materialized='table'
    )
}}

WITH triptype_cte AS  
(
     SELECT DISTINCT 
          trip_type as triptype_id
     FROM  public.taxi_green_raw 
    
)

select CAST(triptype_id AS INTEGER)
from triptype_cte
WHERE triptype_id IS NOT NULL