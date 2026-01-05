WITH rev AS (
  SELECT
    DATE_TRUNC(order_date, MONTH) AS month,
    SUM(gross_item_value) AS revenue
  FROM `supple-comfort-483102-b2.olist_marts.fact_order_items`
  WHERE order_status = 'delivered'
  GROUP BY 1
),
ord AS (
  SELECT
    DATE_TRUNC(order_date, MONTH) AS month,
    COUNT(DISTINCT order_id) AS orders
  FROM `supple-comfort-483102-b2.olist_marts.fact_orders`
  GROUP BY 1
)
SELECT
  rev.month,
  rev.revenue,
  ord.orders,
  SAFE_DIVIDE(rev.revenue, ord.orders) AS aov
FROM rev
JOIN ord USING (month)
ORDER BY 1;
