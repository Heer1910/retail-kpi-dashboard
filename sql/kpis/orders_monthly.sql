SELECT
  DATE_TRUNC(order_date, MONTH) AS month,
  COUNT(DISTINCT order_id) AS orders
FROM `supple-comfort-483102-b2.olist_marts.fact_orders`
GROUP BY 1
ORDER BY 1;
