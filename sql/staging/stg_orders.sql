-- ============================================
-- STAGING: ORDERS
-- Source: olist_raw.raw_orders
-- Purpose:
--   - Standardize column names
--   - Create DATE fields for analytics
-- ============================================

CREATE OR REPLACE TABLE `supple-comfort-483102-b2.olist_stg.stg_orders` AS
SELECT
  -- Primary identifiers
  order_id,
  customer_id,

  -- Status
  order_status,

  -- Timestamps (already TIMESTAMP in raw)
  order_purchase_timestamp        AS order_purchase_ts,
  order_approved_at               AS order_approved_ts,
  order_delivered_carrier_date    AS order_delivered_carrier_ts,
  order_delivered_customer_date   AS order_delivered_customer_ts,
  order_estimated_delivery_date   AS order_estimated_delivery_ts,

  -- Derived DATE fields
  DATE(order_purchase_timestamp)      AS order_date,
  DATE(order_delivered_customer_date) AS delivered_date

FROM `supple-comfort-483102-b2.olist_raw.raw_orders`;