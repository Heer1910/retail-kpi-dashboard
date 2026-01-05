CREATE OR REPLACE TABLE `supple-comfort-483102-b2.olist_marts.kpi_monthly` AS
WITH monthly_orders AS (
  SELECT
    DATE_TRUNC(order_date, MONTH) AS month,
    COUNT(DISTINCT order_id) AS orders,
    COUNTIF(is_canceled = 1) AS canceled_orders,
    SAFE_DIVIDE(COUNTIF(is_canceled = 1), COUNT(*)) AS cancellation_rate,
    AVG(IF(is_delivered = 1, delivery_days, NULL)) AS avg_delivery_days
  FROM `supple-comfort-483102-b2.olist_marts.fact_orders`
  GROUP BY 1
),
monthly_revenue AS (
  SELECT
    DATE_TRUNC(order_date, MONTH) AS month,
    SUM(gross_item_value) AS revenue
  FROM `supple-comfort-483102-b2.olist_marts.fact_order_items`
  WHERE order_status = 'delivered'
  GROUP BY 1
)
SELECT
  o.month,
  r.revenue,
  o.orders,
  SAFE_DIVIDE(r.revenue, o.orders) AS aov,
  o.avg_delivery_days,
  o.cancellation_rate,
  o.canceled_orders
FROM monthly_orders o
LEFT JOIN monthly_revenue r USING (month)
ORDER BY month;

