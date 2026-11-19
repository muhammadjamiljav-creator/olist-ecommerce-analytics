-- Create database schemas for Olist Ecommerce Analytics

-- Select the OlistEcommerce database
USE OlistEcommerce;
GO

-- Create staging schema for raw imported data
CREATE SCHEMA stg;
GO

-- Create data warehouse schema for cleaned data
CREATE SCHEMA dw;
GO

-- Create reporting schema for reports and analysis
CREATE SCHEMA rpt;
GO

-- Select the project database for schema verification
USE [olist-ecommerce-analytics];
GO

-- Verify that all three schemas have been created
SELECT
    name AS SchemaName
FROM sys.schemas
WHERE name IN ('stg', 'dw', 'rpt')
ORDER BY name;