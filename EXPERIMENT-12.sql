-- FINAL ADVANCED SET (SUBQUERY + CORRELATED + LOGIC)

-- 1. Employees whose salary < manager
-- but > salary of any other manager

SELECT e.ename
FROM employee e
JOIN employee m
ON e.mgr = m.empno
WHERE e.sal < m.sal
AND e.sal > ANY (
    SELECT sal
    FROM employee
    WHERE job = 'MANAGER'
);


-- 2. Number of employees whose salary > their manager

SELECT COUNT(*) AS total_employees
FROM employee e
JOIN employee m
ON e.mgr = m.empno
WHERE e.sal > m.sal;


-- 3. Managers not working under PRESIDENT
-- but working under some other manager

SELECT e.ename
FROM employee e
JOIN employee m
ON e.mgr = m.empno
WHERE e.job = 'MANAGER'
AND m.job <> 'PRESIDENT';


-- 4. Delete departments where no employee working

DELETE FROM department
WHERE deptno NOT IN (
    SELECT DISTINCT deptno
    FROM employee
);


-- 5. Delete employees whose deptno not in department table

DELETE FROM employee
WHERE deptno NOT IN (
    SELECT deptno
    FROM department
);


-- 6. Employees whose salary is out of salgrade range

SELECT ename, sal
FROM employee
WHERE sal NOT BETWEEN
(
    SELECT MIN(losal)
    FROM salgrade
)
AND
(
    SELECT MAX(hisal)
    FROM salgrade
);


-- 7. Employees whose net pay ≥ any employee salary

SELECT ename, sal, comm,
       (sal + IFNULL(comm, 0)) AS net_pay
FROM employee
WHERE (sal + IFNULL(comm, 0)) >= ANY (
    SELECT sal
    FROM employee
);


-- 8. Employees working in SALES or RESEARCH

SELECT e.ename
FROM employee e
JOIN department d
ON e.deptno = d.deptno
WHERE d.dname IN ('SALES', 'RESEARCH');


-- 9. Grade of JONES

SELECT s.grade
FROM employee e
JOIN salgrade s
ON e.sal BETWEEN s.losal AND s.hisal
WHERE e.ename = 'JONES';


-- 10. Department name where length of name =
-- number of employees in any department

SELECT d.dname
FROM department d
WHERE LENGTH(d.dname) IN (
    SELECT COUNT(*)
    FROM employee
    GROUP BY deptno
);