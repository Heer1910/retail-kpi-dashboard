-- ============================================
-- STAGING: ORDER ITEMS
-- Source: olist_raw.raw_order_items
-- Purpose:
--   - Standardize column names
--   - Cast types safely (INT64, NUMERIC, TIMESTAMP)
-- ============================================

CREATE OR REPLACE TABLE `supple-comfort-483102-b2.olist_stg.stg_order_items` AS
SELECT
  order_id,
  SAFE_CAST(order_item_id AS INT64) AS order_item_id,
  product_id,
  seller_id,

  -- If shipping_limit_date is already TIMESTAMP, this returns it.
  -- If it's STRING, SAFE_CAST will convert when possible; otherwise NULL.
  SAFE_CAST(shipping_limit_date AS TIMESTAMP) AS shipping_limit_ts,

  -- Monetary fields: handle STRING/FLOAT/NUMERIC safely into NUMERIC
  SAFE_CAST(price AS NUMERIC) AS price,
  SAFE_CAST(freight_value AS NUMERIC) AS freight_value

FROM `supple-comfort-483102-b2.olist_raw.raw_order_items`;