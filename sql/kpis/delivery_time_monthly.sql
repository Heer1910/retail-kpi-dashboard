SELECT
  DATE_TRUNC(order_date, MONTH) AS month,
  AVG(delivery_days) AS avg_delivery_days
FROM `supple-comfort-483102-b2.olist_marts.fact_orders`
WHERE is_delivered = 1
GROUP BY 1
ORDER BY 1;
