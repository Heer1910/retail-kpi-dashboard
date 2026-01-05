SELECT
  DATE_TRUNC(order_date, MONTH) AS month,
  SUM(gross_item_value) AS revenue
FROM `supple-comfort-483102-b2.olist_marts.fact_order_items`
WHERE order_status = 'delivered'
GROUP BY 1
ORDER BY 1;