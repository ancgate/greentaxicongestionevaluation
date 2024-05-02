{% macro date_to_yymmdd(date) %}
  SELECT
    CAST(TO_CHAR({{ date }}, 'YYMMDDHH') AS INTEGER) AS date_int
{% endmacro %}