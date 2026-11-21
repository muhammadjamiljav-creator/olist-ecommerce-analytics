
-- ============================================================
-- PROJECT: Olist E-Commerce Analytics
-- PHASE: 02 - Staging Data Preparation
-- FILE: 02_move_tables_to_staging.sql
-- PURPOSE:
-- Move the nine originally imported CSV tables from dbo
-- into the stg schema and apply consistent raw table names.
-- ============================================================

USE [olist-ecommerce-analytics];
GO

-- TASK 1: Move customers table into stg schema

ALTER SCHEMA stg TRANSFER dbo.customers;
GO

EXEC sp_rename
    'stg.customers',
    'customers_raw';
GO

-- TASK 2: Move geolocation table into stg schema

ALTER SCHEMA stg TRANSFER dbo.geolocation;
GO

EXEC sp_rename
    'stg.geolocation',
    'geolocation_raw';
GO

-- TASK 3: Move order reviews table into stg schema
-- Original table name contains a trailing space.

ALTER SCHEMA stg TRANSFER dbo.[order reviews ];
GO

EXEC sp_rename
    'stg.[order reviews ]',
    'order_reviews_raw';
GO

-- TASK 4: Move order_items table into stg schema

ALTER SCHEMA stg TRANSFER dbo.order_items;
GO

EXEC sp_rename
    'stg.order_items',
    'order_items_raw';
GO

-- TASK 5: Move order_payments table into stg schema

ALTER SCHEMA stg TRANSFER dbo.order_payments;
GO

EXEC sp_rename
    'stg.order_payments',
    'order_payments_raw';
GO

-- TASK 6: Move orders table into stg schema

ALTER SCHEMA stg TRANSFER dbo.orders;
GO

EXEC sp_rename
    'stg.orders',
    'orders_raw';
GO

-- TASK 7: Move product category translation table into stg

ALTER SCHEMA stg TRANSFER dbo.product_category_name_translation;
GO

EXEC sp_rename
    'stg.product_category_name_translation',
    'category_translation_raw';
GO

-- TASK 8: Move products table into stg schema

ALTER SCHEMA stg TRANSFER dbo.products;
GO

EXEC sp_rename
    'stg.products',
    'products_raw';
GO

-- TASK 9: Move sellers table into stg schema

ALTER SCHEMA stg TRANSFER dbo.sellers;
GO

EXEC sp_rename
    'stg.sellers',
    'sellers_raw';
GO

-- ============================================================
-- END OF PHASE 02 TABLE ORGANIZATION
-- ============================================================

USE [olist-ecommerce-analytics];
GO

-- Verify all staging tables and their row counts

SELECT
    s.name AS SchemaName,
    t.name AS TableName,
    SUM(p.rows) AS TotalRows
FROM sys.tables t
INNER JOIN sys.schemas s
    ON t.schema_id = s.schema_id
LEFT JOIN sys.partitions p
    ON t.object_id = p.object_id
    AND p.index_id IN (0, 1)
WHERE s.name = 'stg'
GROUP BY s.name, t.name
ORDER BY t.name;
GO