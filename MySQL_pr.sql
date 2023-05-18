USE mypractice;

show tables;

-- Creating Worker Table
CREATE TABLE WORKER
(
 WORKER_ID INT NOT NULL auto_increment PRIMARY KEY,
 FIRST_NAME varchar(50),
 LAST_NAME varchar(50),
 SALARY INT,
 JOINING_DATE DATETIME,
 DEPARTMENT CHAR(20)
);

-- Inserting Data in Worker Table
INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
-- Displaying Worker Table

SELECT * FROM WORKER;        

-- Creating Bonus Table
CREATE TABLE BONUS
(
WORKER_REF_ID INT,
BONUS_DATE DATETIME,
BONUS_AMOUNT INT(10),
FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

-- Inserting data in Bonus Table 
INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');

-- Displaying Bonus Table
SELECT * FROM BONUS;

-- Creating Title Table
CREATE TABLE TITLE
(
WORKER_REF_ID INT,
WORKER_TITLE VARCHAR(75),
AFFECTED_FROM DATETIME,
foreign key(WORKER_REF_ID)
REFERENCES WORKER(WORKER_ID) ON DELETE CASCADE
);

-- Inserting Data in Title Table
INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');

-- Displaying Data in Title Table
SELECT * FROM TITLE;

/* Write an SQL query to 
 fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>.
 */
 
 SELECT FIRST_NAME AS WORKER_NAME FROM WORKER;
 
 /* Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case. */
 
 SELECT UPPER(FIRST_NAME) FROM WORKER;
 
 /* Write an SQL query to fetch unique values of DEPARTMENT from the Worker table. */
 
 SELECT DISTINCT(DEPARTMENT) FROM WORKER;
 
 /* Write an SQL query to print the first 
 three characters of  FIRST_NAME from the Worker table. */
 
 SELECT SUBSTR(FIRST_NAME,1,3) FROM WORKER;
 
 /* Write an SQL query to find the position of the alphabet (‘a’) 
 in the first name column ‘Amitabh’ from the Worker table. */
 
 Select INSTR(FIRST_NAME, BINARY'a') from Worker where FIRST_NAME = 'Amitabh';
 
 /* Write an SQL query to print the FIRST_NAME 
 from the Worker table after removing white spaces from the right side. */
 
 SELECT RTRIM(FIRST_NAME) FROM WORKER;
 
 /* Write an SQL query to print the DEPARTMENT from the Worker 
 table after removing white spaces from the left side. */
 
 SELECT LTRIM(DEPARTMENT) FROM WORKER;
 
 /* Write an SQL query that fetches the 
 unique values of DEPARTMENT from the Worker table and prints its length. */
 
 SELECT DISTINCT(length(DEPARTMENT)) FROM WORKER;
 
 /* Write an SQL query to print the FIRST_NAME from the 
 Worker table after replacing ‘a’ with ‘A’. */
 
 SELECT replace(FIRST_NAME,'a','A') FROM WORKER;
 
 /* Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker 
 table into a single column COMPLETE_NAME. A space char should separate them. */
 
 SELECT CONCAT(FIRST_NAME ,' ',LAST_NAME) AS COMPLETE_NAME FROM WORKER;
 
 /* Write an SQL query to print all
 Worker details from the Worker table order by FIRST_NAME Ascending.
 */
 
 SELECT * FROM WORKER ORDER BY FIRST_NAME ASC;
 
 /* Write an SQL query to print all Worker details from the 
 Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending. */
 
 SELECT * FROM WORKER ORDER BY FIRST_NAME ASC , DEPARTMENT DESC;
 
 /* Write an SQL query to print details for 
 Workers with the first names “Vipul” and “Satish” from the Worker table. */
 
 SELECT * FROM WORKER WHERE FIRST_NAME IN ("Vipul","Satish");
 
 /* Write an SQL query to print details of workers
 excluding first names, “Vipul” and “Satish” from the Worker table. */
 
 SELECT * FROM WORKER WHERE FIRST_NAME NOT IN ("Vipul","Satish");
 
 /* Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”. */
 SELECT * FROM WORKER WHERE DEPARTMENT LIKE "%Admin";
 
 /* Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’. */
 SELECT * FROM WORKER WHERE FIRST_NAME LIKE "%a%";
 
 /* Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’. */
 
 /* Write an SQL query to print details of the 
 Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. */
 
 SELECT * FROM WORKER WHERE FIRST_NAME LIKE "_____h";
 
 /* Write an SQL query to 
 print details of the Workers whose SALARY lies between 100000 and 500000. */
 
 SELECT * FROM WORKER WHERE SALARY BETWEEN 100000 AND 500000;
 
 /* Write an SQL query to print details of the Workers who joined in Feb’2014. */
 SELECT * FROM WORKER WHERE year(JOINING_DATE)=2014 AND month(JOINING_DATE)=2;
 
 /* Write an SQL query to fetch the count of employees 
 working in the department ‘Admin’. */
 
 SELECT COUNT(*) FROM WORKER WHERE DEPARTMENT='Admin';
 
 /* Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000 */
 
 SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS WORKER_NAME,SALARY FROM WORKER WHERE WORKER_ID 
 IN (SELECT WORKER_ID FROM WORKER WHERE SALARY BETWEEN 50000 AND 100000);
 
 /* Write an SQL query to fetch the no. of workers for each 
 department in descending order. */
 
 SELECT DEPARTMENT , COUNT(WORKER_ID) AS NUM_WORKER FROM WORKER 
 GROUP BY DEPARTMENT ORDER BY NUM_WORKER DESC;

/* Write an SQL query to print details of the Workers who are also Managers. */

SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');

/* Write an SQL query to show only odd rows from a table. */
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) <> 0;

/* Write an SQL query to show only even rows from a table. */
SELECT * FROM WORKER WHERE MOD(WORKER_ID,2)=0;

/* Write an SQL query to show the top n (say 10) records of a table. */
SELECT * FROM WORKER ORDER BY SALARY DESC LIMIT 10;

