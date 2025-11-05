CREATE DATABASE IF NOT EXISTS analytics;
CREATE TABLE IF NOT EXISTS analytics.stg_sales_orders
(
  order_id String,
  customer_id String,
  order_ts DateTime,
  amount Decimal(18,2)
)
ENGINE = MergeTree()
PARTITION BY toYYYYMM(order_ts)
ORDER BY (order_ts, order_id);
