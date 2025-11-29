-- Reset the table if it already exists
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS assignments;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS projects;


-- Create the employee table
CREATE TABLE employees (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    department TEXT,
    salary INTEGER
);

-- Insert sample data
INSERT INTO employees (first_name, last_name, department, salary)
VALUES 
('Alice', 'Johnson', 'IT', 75000),
('Bob', 'Smith', 'HR', 60000),
('Carol', 'Lee', 'Finance', 80000),
('David', 'Kim', 'IT', 72000);

-- Create a new table: projects

CREATE TABLE projects (
    project_id INTEGER PRIMARY KEY,
    name TEXT,
    department TEXT,
    budget INTEGER,
    start_date TEXT,
    deadline TEXT
);

-- Create the assignments table (relationship between employees and projects)
CREATE TABLE assignments (
    employee_id INTEGER,
    project_id INTEGER,
    role TEXT,
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- Insert sample projects
INSERT INTO projects (name, department, budget)
VALUES 
('Website Redesign', 'IT', 15000),
('Recruitment Drive', 'HR', 8000),
('Audit Prep', 'Finance', 12000);

-- Insert sample assignments
INSERT INTO assignments (employee_id, project_id, role)
VALUES
(1, 1, 'Lead Developer'),
(4, 1, 'QA Engineer'),
(2, 2, 'Coordinator'),
(3, 3, 'Analyst');



-- Query: Get all employees in IT
SELECT * FROM employees WHERE department = 'IT';

-- Query: Find highest salary
SELECT MAX(salary) AS highest_salary FROM employees;

-- Query: Average salary by department
SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department;

-- Query: Match employees to projects by assignment
SELECT 
    e.first_name || ' ' || e.last_name AS employee,
    p.name AS project,
    a.role
FROM assignments a
JOIN employees e ON a.employee_id = e.id
JOIN projects p ON a.project_id = p.project_id;


