#End-to-End Churn Analysis Portfolio Project
##Introduction to Churn Analysis
In today's competitive business environment, retaining customers is crucial for long-term success. Churn analysis helps businesses understand and reduce customer attrition by identifying patterns and reasons behind customer departures. Businesses can use data analytics and machine learning to predict at-risk customers and take proactive steps to improve retention.
##Target Audience
This project focuses on churn analysis for a telecom firm, but the insights apply across industries like retail, finance, and healthcare.
##Project Goals
•	Build an ETL process in SQL Server
•	Develop a Power BI dashboard to analyze customer data
•	Study churner profiles and suggest marketing strategies
•	Implement a machine learning model to predict churn
##Metrics to Analyze
•	Total Customers
•	Total Churn & Churn Rate
•	New Joiners
________________________________________
##Step 1: ETL Process in SQL Server
Setting Up SQL Server
•	Download and install SQL Server Management Studio (SSMS)
•	Create a database using the query: 
•	CREATE DATABASE db_Churn;
Import Data
•	Use the Import Wizard to load the CSV into a  table (stg_Churn)
•	Set CustomerId as the primary key and convert BIT columns to VARCHAR(50)
Data Exploration
•	Check distinct values and count records by category
•	Identify missing values using: 
•	SELECT SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Customer_ID_Null_Count FROM stg_Churn;
•	Clean data and load it into a production table: 
•	SELECT *, ISNULL(Value_Deal, 'None') AS Value_Deal INTO [db_Churn].[dbo].[prod_Churn] FROM stg_Churn;
Create Views for Power BI
CREATE VIEW  VW_ChurnData AS SELECT * FROM prod_Churn WHERE Customer_Status IN ('Churned', 'Stayed');
CREATE VIEW  VW_JoinData AS SELECT * FROM prod_Churn WHERE Customer_Status = 'Joined';
________________________________________
##Step 2: Data Transformation in Power BI
Create New Columns
•	Churn Status: IF(Customer_Status = "Churned", 1, 0)
•	Monthly Charge Range: Categorize based on charge values
•	Age Group & Tenure Group: Create reference tables for segmentation
•	Unpivot Services Columns: Convert service-related columns into rows
________________________________________
##Step 3: Power BI Measures
Total Customers = COUNT(prod_Churn[Customer_ID])
New Joiners = CALCULATE(COUNT(prod_Churn[Customer_ID]), prod_Churn[Customer_Status] = "Joined")
Total Churn = SUM(prod_Churn[Churn Status])
Churn Rate = [Total Churn] / [Total Customers]
________________________________________
##Step 4: Power BI Visualization
Summary Page
1.	Top Metrics: 
o	Total Customers
o	New Joiners
o	Total Churn
o	Churn Rate
2.	Demographics: 
o	Gender-wise Churn Rate
o	Age Group vs. Churn Rate
3.	Account Info: 
o	Payment Method & Contract Impact
o	Tenure Group vs. Churn Rate
4.	Geographic: 
o	Top 5 States by Churn Rate
5.	Churn Distribution: 
o	Churn Category Breakdown
o	Tooltip: Churn Reason Analysis
6.	Service Analysis: 
o	Internet Type & Service Usage Impact
________________________________________
##Step 5: Predicting Customer Churn
Machine Learning Model (Random Forest)
•	Install Dependencies: 
•	pip install pandas numpy matplotlib seaborn scikit-learn joblib
•	Data Preparation in Python: 
•	import pandas as pd
•	from sklearn.model_selection import train_test_split
•	from sklearn.ensemble import RandomForestClassifier
•	from sklearn.metrics import classification_report
•	from sklearn.preprocessing import LabelEncoder


##Conclusion
This project demonstrates how to implement an end-to-end churn analysis pipeline using SQL Server, Power BI, and Python. The insights generated help businesses reduce customer churn and improve retention strategies through data-driven decision-making.


