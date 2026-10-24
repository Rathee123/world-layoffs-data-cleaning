# World Layoffs Data Cleaning Using MySQL

## Project Overview

This project focuses on cleaning a global layoffs dataset using MySQL. The goal is to improve data quality and prepare the dataset for further analysis.

The project covers practical data-cleaning tasks, including identifying duplicate records, standardizing inconsistent values, handling missing data, and checking the quality of the cleaned dataset.

## Tools Used

* MySQL
* MySQL Workbench

## Dataset

The dataset contains information about company layoffs, including company names, locations, industries, the number and percentage of employees laid off, dates, company stages, countries, and funds raised.

## Data Cleaning Process

### 1. Created a Staging Table

Created a staging table to preserve the original dataset and perform cleaning operations on a separate copy.

### 2. Identified and Removed Duplicate Records

Used SQL window functions, including `ROW_NUMBER()`, to identify duplicate records based on multiple columns.

### 3. Standardized Data

Reviewed inconsistent values and standardized relevant company and industry information where appropriate.

### 4. Standardized Date Formats

Worked on converting date values into a consistent date format for reliable analysis.

### 5. Handled Missing and Blank Values

Identified `NULL` and blank values in relevant columns. Where a missing industry value could be reliably inferred from another record for the same company, it was updated. Unconfirmed values were left missing rather than guessed.

### 6. Reviewed Unnecessary Records

Reviewed records during the cleaning process and removed records considered unsuitable for the analysis.

### 7. Performed Data Quality Checks

Checked the cleaned dataset for duplicate records and missing values to assess its quality before further analysis.

## SQL Skills Demonstrated

* Data cleaning and preparation
* Creating and working with staging tables
* Window functions: `ROW_NUMBER()`
* Common Table Expressions (CTEs)
* Handling `NULL` and blank values
* Data standardization
* Date formatting
* Duplicate detection and removal
* Data quality checks

## Project File

* World_Layoffs_Data_Cleaning.sql — Contains the SQL queries used during the data-cleaning process.

## Outcome

The project provided practical experience in preparing raw data for analysis using SQL. It also demonstrated the importance of preserving original data, identifying data-quality issues, and avoiding unsupported assumptions when handling missing values.

The cleaned dataset was subsequently used for a separate Exploratory Data Analysis (EDA) project.

## Related Project

**World Layoffs Exploratory Data Analysis Using MySQL**

This project uses SQL to explore layoff trends across companies, industries, countries, and years.

## Author

Ratheena Aaskeen
