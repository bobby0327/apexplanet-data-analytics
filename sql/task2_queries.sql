-- Total Customers
SELECT COUNT(*) AS total_customers
FROM churn_data;

-- Churn Distribution
SELECT Churn,
       COUNT(*) AS customer_count
FROM churn_data
GROUP BY Churn;

-- Average Monthly Charges by Churn
SELECT Churn,
       ROUND(AVG(MonthlyCharges),2) AS avg_monthly_charges
FROM churn_data
GROUP BY Churn;

-- Customers by Contract
SELECT Contract,
       COUNT(*) AS total_customers
FROM churn_data
GROUP BY Contract;

-- Churn by Contract
SELECT Contract,
       Churn,
       COUNT(*) AS customers
FROM churn_data
GROUP BY Contract, Churn;

-- Internet Service Distribution
SELECT InternetService,
       COUNT(*) AS customers
FROM churn_data
GROUP BY InternetService;

-- Customers Paying Above Average Monthly Charges
SELECT customerID,
       MonthlyCharges
FROM churn_data
WHERE MonthlyCharges >
(
    SELECT AVG(MonthlyCharges)
    FROM churn_data
);

-- Top 10 Highest Monthly Charges
SELECT customerID,
       MonthlyCharges
FROM churn_data
ORDER BY MonthlyCharges DESC
LIMIT 10;

-- Window Function
SELECT customerID,
       MonthlyCharges,
       RANK() OVER
       (
           ORDER BY MonthlyCharges DESC
       ) AS charge_rank
FROM churn_data;

