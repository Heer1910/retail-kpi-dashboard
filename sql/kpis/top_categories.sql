SELECT
  COALESCE(p.category_en, p.category_pt) AS category,
  SUM(i.gross_item_value) AS revenue,
  COUNT(DISTINCT i.order_id) AS orders,
  SAFE_DIVIDE(SUM(i.gross_item_value), COUNT(DISTINCT i.order_id)) AS aov
FROM `supple-comfort-483102-b2.olist_marts.fact_order_items` i
LEFT JOIN `supple-comfort-483102-b2.olist_marts.dim_product` p
  ON i.product_id = p.product_id
WHERE i.order_status = 'delivered'
GROUP BY 1
ORDER BY revenue DESC
LIMIT 20;
