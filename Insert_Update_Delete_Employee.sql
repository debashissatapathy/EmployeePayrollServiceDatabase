--UC1: create a payroll service database--
create database PayRollService
use PayRollService

--UC2: create a employee payroll table in the payroll service database--
create table employee_payroll(EmpId int identity(1,1) primary key,EmpName varchar(100),Salary int,StartDate date)

--UC3: create employee payroll data in the payroll service database as part of CRUD Operation - Use payroll_service database--
INSERT into employee_payroll values ('Rajesh',12000,'2022-12-04'),
									('Shreya',25000,'2022-08-04'),
									('Shivam',36000,'2022-05-10');
INSERT into employee_payroll values ('Krishna',10000,'2022-09-04','Male'),
									('Karishma',10000,'2022-12-04','Female');

--UC4: retrieve all the employee payroll data
SELECT * FROM employee_payroll;

--UC5: retrieve salary data for a particular employee as well as all employees who have joined in a particular data range from the payroll service database--
SELECT salary FROM employee_payroll WHERE EmpName = 'Shreya'
Select salary from employee_payroll WHERE StartDate BETWEEN CAST('2022-01-01'AS DATE) AND getdate();

--UC6: add Gender to Employee Payroll Table and Update the Rows to reflect the correct Employee Gender
Alter table employee_payroll add Gender Char(10);
update employee_payroll set Gender = 'Male' where EmpName = 'Rajesh' or EmpName = 'Shivam'
update employee_payroll set Gender = 'Female' where EmpName = 'Shreya' 

--UC7: find sum, average, min, max and number of male and female employees
SELECT SUM(Salary) Total_Sal, Gender FROM employee_payroll WHERE Gender = 'Female' GROUP BY Gender;

SELECT Avg(Salary) Avg_Sal FROM employee_payroll WHERE Gender = 'Male' GROUP BY Gender;

SELECT min(salary) Min_Sal FROM employee_payroll WHERE Gender = 'Female' GROUP BY Gender;

SELECT max(salary) Max_Sal FROM employee_payroll WHERE Gender = 'Female' GROUP BY Gender;

SELECT Gender, count(Gender) Count_Gender FROM employee_payroll WHERE Gender = 'Female' GROUP BY Gender;