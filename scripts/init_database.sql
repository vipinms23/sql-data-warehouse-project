/*  
===================================================================
SQL Script: init_database.sql
===================================================================
Add comments to explain the purpose of each section of the code and the overall goal of the script.
Script Purpose:
This SQL script is designed to initialize a new database for a data warehouse project. It performs the following tasks:
1. Creates a new database named 'DataWarehouse'.
2. Sets the context to the newly created database.
3. Creates schemas for the medallion architecture layers: bronze, silver, and gold.
The medallion architecture is a common design pattern in data warehousing that organizes data into different layers based on the level of processing and refinement. The bronze layer typically contains raw, unprocessed data; the silver layer contains cleaned and transformed data; and the gold layer contains aggregated and optimized data for reporting and analysis.

WARNING:
This script will drop the 'DataWarehouse' database if it already exists, which will result in the loss of all data and objects within that database. Ensure that you have backed up any important data before running this script.

 */

-- Use the system database context to create a new database.
USE master;
GO
-- Create the project data warehouse database.
If EXISTS (SELECT name FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    DROP DATABASE DataWarehouse;
END
CREATE DATABASE DataWarehouse;
GO

-- Switch context to the newly created database.
USE DataWarehouse;
GO

-- Create schemas for the medallion architecture layers.
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
