
USE OlistEcommerce;
GO
CREATE SCHEMA stg;
GO
CREATE SCHEMA dw;
GO
CREATE SCHEMA rpt;
GO

USE [olist-ecommerce-analytics];
GO

SELECT
    name AS SchemaName
FROM sys.schemas
WHERE name IN ('stg', 'dw', 'rpt')
ORDER BY name;

dw
rpt
stg