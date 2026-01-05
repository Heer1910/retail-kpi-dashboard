SELECT
  i.product_id,
  SUM(i.gross_item_value) AS revenue,
  COUNT(DISTINCT i.order_id) AS orders
FROM `supple-comfort-483102-b2.olist_marts.fact_order_items` i
WHERE i.order_status = 'delivered'
GROUP BY 1
ORDER BY revenue DESC
LIMIT 20;

