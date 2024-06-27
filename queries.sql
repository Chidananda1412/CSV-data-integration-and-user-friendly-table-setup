-- Create database and use it
CREATE DATABASE IF NOT EXISTS AnnualEnterpriseSurvey;
USE AnnualEnterpriseSurvey;

-- Create FinancialData table
CREATE TABLE IF NOT EXISTS FinancialData (
    id INT PRIMARY KEY AUTO_INCREMENT,
    year INT,
    industry_code_ANZSIC INT,
    industry_name_ANZSIC VARCHAR(255),
    rme_size_grp VARCHAR(50),
    variable VARCHAR(50),
    value DECIMAL(18, 2),
    unit VARCHAR(50)
);

-- Load data into FinancialData table
-- Ensure file path is correct and server has required permissions
LOAD DATA INFILE '/path/to/your/file.csv'
INTO TABLE FinancialData
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- Display first 10 rows to verify data load
SELECT * FROM FinancialData LIMIT 10;

-- Create Industries table
CREATE TABLE IF NOT EXISTS Industries (
    industry_code_ANZSIC INT PRIMARY KEY,
    industry_name VARCHAR(255)
);

-- Populate Industries table with distinct industry codes and names
INSERT INTO Industries (industry_code_ANZSIC, industry_name)
SELECT DISTINCT industry_code_ANZSIC, industry_name_ANZSIC FROM FinancialData;

-- Ensure no orphan industry_code_ANZSIC values before dropping column and adding FK
ALTER TABLE FinancialData DROP COLUMN industry_name_ANZSIC;

-- Add foreign key constraint
ALTER TABLE FinancialData
ADD FOREIGN KEY (industry_code_ANZSIC) REFERENCES Industries(industry_code_ANZSIC);

-- Describe tables to verify changes
DESCRIBE FinancialData;
DESCRIBE Industries;

-- Display distinct industry names from FinancialData
SELECT DISTINCT industry_name_ANZSIC FROM FinancialData;

-- Example queries
SELECT * FROM FinancialData WHERE year = 2023;

SELECT variable, SUM(value) AS total_value FROM FinancialData GROUP BY variable;
