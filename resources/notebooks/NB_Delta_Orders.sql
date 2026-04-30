-- Databricks notebook source
-- Create a streaming table
CREATE OR REFRESH STREAMING TABLE ST_ORDERS
AS
SELECT * FROM STREAM(samples.tpch.orders)

-- COMMAND ----------

CREATE OR REPLACE MATERIALIZED VIEW agg_orders
AS 
SELECT COUNT(o_orderkey) as total_orders,
o_orderstatus
FROM st_orders
group by o_orderstatus
