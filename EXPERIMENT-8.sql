-- RETRIEVING DATA – (EMPLOYEE + DEPARTMENT)

-- Create salgrade Table
CREATE TABLE salgrade (
    grade INT,
    losal INT,
    hisal INT
);

-- Insert values into salgrade
INSERT INTO salgrade VALUES
(1,700,1200),
(2,1201,1400),
(3,1401,2000),
(4,2001,3000),
(5,3001,9999);

-- 1. Display all employees with their department name
SELECT e.ename, d.dname
FROM employee e
JOIN department d ON e.deptno = d.deptno;

-- 2. Employees whose manager is JONES + show manager name (SELF JOIN)
SELECT e.ename AS employee, m.ename AS manager
FROM employee e
JOIN employee m ON e.mgr = m.empno
WHERE m.ename = 'JONES';

-- 3. Employee name, job, dept name, manager name, grade
SELECT 
    e.ename,
    e.job,
    d.dname,
    m.ename AS manager,
    s.grade
FROM employee e
JOIN department d ON e.deptno = d.deptno
LEFT JOIN employee m ON e.mgr = m.empno
JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
ORDER BY d.dname;

-- 4. Employees except CLERK, show name, job, grade, dept & sort by highest salary
SELECT 
    e.ename,
    e.job,
    d.dname,
    s.grade,
    e.sal
FROM employee e
JOIN department d ON e.deptno = d.deptno
JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE e.job <> 'CLERK'
ORDER BY e.sal DESC;

-- 5. Employee name, job & manager name (include employees without manager)
SELECT 
    e.ename,
    e.job,
    IFNULL(m.ename, 'No Manager') AS manager
FROM employee e
LEFT JOIN employee m ON e.mgr = m.empno;

-- 6. Employees earning 36000 annually OR not clerks
SELECT 
    e.ename,
    e.job,
    e.sal * 12 AS annual_salary,
    d.deptno,
    d.dname,
    s.grade
FROM employee e
JOIN department d ON e.deptno = d.deptno
JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE e.sal * 12 = 36000
   OR e.job <> 'CLERK';

-- 7. Employees earning 30000 annually AND not clerks
SELECT 
    e.ename,
    e.job,
    e.sal * 12 AS annual_salary,
    d.deptno,
    d.dname,
    s.grade
FROM employee e
JOIN department d ON e.deptno = d.deptno
JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE e.sal * 12 = 30000
  AND e.job <> 'CLERK';

-- 8. Employee & Manager names + numbers (SELF JOIN)
SELECT 
    e.empno,
    e.ename,
    IFNULL(m.empno, '-') AS mgr_no,
    IFNULL(m.ename, 'No Manager') AS manager
FROM employee e
LEFT JOIN employee m ON e.mgr = m.empno;

-- 9. Department name, deptno & sum of salaries
SELECT d.dname, d.deptno, SUM(e.sal) AS total_salary
FROM department d
JOIN employee e ON d.deptno = e.deptno
GROUP BY d.dname, d.deptno;

-- 10. Employee number, name & department location
SELECT e.empno, e.ename, d.loc
FROM employee e
JOIN department d ON e.deptno = d.deptno;

-- 11. Employee name & department name
SELECT e.ename, d.dname
FROM employee e
JOIN department d ON e.deptno = d.deptno;
