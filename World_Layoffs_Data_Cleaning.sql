SELECT * FROM world_layoff.layoffs;


USE world_layoff;


SELECT *
FROM layoffs;


CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT * 
FROM layoffs_staging;


INSERT INTO layoffs_staging
SELECT * FROM layoffs;


SELECT COUNT(*)  
FROM layoffs;

SELECT COUNT(*) 
FROM layoffs_staging;



TRUNCATE TABLE layoffs_staging; 

INSERT INTO layoffs_staging
SELECT * FROM layoffs;

SELECT COUNT(*)
FROM layoffs;

SELECT COUNT(*)
FROM layoffs_staging;


SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,date,stage,
country,funds_raised_millions
	ORDER BY company)
    AS row_num
    FROM layoffs_staging;
    

WITH duplicate_cte AS
(
	SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,date,stage,
country,funds_raised_millions
	ORDER BY company)
    AS row_num
    FROM layoffs_staging
)    
SELECT *
FROM duplicate_cte
WHERE row_num > 1;


CREATE TABLE layoffs_staging2 AS
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,date,stage,
country,funds_raised_millions
	ORDER BY company)
    AS row_num
    FROM layoffs_staging;
    
    
    
    DELETE FROM layoffs_staging2
    WHERE row_num > 1;
    
    SELECT COUNT(*)
    FROM layoffs_staging2;
    
    
    SELECT *
    FROM layoffs_staging2
     WHERE row_num > 1; 
							 
    SELECT COUNT(*)
    FROM layoffs_staging2; 
     
 SELECT *
    FROM layoffs_staging2;   


SELECT DISTINCT company
FROM layoffs_staging2
ORDER BY company; 


SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY industry;  


SELECT DISTINCT industry
FROM layoffs_staging2
WHERE industry IS NOT NULL
ORDER BY industry;


SELECT industry,COUNT(*)
FROM layoffs_staging
WHERE industry IS NULL OR industry = 'NULL'
GROUP BY industry;


SELECT DISTINCT stage
FROM layoffs_staging2
WHERE stage IS NOT NULL
ORDER BY stage;

SELECT DISTINCT location
FROM layoffs_staging2
WHERE location IS NOT NULL
ORDER BY location;


SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY country;



SELECT DISTINCT country
FROM layoffs_staging2
WHERE country LIKE 'United States%';


UPDATE layoffs_staging2
SET country = 'United States'
WHERE country = 'United States.'; 



SELECT DISTINCT country
FROM layoffs_staging2
WHERE country LIKE 'United States%';


DESCRIBE layoffs_staging2;  

SELECT date
FROM layoffs_staging2
ORDER BY date;


UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y')
WHERE `date` IS NOT NULL;

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

DESCRIBE layoffs_staging2;

SELECT date
FROM layoffs_staging2;


SELECT
SUM(company IS NULL) AS null_company,
SUM(location IS NULL) AS null_location,
SUM(industry IS NULL) AS null_industry,
SUM(total_laid_off IS NULL) AS null_total_laid_off,
SUM(percentage_laid_off IS NULL) AS null_percentage_laid_of,
SUM(`date`IS NULL) AS null_date,
SUM(stage IS NULL) AS null_stage,
SUM(country IS NULL) AS null_country,
SUM(funds_raised_millions IS NULL) AS null_funds_raised_millions
FROM layoffs_staging2;



SELECT * 
FROM layoffs_staging2
WHERE total_laid_off IS NULL
	AND percentage_laid_off IS NULL;
    
    DELETE  
    FROM layoffs_staging2
WHERE total_laid_off IS NULL
	AND percentage_laid_off IS NULL;
    
 SELECT COUNT(*) AS missing_both
 FROM layoffs_staging
 WHERE total_laid_off IS NULL
	AND percentage_laid_off IS NULL;
    
   SELECT *
   FROM layoffs_staging2;
   
   
   
  ALTER TABLE layoffs_staging2
  DROP COLUMN row_num;
 
	SELECT *
   FROM layoffs_staging2;	
   
   DESCRIBE layoffs_staging2;

