# Pewlett-Hackard-Analysis

## Overview of the Pewlett Hackard Analysis
- Determine the number of retiring employees per title and identify employees who are eligible to participate in a mentorship program to help the manager prepare for the upcoming "silver tsunami."

## Results:
- For the first analysis in the deliverable one and after we removed the duplicate rows, we can see the number of employees by their most recent job title who are about to retire with a total of 90.398 people:

![This is an image](https://github.com/KandiJayana/Pewlett-Hackard-Analysis/blob/952a6f2587b88b15350a4af90119657e9c7f55cf/retiring_titles.png)


### From that image above we know: 

- 32.53% are Senior Engineer
- 31.25% are Senior Staff
- 15.73% are Engineer
- 13.54% are Staff
- 4.98% are Technique Leader
- 1.93% are Assistant Engineer
- 0.002% are Managers 

- For the second analysis when we created the Mentorship Eligibility table, we can see that we have a total of 1.549 people who are eligible to participate in a mentorship program:

![This is an image](https://github.com/KandiJayana/Pewlett-Hackard-Analysis/blob/952a6f2587b88b15350a4af90119657e9c7f55cf/mentorship_eligibility.png)

### From comparing the images above we know:

- There were 91.947 in both analysis 
- Only 1.68% of this people are eligible to participate in a mentorship program.

## Summary

- We have 90.398 roles that will need to be filled as the "silver tsunami" begins to make an impact. 
- Based on the 1.549 people qualified for a mentorship program, we can say that it is not enough, because we would have about 58 next generation people, for each mentor available now in Pewlett Hackard. 

#### Queries or tables that may provide more insight:
- We can provide a financial insight about the budged  based on their salaries.

SELECT e.emp_no, 
	e.first_name,
	e.last_name,
	tt.title,
	tt.from_date,
	tt.to_date
	sl.salary
INTO retirement_salaries
FROM employees as e
INNER JOIN titles as tt
	ON(e.emp_no = tt.emp_no)
LEFT JOIN salaries as sl
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC;


