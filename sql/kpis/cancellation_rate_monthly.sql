SELECT
  DATE_TRUNC(order_date, MONTH) AS month,
  COUNTIF(is_canceled = 1) AS canceled_orders,
  COUNT(*) AS total_orders,
  SAFE_DIVIDE(COUNTIF(is_canceled = 1), COUNT(*)) AS cancellation_rate
FROM `supple-comfort-483102-b2.olist_marts.fact_orders`
GROUP BY 1
ORDER BY 1;
