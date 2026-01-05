-- ============================================
-- DIM: DATE
-- Purpose: standard calendar table for BI filters & time series
-- ============================================

CREATE OR REPLACE TABLE `supple-comfort-483102-b2.olist_marts.dim_date` AS
WITH bounds AS (
  SELECT
    MIN(order_date) AS min_date,
    MAX(order_date) AS max_date
  FROM `supple-comfort-483102-b2.olist_marts.fact_orders`
),
dates AS (
  SELECT d AS date_day
  FROM bounds, UNNEST(GENERATE_DATE_ARRAY(min_date, max_date)) AS d
)
SELECT
  date_day,
  EXTRACT(YEAR FROM date_day) AS year,
  EXTRACT(QUARTER FROM date_day) AS quarter,
  EXTRACT(MONTH FROM date_day) AS month,
  FORMAT_DATE('%Y-%m', date_day) AS year_month,
  EXTRACT(WEEK FROM date_day) AS week,
  EXTRACT(DAYOFWEEK FROM date_day) AS day_of_week,
  FORMAT_DATE('%A', date_day) AS day_name,
  IF(EXTRACT(DAYOFWEEK FROM date_day) IN (1,7), 1, 0) AS is_weekend
FROM dates;