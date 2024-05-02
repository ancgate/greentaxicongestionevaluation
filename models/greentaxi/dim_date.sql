{{
    config(
         materialized='table'
    )
}}

WITH date_cte AS (
     SELECT DISTINCT CAST(lpep_pickup_datetime AS timestamp) as date_value FROM taxi_green_raw
     UNION 
     SELECT DISTINCT CAST(lpep_dropoff_datetime AS timestamp)  as date_value FROM taxi_green_raw 
)

SELECT
  {{ datetime_to_yyyymmddhh('date_value') }} AS date_id,
  date_value AS date_iso,
  CAST(EXTRACT(YEAR FROM date_value) AS INTEGER) AS year_number,
  CAST(EXTRACT(MONTH FROM date_value) AS INTEGER)  AS month_number,
  CAST(EXTRACT(DAY FROM date_value) AS INTEGER)  AS day_number,
  CAST(EXTRACT(HOUR FROM date_value) AS INTEGER)  AS hour_number,
  CAST(EXTRACT(QUARTER FROM date_value) AS INTEGER)  AS quarter_number,
  TO_CHAR(date_value, 'Month') AS monthName,
  CAST(EXTRACT(isodow FROM date_value) AS INTEGER)  AS day_of_week,
  CAST(FLOOR((EXTRACT(day FROM date_value) - 1) / 7) AS INTEGER) + 1 AS week_of_month,
  TO_CHAR(date_value, 'Day') AS dayName,
  CAST(EXTRACT(week FROM date_value) AS INTEGER)  AS week_of_year
FROM date_cte