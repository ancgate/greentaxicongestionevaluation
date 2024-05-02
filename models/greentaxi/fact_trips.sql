{{
    config (
         materialized='table'
    )
}}

WITH fact_cte AS 
(
     SELECT 
     o.fare_amount as fare_amount, 
     o.extra as extra_amount, 
     o.mta_tax as mta_tax, 
     o.improvement_surcharge AS imptovement_charges, 
     o.tip_amount AS tips_amount,
     o.tolls_amount as tollls_amount, 
     o.total_amount as total_amount, 
     o.congestion_surcharge AS  congestion_amount,
     o.passenger_count as passenger_count, 
     o.trip_distance as trip_distance,
     -- o.trip_duration_minutes
     -- o.new_total_amount, 
     -- o.subway_amount, 
     -- o.lirr_amount, 
     -- o.mnr_amount, 
     v.vendor_id as vendor_id
     FROM public.taxi_green_raw AS o
     INNER JOIN dbt_greentaxi.dim_vendor v  ON v.vendor_id = CAST(o.vendor_id AS INTEGER)
     -- INNER JOIN dbt_greentaxi.dim_paymentType p  ON p.paymentType_id = CAST(o.payment_type AS INTEGER)

)

select vendor_id, 
       fare_amount, 
       extra_amount, 
       mta_tax, 
       imptovement_charges, 
       tips_amount,
       tollls_amount
from  fact_cte
