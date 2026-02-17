# 🔹 RETRIEVING DATA – EMPLOYEE TABLE

## 1. Employees who joined before 30-Jun-1980 OR after 31-Dec-1981

```sql
SELECT * FROM employee
WHERE hiredate < '1980-06-30' OR hiredate > '1981-12-31';
```

## 2. Names of employees whose second alphabet is A

\_ → first character, A → second character

```sql
SELECT ename
FROM employee
WHERE ename LIKE '_A%';
```

## 3. Names of employees whose name is exactly 5 characters

```sql
SELECT ename
FROM employee
WHERE LENGTH(ename) = 5;
```

## 4. Names of employees whose second alphabet is A
(same as Q2 – repeated in syllabus)

```sql
SELECT ename FROM employee
WHERE ename LIKE '_A%';
```


## 5. Employees NOT working as salesman, clerk or analyst

```sql
SELECT ename
FROM employee
WHERE job NOT IN ('SALESMAN','CLERK','ANALYST');

```

## 6. Employee name & annual salary,
highest salary first

```sql
SELECT ename, sal*12 AS annual_salary FROM employee
ORDER BY sal DESC;
```

## 7. Name, sal, hra, pf, da, totalsal

HRA = 15% of sal

DA = 10% of sal

PF = 5% of sal

TotalSal = (sal + hra + da) − pf

```sql
SELECT
    ename,
    sal,
    sal*0.15 AS hra,
    sal*0.10 AS da,
    sal*0.05 AS pf,
    (sal + (sal*0.15) + (sal*0.10) - (sal*0.05)) AS totalsal
FROM employee
ORDER BY totalsal DESC;
```

📌 Important: This formula is logically correct for exams

## 8. Update salary by 10% increment

for employees NOT eligible for commission
```sql
UPDATE employee SET sal = sal + (sal * 0.10)
WHERE comm IS NULL OR comm = 0;
```
## 9. Employees whose salary is > 3000 after 20% increment

```sql
SELECT ename FROM employee WHERE sal + (sal * 0.20) > 3000;
```

## 10. Employees whose salary contains at least 3 digits

```sql
SELECT ename, sal FROM employee WHERE LENGTH(sal) >= 3;
```
