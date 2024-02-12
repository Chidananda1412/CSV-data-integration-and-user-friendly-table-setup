CREATE DATABASE IF NOT EXISTS AnnualEnterpriseSurvey;
USE AnnualEnterpriseSurvey;

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

LOAD DATA INFILE '/path/to/your/file.csv'
INTO TABLE FinancialData
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT * FROM FinancialData LIMIT 10; -- Example to display first 10 rows

-- Creating a separate table for industries
CREATE TABLE IF NOT EXISTS Industries (
    industry_code_ANZSIC INT PRIMARY KEY,
    industry_name VARCHAR(255)
);

-- Populate Industries table
INSERT INTO Industries (industry_code_ANZSIC, industry_name)
SELECT DISTINCT industry_code_ANZSIC, industry_name_ANZSIC FROM FinancialData;

-- Remove industry_name_ANZSIC column from FinancialData table
ALTER TABLE FinancialData DROP COLUMN industry_name_ANZSIC;

-- Add Foreign Key constraint to FinancialData table
ALTER TABLE FinancialData
ADD FOREIGN KEY (industry_code_ANZSIC) REFERENCES Industries(industry_code_ANZSIC);

DESCRIBE FinancialData; -- Check the modified FinancialData table
DESCRIBE Industries; -- Check the new Industries table

SELECT DISTINCT industry_name_ANZSIC FROM FinancialData;

SELECT * FROM FinancialData WHERE year = 2023;

SELECT variable, SUM(value) AS total_value FROM FinancialData GROUP BY variable;

-- Similarly any user friendly querry can be written to format the table as per the user intention.
