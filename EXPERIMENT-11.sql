-- SET 11 (ULTIMATE QUESTIONS)

-- 1. Delete employees who joined before 31-Dec-1982
-- and dept location is NEW YORK or CHICAGO

DELETE e
FROM employee e
JOIN department d 
ON e.deptno = d.deptno
WHERE e.hiredate < '1982-12-31'
AND d.location IN ('NEW YORK', 'CHICAGO');


-- 2. Employee name, job, deptname, location (only managers)

SELECT e.ename, e.job, d.dname, d.location
FROM employee e
JOIN department d 
ON e.deptno = d.deptno
WHERE e.job = 'MANAGER';


-- 3. Name & salary of FORD if his salary = highest in his grade

SELECT e.ename, e.sal
FROM employee e
JOIN salgrade s 
ON e.sal BETWEEN s.losal AND s.hisal
WHERE e.ename = 'FORD'
AND e.sal = (
    SELECT MAX(e2.sal)
    FROM employee e2
    JOIN salgrade s2 
    ON e2.sal BETWEEN s2.losal AND s2.hisal
    WHERE s2.grade = s.grade
);


-- 4. Top 5 earners in company

SELECT ename, sal
FROM employee
ORDER BY sal DESC
LIMIT 5;


-- 5. Employees getting highest salary

SELECT ename
FROM employee
WHERE sal = (
    SELECT MAX(sal) 
    FROM employee
);


-- 6. Employees whose salary = average of max & min

SELECT ename
FROM employee
WHERE sal = (
    (SELECT MAX(sal) FROM employee) +
    (SELECT MIN(sal) FROM employee)
) / 2;


-- 7. Department names where at least 3 employees working

SELECT d.dname
FROM employee e
JOIN department d 
ON e.deptno = d.deptno
GROUP BY d.dname
HAVING COUNT(*) >= 3;


-- 8. Managers whose salary > average company salary

SELECT ename
FROM employee
WHERE job = 'MANAGER'
AND sal > (
    SELECT AVG(sal) 
    FROM employee
);


-- 9. Managers whose salary > average salary of their employees

SELECT m.ename
FROM employee m
WHERE m.job = 'MANAGER'
AND m.sal > (
    SELECT AVG(e.sal)
    FROM employee e
    WHERE e.mgr = m.empno
);


-- 10. Employees whose salary > any employee salary
-- (using net pay = salary + commission)

SELECT ename, sal, comm,
(
    sal + IFNULL(comm, 0)
) AS net_pay
FROM employee
WHERE (
    sal + IFNULL(comm, 0)
) >= ANY (
    SELECT sal 
    FROM employee
);