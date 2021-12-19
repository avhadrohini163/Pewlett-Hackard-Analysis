-- Employee Database challenge
SELECT e.emp_no,
       e.first_name, 
	   e.last_name,
	   ti.title,
	   ti.from_date,
	   ti.to_date
INTO employee_title_info	   
FROM employees AS e
FULL JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
and ti.to_date = ('9999-01-01') 
ORDER BY e.emp_no;
--AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Use Dictinct with Orderby to remove duplicate rows
SELECT * FROM employee_title_info

DROP TABLE IF EXISTS retirement_title

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
Last_name,
title,
from_date,
to_date

INTO retirement_title
FROM employee_title_info
ORDER BY emp_no, to_date DESC;

DROP TABLE IF EXISTS retirement_title_info

SELECT r.emp_no,
r.first_name,
r.last_name,
r.title,
r.to_date

INTO retirement_title_info
FROM retirement_title AS r
--WHERE (r.to_date = '9999-01-01');
SELECT * FROM retirement_title_info;


DROP TABLE IF EXISTS unique_titles;
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_title_info
ORDER BY emp_no DESC;
SELECT * FROM unique_titles;

-- count employees by titles
SELECT COUNT(re.title), re.title
INTO retiring_titles
FROM unique_titles AS re

GROUP BY re.title
ORDER BY count DESC;

--Deliverable 2 challenge
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
e.first_name, 
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
--INTO
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31' )
AND(de.to_date = '9999-01-01')
ORDER BY e.emp_no;
