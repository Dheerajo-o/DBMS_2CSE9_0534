# RETRIEVING DATA USING EMPLOYEE TABLE

## 1. List all distinct jobs in Employee table

```sql
SELECT DISTINCT job FROM Employee;
```

Removes duplicate job names

## 2. List all information about employees in Department 30

```sql
SELECT * FROM Employee WHERE deptno = 30;
```

## 3. Find all department numbers with department names greater than 20

```sql
SELECT deptno FROM department WHERE deptno > 20;
```

(Interpreted as deptno > 20)

## 4. Find all information about managers and clerks in department 30

```sql
SELECT * FROM employee
WHERE deptno = 30 AND job IN ('MANAGER','CLERK');
```

## 5. List Employee name, Employee number, Department of all clerks

```sql
SELECT empno, ename, deptno FROM employee
WHERE job = 'CLERK';
```

## 6. Find all managers NOT in department 30

```sql
SELECT * FROM employee
WHERE job = 'MANAGER' AND deptno <> 30;
```

## 7. List all employees in department 10 who are not managers or clerks

```sql
SELECT * FROM employee
WHERE deptno = 10 AND job NOT IN ('MANAGER','CLERK');
```

## 8. Find employees and jobs earning between 1200 and 1400

```sql
SELECT ename, job, sal FROM employee
WHERE sal BETWEEN 1200 AND 1400;
```

## 9. List Name and Department Number of employees who are

```sql
SELECT ename, deptno FROM employee
WHERE job IN ('CLERK','ANALYST','SALESMAN');
```

clerks, analyst or salesman

## 10. List Name and Department Number of employees whose names begin with M

```sql
SELECT ename, deptno FROM employee
WHERE ename LIKE 'M%';
```
