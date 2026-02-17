# 🔹 AGGREGATE & STRING FUNCTIONS (EMPLOYEE TABLE)

## 1. Total number of employees working in the company

```sql
SELECT COUNT(*) AS total_employees FROM employee;
```

## 2. Total salary being paid to all employees

```sql
SELECT SUM(sal) AS total_salary FROM employee;
```

## 3. Maximum salary from employee table

```sql
SELECT MAX(sal) AS max_salary FROM employee;
```

## 4. Minimum salary from employee table

```sql
SELECT MIN(sal) AS min_salary FROM employee;
```

## 5. Average salary from employee table

```sql
SELECT AVG(sal) AS avg_salary FROM employee;
```

## 6. Maximum salary being paid to clerks

```sql
SELECT MAX(sal) AS max_clerk_salary FROM employee
WHERE job = 'CLERK';
```

## 7. Maximum salary being paid in department no 20

```sql
SELECT MAX(sal) AS max_dept20_salary FROM employee
WHERE deptno = 20;
```

## 8. Minimum salary paid to any salesman

```sql
SELECT MIN(sal) AS min_salesman_salary FROM employee
WHERE job = 'SALESMAN';
```

## 9. Average salary drawn by managers

```sql
SELECT AVG(sal) AS avg_manager_salary FROM employee
WHERE job = 'MANAGER';
```

## 10. Total salary drawn by analyst working in dept 40

```sql
SELECT SUM(sal) AS total_analyst_salary FROM employee
WHERE job = 'ANALYST' AND deptno = 40;
```

# 🔹 STRING FUNCTIONS

## 11. Display employee names in UPPERCASE

```sql
SELECT UPPER(ename)
FROM employee;
```

## 12. Display employee names in LOWERCASE

```sql
SELECT LOWER(ename) FROM employee;
```

## 13. Display employee names in Proper Case

```sql
SELECT CONCAT(
       UPPER(LEFT(ename,1)),
       LOWER(SUBSTRING(ename,2))
) AS Proper_Name FROM employee;
```

## 14. Display the length of your name

```sql
SELECT LENGTH('MOHAMMAD TASIN') AS name_length;
```

## 15. Display the length of all employee names

```sql
SELECT ename, LENGTH(ename) AS name_length FROM employee;
```
