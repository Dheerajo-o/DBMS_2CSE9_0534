## 1. Create Database

```sql
CREATE DATABASE cse9_534;
USE cse9_534;
```

## 2. Create DEPARTMENT table

```sql

CREATE TABLE department (
    deptno INT (2) PRIMARY KEY,
    dname VARCHAR(15) NOT NULL
);
```

## 3. Create EMPLOYEE table

```sql
CREATE TABLE employee (
    empno INT(4) PRIMARY KEY,
    ename VARCHAR(20) NOT NULL,
    job VARCHAR(20),
    mgr INT(4),
    hiredate DATE,
    sal DECIMAL(10,0),
    comm DECIMAL(7,0),
    deptno INT(2),
    FOREIGN KEY (deptno) REFERENCES department(deptno)
);
```

## 4. INSERT VALUES INTO DEPARTMENT

```sql

INSERT INTO department VALUES
(10,'RESEARCH'),
(20,'ACCOUNTING'),
(30,'SALES'),
(40,'OPERATIONS');
```

## 5. INSERT VALUES INTO EMPLOYEE

```sql
INSERT INTO employee VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,NULL,20),
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30),
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,300,30),
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,NULL,20),
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30),
(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,NULL,30),
(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,NULL,20),
(7788,'SCOTT','ANALYST',7566,'1982-12-09',3000,NULL,40),
(7839,'KING','PRESIDENT',NULL,'1981-11-17',5000,NULL,20),
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30),
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,NULL,20),
(7900,'JAMES','CLERK',7698,'1981-12-03',950,NULL,30),
(7902,'FORD','ANALYST',7566,'1981-12-03',3000,NULL,20),
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,NULL,10);
```

### Show Records

```sql
SELECT * FROM employee;
SELECT * FROM department;
```

## REQUIRED QUERIES

## 1. Create Employee_master table with data using Employee table

```sql
CREATE TABLE employee_master AS
SELECT * FROM employee;
```

## 2. Delete all records from Employee_master whose DeptNo is 10

```sql
DELETE FROM employee_master
WHERE deptno = 10;
```

## 3. Update salary by 10% for DeptNo 20

```sql
UPDATE employee_master
SET sal = sal + (sal * 0.10)
WHERE deptno = 20;
```

## 4. Alter SAL with size 10,2 in Employee_master

```sql
ALTER TABLE employee_master
MODIFY sal DECIMAL(10,2);
```

## 5. Drop Employee_master table

```sql
DROP TABLE employee_master;
```
---
## -- CHECK OUTPUT

```sql
SELECT * FROM employee;
SELECT * FROM department;
SELECT * FROM employee_master;
```