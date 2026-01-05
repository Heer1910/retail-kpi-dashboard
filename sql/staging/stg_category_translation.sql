-- ============================================
-- STAGING: CATEGORY TRANSLATION
-- Source: olist_raw.raw_category_translation
-- Purpose: Rename string_field_* to meaningful column names
-- ============================================

CREATE OR REPLACE TABLE `supple-comfort-483102-b2.olist_stg.stg_category_translation` AS
SELECT
  string_field_0 AS product_category_name,
  string_field_1 AS product_category_name_english
FROM `supple-comfort-483102-b2.olist_raw.raw_category_translation`;