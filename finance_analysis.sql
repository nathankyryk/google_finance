-- Average % Increase by Industry
SELECT ci.industry, (AVG(sd.percent_change))::NUMERIC(10, 2) AS avg_percent_increase
FROM stockdata SD
JOIN companyinfo CI ON sd.ticker = ci.ticker
GROUP BY ci.industry
ORDER BY avg_percent_increase DESC;

-- Companies With the Highest Return
SELECT sd.company_name, sd.percent_change, ci.industry
FROM stockdata SD 
JOIN companyinfo CI ON sd.ticker = ci.ticker
ORDER BY sd.percent_change DESC;

-- Companies With the Worst Return
SELECT sd.company_name, sd.percent_change, ci.industry
FROM stockdata SD 
JOIN companyinfo CI ON sd.ticker = ci.ticker
ORDER BY sd.percent_change ASC;

-- Cities with 3+ companies from the same industry headquartered within them
SELECT ci.headquarters, ci.industry, COUNT(ticker) AS company_count
FROM companyinfo CI
GROUP BY headquarters, industry
HAVING COUNT(ticker) >= 3
ORDER BY company_count DESC;

-- Company performance vs its industry's average
SELECT SD.company_name, CI.industry, 
	  (sd.percent_change)::NUMERIC(10, 2) AS company_return,
	  (AVG(SD.percent_change) OVER (PARTITION BY ci.industry))::NUMERIC(10,2) AS industry_avg,
	  ((sd.percent_change) - (AVG(sd.percent_change) OVER (PARTITION BY ci.industry)))::NUMERIC(10, 2) AS performance_vs_industry_avg
FROM stockdata SD
JOIN companyinfo CI ON sd.ticker = ci.ticker
ORDER BY ci.industry, performance_vs_industry_avg DESC;
	  