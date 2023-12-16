SELECT * FROM fruit_basket1;
SELECT * FROM fruit_basket2;

-- INNER JOIN
/* Returns only the rows where there is a match in
both tables based on the specified condition. */
SELECT t1.id AS t1_ID,
	t1.fruit_name AS t1_fruit,
    t2.id AS t2_ID,
	t2.fruit_name AS t2_fruit
FROM fruit_basket1 AS t1
INNER JOIN fruit_basket2 AS t2
ON t1.id = t2.id;

-- LEFT JOIN
/* Returns all rows from the left table and the matching rows
from the right table. If there is no match in the right table,
NULL values are returned for columns from the right table based
on the specified condition. */
SELECT t1.id AS t1_ID,
       t1.fruit_name AS t1_fruit,
       t2.id AS t2_ID,
       t2.fruit_name AS t2_fruit
FROM fruit_basket1 AS t1
LEFT JOIN fruit_basket2 AS t2
ON t1.id = t2.id;

-- RIGHT JOIN
/* Returns all rows from the right table and the matching rows
from the left table. If there is no match in the left table,
NULL values are returned for columns from the left table based
on the specified condition. */
SELECT t1.id AS t1_ID,
	   t1.fruit_name AS t1_fruit,
       t2.id AS t2_ID,
       t2.fruit_name AS t2_fruit
FROM fruit_basket1 AS t1
RIGHT JOIN fruit_basket2 AS t2
ON t1.id = t2.id;

-- FULL JOIN = LEFT JOIN UNION RIGHT JOIN
 /* Returns all rows when there is a match in either the left
 or the right table. If there is no match in one of the tables,
 NULL values are returned for columns from the table without 
 a match based on the specified condition. */
 -- LEFT JOIN
SELECT t1.id AS t1_ID,
       t1.fruit_name AS t1_fruit,
       t2.id AS t2_ID,
       t2.fruit_name AS t2_fruit
FROM fruit_basket1 AS t1
LEFT JOIN fruit_basket2 AS t2
ON t1.id = t2.id
UNION 
 -- RIGHT JOIN
SELECT t1.id AS t1_ID,
	   t1.fruit_name AS t1_fruit,
       t2.id AS t2_ID,
       t2.fruit_name AS t2_fruit
FROM fruit_basket1 AS t1
RIGHT JOIN fruit_basket2 AS t2
ON t1.id = t2.id;

-- CROSS JOIN 
/* Generates all possible combinations of rows from two or
more tables without any specific matching condition. */
SELECT t1.id AS t1_ID,
	   t1.fruit_name AS t1_fruit,
       t2.id AS t2_ID,
       t2.fruit_name AS t2_fruit
FROM fruit_basket1 AS t1
CROSS JOIN fruit_basket2 AS t2;

-- NATURAL JOIN WORKS AS THE INNER JOIN 
/* It's useful when the tables have a column with the same
name and you want to join them based on that commonality. */
SELECT t1.id AS t1_ID,
	   t1.fruit_name AS t1_fruit,
       t2.id AS t2_ID,
       t2.fruit_name AS t2_fruit
FROM fruit_basket1 AS t1
NATURAL JOIN fruit_basket2 AS t2;

-- SELF JOIN
-- table is joined with itself 
CREATE TABLE employee_details(
	employee_id INT NOT NULL,
    employee_name VARCHAR(50),
    manager_id INT 
    );
 
INSERT INTO employee_details (employee_id, employee_name, manager_id)
VALUES
(1,'Everlyn',3),
(2, 'Betty', 3),
(3, 'Ashley', NULL),
(4, 'Esther', 2),
(5, 'Carol', 2);

-- employees with managers
SELECT e1.employee_name AS employee_name,
       e2.employee_name AS manager_name
FROM employee_details AS e1
INNER JOIN employee_details AS e2
ON e1.manager_id = e2.employee_id;

-- employee without a manager
SELECT e1.employee_name AS employee_name,
       e2.employee_name AS manager_name
FROM employee_details AS e1
LEFT JOIN employee_details AS e2
ON e1.manager_id = e2.employee_id;

/* This query is useful for obtaining a list of employees
along with their respective managers. If an employee doesn't
have a manager, 'Top Manager' is displayed for that employee. */
SELECT e1.employee_name employee,
       IFNULL(e2.employee_name, 'Top Manager') AS manager
FROM employee_details AS e1
LEFT JOIN employee_details AS e2
ON e1.manager_id = e2.employee_id;

-- UNION 
/* The UNION operator is used to combine the result sets of
two or more SELECT statements and remove duplicate rows from
the combined result set. */
SELECT t1.*
FROM fruit_basket1 AS t1
UNION
SELECT t2.*
FROM fruit_basket2 AS t2;

-- UNION ALL 
/* The UNION ALL operator is similar to UNION but does not
remove duplicate rows. It simply combines the result sets
of the SELECT statements. */
SELECT t1.*
FROM fruit_basket1 AS t1
UNION ALL
SELECT t2.*
FROM fruit_basket2 AS t2;
