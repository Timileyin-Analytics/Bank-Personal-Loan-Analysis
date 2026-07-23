Question 1
How many customers are in the dataset?
select count(id) as No_customers
from bank_personal_loan_modelling_12;

Question 2
select round(count(case when Personal_Loan = 1 then 1 end) *100.0)/ count(*) as accepted_loan
from bank_personal_loan_modelling_12; 


Question 3
What is the average income of customers?

SELECT ROUND(AVG(Income),2) AS Average_Income
FROM bank_personal_loan_modelling_12;


Question 4
Which education level has the highest loan acceptance?

SELECT Education,
       SUM(Personal_Loan) AS Accepted_Loans
FROM bank_personal_loan_modelling_12
GROUP BY Education
ORDER BY Accepted_Loans DESC;

Question 5
Does income affect loan acceptance?

SELECT Personal_Loan,
       ROUND(AVG(Income),2) AS Average_Income
FROM bank_personal_loan_modelling_12
GROUP BY Personal_Loan;


Question 6
Which age group accepts loans the most?

SELECT CASE
         WHEN Age BETWEEN 18 AND 25 THEN '18-25'
         WHEN Age BETWEEN 26 AND 35 THEN '26-35'
         WHEN Age BETWEEN 36 AND 45 THEN '36-45'
         ELSE '46+'
       END AS age_grp,
       SUM(Personal_Loan) AS Accepted_Loans
FROM bank_personal_loan_modelling_12
GROUP BY age_grp
ORDER BY Accepted_Loans DESC;


Question 7
Does having a credit card influence loan acceptance?

SELECT CreditCard,
       COUNT(*) AS Total_Customers,
       SUM(Personal_Loan) AS Accepted_Loans,
       ROUND(SUM(Personal_Loan) * 100.0 / COUNT(*),2) AS Acceptance_Rate
FROM bank_personal_loan_modelling_12
GROUP BY CreditCard;


Question 8
Does online banking usage affect loan acceptance?

select online, sum(personal_loan) as loan
from bank_personal_loan_modelling_12
group by online ;


Question 9
Does family size influence loan acceptance?

select Family,sum(personal_loan) as accepted_loan,count(*)as Customers
from bank_personal_loan_modelling_12
group by Family
order by family desc;
