-- ============================================
-- FACT: ORDERS
-- Grain: one row per order
-- Purpose:
--   - Order counts
--   - Delivery time
--   - Cancellation rate
-- ============================================

CREATE OR REPLACE TABLE `supple-comfort-483102-b2.olist_marts.fact_orders` AS
SELECT
  order_id,
  customer_id,
  order_status,
  order_purchase_ts,
  order_date,
  delivered_date,

  -- Delivery duration (NULL if not delivered)
  DATE_DIFF(delivered_date, order_date, DAY) AS delivery_days,

  -- Flags
  IF(order_status = 'delivered', 1, 0) AS is_delivered,
  IF(order_status = 'canceled', 1, 0) AS is_canceled

FROM `supple-comfort-483102-b2.olist_stg.stg_orders`;