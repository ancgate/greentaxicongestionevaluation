{{
    config (
         materialized='table'
    )
}}

WITH ratecode_cte AS  
(
     SELECT DISTINCT 
          rate_code_id as ratecode_id
     FROM  public.taxi_green_raw 
    
)

select CAST(ratecode_id AS INTEGER)
from ratecode_cte
