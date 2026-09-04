-----data exploration where transaction id is null
SELECT *
FROM dbo.['SQL - Retail Sales Analysis_utf$']
WHERE transactions_id IS NULL;

---where sale date is null
SELECT *
FROM dbo.['SQL - Retail Sales Analysis_utf$']
WHERE sale_date IS NULL;

---where customer id is null
SELECT *
FROM dbo.['SQL - Retail Sales Analysis_utf$']
WHERE customer_id IS NULL;

--lets do where not null for customer
SELECT *
FROM dbo.['SQL - Retail Sales Analysis_utf$']
WHERE customer_id IS not NULL;

----lets do for the first top 20 customers where id is not null
    SELECT top 20*
   FROM dbo.['SQL - Retail Sales Analysis_utf$']
   WHERE customer_id IS not NULL;

   ----lets do for the last 20 customers where id is not null

   SELECT top 20*
   FROM dbo.['SQL - Retail Sales Analysis_utf$']
   WHERE customer_id IS not NULL
   order by customer_id DESC
   
   ------------CHECKING FOR ALL COLUMN WHERE IS NULL
   ------------data cleaning

   SELECT *
   FROM dbo.['SQL - Retail Sales Analysis_utf$']
   WHERE transactions_id is null
   OR
   sale_date is null
   OR
   sale_time is null
   OR
   gender is null
   OR
   age is null
   OR
   category is null
   OR
   quantiy is null;
   

   ----------shows age has null values and quantity
   ----------delete rows hwere they are run
   
   delete from dbo.['SQL - Retail Sales Analysis_utf$']

   WHERE transactions_id is null
   OR
   sale_date is null
   OR
   sale_time is null
   OR
   gender is null
   OR
   age is null
   OR
   category is null
   OR
   quantiy is null

   ----confirming them that are deleted
   SELECT *
FROM dbo.['SQL - Retail Sales Analysis_utf$']
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantiy IS NULL;

   -----check the count
   SELECT COUNT(*) AS TotalRows
FROM dbo.['SQL - Retail Sales Analysis_utf$'];

   ----total number of transactions
   SELECT SUM(transactions_id ) AS TotalTransactions
FROM dbo.['SQL - Retail Sales Analysis_utf$'];

--------
SELECT *
FROM dbo.['SQL - Retail Sales Analysis_utf$'];
--------cant calculate the total sales since theres no column  for total sales

-------- total quantity sold
         SELECT SUM(quantiy ) AS TotalQuantity
FROM dbo.['SQL - Retail Sales Analysis_utf$'];

------  how many customers hawe have 
       SELECT SUM(customer_id ) AS TotalCustomers
FROM dbo.['SQL - Retail Sales Analysis_utf$'];

----------distict customers
      SELECT COUNT(DISTINCT customer_id) AS TotalCustomers
FROM dbo.['SQL - Retail Sales Analysis_utf$'];

------ how mmany categories
   SELECT COUNT(DISTINCT category) AS TotalCategories
FROM dbo.['SQL - Retail Sales Analysis_utf$'];

SELECT COUNT( category) AS TotalCategories
FROM dbo.['SQL - Retail Sales Analysis_utf$'];

---business key problems
---retrive all columns for sales made 22-11-05

SELECT*
FROM dbo.['SQL - Retail Sales Analysis_utf$']
where sale_date = '2022-11-05'

----retrive all transactions where category is clothing and the quantity sold is more than 10 in the month of nov 22

SELECT 
    category,
    SUM(quantiy) AS TotalQuantity
FROM dbo.['SQL - Retail Sales Analysis_utf$']
WHERE category = 'Clothing'
  AND sale_date = '2022-11-22'
      AND quantiy < 4
GROUP BY category;
---------the average of age of customers who purchased items from the beauty category

select
  ROUND (AVG(age),2) 
  from dbo.['SQL - Retail Sales Analysis_utf$']
where category = 'Beauty'

------not rounding off whole numbeer
SELECT
    ROUND(AVG(age), 0) AS AverageAge
FROM dbo.['SQL - Retail Sales Analysis_utf$']
WHERE category = 'Beauty';

-- Find total number of transactions made by each gender in each category
SELECT
    category,
    gender,
    COUNT(transactions_id) AS TotalTransactions
FROM dbo.['SQL - Retail Sales Analysis_utf$']
GROUP BY
    category,
    gender;

    ----find avg sale of each months and the best sales months
   SELECT
    YEAR(sale_date) AS Year,
    MONTH(sale_date) AS Month
FROM dbo.['SQL - Retail Sales Analysis_utf$']
GROUP BY
    YEAR(sale_date),
    MONTH(sale_date)
ORDER BY
    YEAR(sale_date),
    MONTH(sale_date);
    ---------total quantity
    SELECT
    YEAR(sale_date) AS Year,
    MONTH(sale_date) AS Month,
    SUM(quantiy) AS TotalQuantity
FROM dbo.['SQL - Retail Sales Analysis_utf$']
GROUP BY
    YEAR(sale_date),
    MONTH(sale_date)
ORDER BY
    TotalQuantity DESC;

    --------top 5 curstomers according tou quantity sold
    SELECT TOP 5
    customer_id,
    SUM(quantiy) AS TotalQuantity
FROM dbo.['SQL - Retail Sales Analysis_utf$']
GROUP BY customer_id
ORDER BY TotalQuantity DESC;

-------find number of unique customers who purchased items of the same cattegory
select
    category,
    COUNT(DISTINCT customer_id) as UniqueCustomers
    FROM dbo.['SQL - Retail Sales Analysis_utf$']
    group by 
    category
