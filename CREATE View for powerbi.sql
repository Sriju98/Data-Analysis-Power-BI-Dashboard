Create View VW_ChurnData as 
Select * from prod_Churn where Customer_Status In ('Churned','Stayed')

Create View VW_JoinData as 
Select * from prod_Churn where Customer_Status = 'Joined'

