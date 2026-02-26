-- RETRIEVING DATA (Functions & Aggregates)

-- 1. Compute number of days remaining in this year
SELECT DATEDIFF(
        MAKEDATE(YEAR(CURDATE()) + 1, 1),
        CURDATE()
       ) AS days_remaining;

-- 2. Highest salary, Lowest salary & Difference
SELECT
    MAX(sal) AS highest_salary,
    MIN(sal) AS lowest_salary,
    MAX(sal) - MIN(sal) AS difference
FROM employee;

-- 3. Employees whose commission > 25% of salary
SELECT ename, sal, comm
FROM employee
WHERE comm > sal * 0.25;

-- 4. Display salary in Dollar format
SELECT ename,
       CONCAT('$', sal) AS salary
FROM employee;

-- 5. Matrix Query (Pivot Style) Salary per job based on department
SELECT
    job,
    SUM(CASE WHEN deptno = 10 THEN sal ELSE 0 END) AS dept10,
    SUM(CASE WHEN deptno = 20 THEN sal ELSE 0 END) AS dept20,
    SUM(CASE WHEN deptno = 30 THEN sal ELSE 0 END) AS dept30,
    SUM(CASE WHEN deptno = 40 THEN sal ELSE 0 END) AS dept40,
    SUM(sal) AS total_salary
FROM employee
GROUP BY job;

-- 6. Total employees & employees hired per year
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN YEAR(hiredate)=1980 THEN 1 ELSE 0 END) AS y1980,
    SUM(CASE WHEN YEAR(hiredate)=1981 THEN 1 ELSE 0 END) AS y1981,
    SUM(CASE WHEN YEAR(hiredate)=1982 THEN 1 ELSE 0 END) AS y1982,
    SUM(CASE WHEN YEAR(hiredate)=1983 THEN 1 ELSE 0 END) AS y1983
FROM employee;

-- 7. Last Sunday of February 2026
SELECT DATE_SUB(
        LAST_DAY('2026-02-01'),
        INTERVAL (DAYOFWEEK(LAST_DAY('2026-02-01')) - 1) DAY
       ) AS last_sunday;

-- 8. Department numbers & total employees per department
SELECT deptno,
       COUNT(*) AS total_employees
FROM employee
GROUP BY deptno;

-- 9. Jobs & total employees per job
SELECT job,
       COUNT(*) AS total_employees
FROM employee
GROUP BY job;

-- 10. Department numbers & total salary per department
SELECT deptno,
       SUM(sal) AS total_salary
FROM employee
GROUP BY deptno;
