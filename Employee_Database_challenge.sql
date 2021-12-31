-- Deliverable 1 Retirement Titles table

SELECT e.emp_no, 
	e.first_name,
	e.last_name,
	tt.title,
	tt.from_date,
	tt.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as tt
	ON(e.emp_no = tt.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC;

SELECT * FROM retirement_titles
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) 
rt.emp_no, 
rt.first_name, 
rt.last_name, 
rt.title
INTO unique_titles
FROM retirement_titles AS rt 
ORDER BY rt.emp_no, rt.to_date DESC;

select * from unique_titles

-- retrieve the number of employees by their most recent job title who are about to retire
SELECT COUNT(ut.title), 
ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

select * from retiring_titles

-- Deliverable 2 create a Mentorship Eligibility table
SELECT DISTINCT ON (e.emp_no) 
e.emp_no, 
e.first_name, 
e.last_name, 
e.birth_date, 
de.from_date, 
de.to_date, 
tt.title
INTO mentorship_eligibility
FROM employees AS e INNER JOIN dept_employees AS de
	ON e.emp_no = de.emp_no
LEFT JOIN titles AS tt 
	ON e.emp_no = tt.emp_no
WHERE de.to_date = ('9999-01-01') AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

Select * from mentorship_eligibility