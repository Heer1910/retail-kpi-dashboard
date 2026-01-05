-- ============================================
-- DIM: PRODUCT
-- Purpose: product attributes + category (English translation)
-- ============================================

CREATE OR REPLACE TABLE `supple-comfort-483102-b2.olist_marts.dim_product` AS
SELECT
  p.product_id,
  p.product_category_name AS category_pt,
  t.product_category_name_english AS category_en,

  SAFE_CAST(p.product_name_lenght AS INT64) AS product_name_length,
  SAFE_CAST(p.product_description_lenght AS INT64) AS product_description_length,
  SAFE_CAST(p.product_photos_qty AS INT64) AS product_photos_qty,

  SAFE_CAST(p.product_weight_g AS NUMERIC) AS product_weight_g,
  SAFE_CAST(p.product_length_cm AS NUMERIC) AS product_length_cm,
  SAFE_CAST(p.product_height_cm AS NUMERIC) AS product_height_cm,
  SAFE_CAST(p.product_width_cm  AS NUMERIC) AS product_width_cm
FROM `supple-comfort-483102-b2.olist_raw.raw_products` p
LEFT JOIN `supple-comfort-483102-b2.olist_stg.stg_category_translation` t
  ON p.product_category_name = t.product_category_name;
  