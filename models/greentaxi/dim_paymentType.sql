{{
    config (
         materialized='table'
    )
}}

WITH payment_type_cte AS  
(
     SELECT DISTINCT 
          payment_type as paymentType_id
     FROM  public.taxi_green_raw 
     
    
)

select CAST(paymentType_id AS INTEGER)
from payment_type_cte
WHERE paymentType_id IS NOT NULL
