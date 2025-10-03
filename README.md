# SQL project on Google Finance stock data
This is an end-to-end data-driven project using Google Sheets, SQL, and Power BI, where I analyzed the stock performance of companies and their industries, as well as the headquarters geography of eighty major companies across eight distinct industries.

## Data Collection (2023-2025)
I collected this data using the 'GOOGLEFINANCE' function in Google Sheets. The data is structured across two separate CSV files, which are linked by the 'ticker' and 'company_name' properties.
'CompanyInfo.csv' - Contains company information for one hundred and sixty companies across eight distinct industries, with twenty companies per industry. The city where each company is headquartered is also noted.
'StockData.csv' - Contains the collected start price, end price, price change, and percent change for each company's stocks, as well as their tickers and company names. 

---

## SQL Queries and Analysis Goals:
My project will utilize SQL joins, aggregate functions, and window functions to:
1) Determine the average percent change for each of the eight industries over the period and analyze the best and worst performers.
2) Identify which company has the highest stock return if bought on 01-01-2023 and sold on 06-01-2025.
3) Analyze the correlation between industries and the companies that are headquartered within particular cities, such as how Texas houses many energy-related companies.
4) Incorporate visualization using Power BI.
