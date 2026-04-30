-- FINAL SET (EMP + DEPT + SALGRADE)

-- 1. Employees from Dept 10 whose salary is greater than ANY employee in other departments

SELECT ename
FROM employee
WHERE deptno = 10
AND sal > ANY (
    SELECT sal 
    FROM employee 
    WHERE deptno <> 10
);

-- ANY → at least one value


-- 2. Employees from Dept 10 whose salary is greater than ALL employees in other departments

SELECT ename
FROM employee
WHERE deptno = 10
AND sal > ALL (
    SELECT sal 
    FROM employee 
    WHERE deptno <> 10
);

-- ALL → greater than every value


-- 3. Employees in SALES dept with grade = 3

SELECT e.*
FROM employee e
JOIN department d 
ON e.deptno = d.deptno
JOIN salgrade s 
ON e.sal BETWEEN s.losal AND s.hisal
WHERE d.dname = 'SALES'
AND s.grade = 3;


-- 4. Employees who are not managers

SELECT *
FROM employee
WHERE job <> 'MANAGER';


-- 5. Employees whose manager name is JONES

SELECT e.ename
FROM employee e
JOIN employee m 
ON e.mgr = m.empno
WHERE m.ename = 'JONES';


-- 6. Employees working in SALES department

SELECT e.ename
FROM employee e
JOIN department d 
ON e.deptno = d.deptno
WHERE d.dname = 'SALES';


-- 7. Employee name, deptname, salary, comm
-- Salary between 2000–5000 and location = CHICAGO

SELECT e.ename, d.dname, e.sal, e.comm
FROM employee e
JOIN department d 
ON e.deptno = d.deptno
WHERE e.sal BETWEEN 2000 AND 5000
AND d.location = 'CHICAGO';


-- 8. Employees whose salary is greater than their manager

SELECT e.ename
FROM employee e
JOIN employee m 
ON e.mgr = m.empno
WHERE e.sal > m.sal;


-- 9. Employees working in the same department as their manager

SELECT e.ename
FROM employee e
JOIN employee m 
ON e.mgr = m.empno
WHERE e.deptno = m.deptno;


-- 10. Employee Grade & employee name
-- Dept = 10 or 30, grade ≠ 4, joined before 31-Dec-1982

SELECT e.ename, s.grade
FROM employee e
JOIN salgrade s 
ON e.sal BETWEEN s.losal AND s.hisal
WHERE e.deptno IN (10, 30)
AND s.grade <> 4
AND e.hiredate < '1982-12-31';