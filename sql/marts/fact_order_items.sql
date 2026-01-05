-- ============================================
-- FACT: ORDER ITEMS
-- Grain: one row per order item
-- Purpose:
--   - Revenue analysis
--   - Product/category performance
-- ============================================

CREATE OR REPLACE TABLE `supple-comfort-483102-b2.olist_marts.fact_order_items`
PARTITION BY DATE(order_purchase_ts)
CLUSTER BY product_id, seller_id AS
SELECT
  -- Keys
  i.order_id,
  i.order_item_id,
  o.customer_id,
  i.product_id,
  i.seller_id,

  -- Order info
  o.order_status,
  o.order_purchase_ts,
  o.order_date,

  -- Monetary values
  i.price,
  i.freight_value,
  (i.price + i.freight_value) AS gross_item_value

FROM `supple-comfort-483102-b2.olist_stg.stg_order_items` i
JOIN `supple-comfort-483102-b2.olist_stg.stg_orders` o
  ON i.order_id = o.order_id;