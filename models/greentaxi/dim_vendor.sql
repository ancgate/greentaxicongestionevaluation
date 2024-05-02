{{
    config (
         materialized='table'
    )
}}

WITH vendor_cte AS  
(
     SELECT DISTINCT 
          vendor_id as vendor_id
     FROM  public.taxi_green_raw 
     WHERE vendor_id is NOT NULL
    
)

select CAST(vendor_id AS INTEGER)
from vendor_cte
