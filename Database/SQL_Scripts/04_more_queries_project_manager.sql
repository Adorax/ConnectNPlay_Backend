-- Project manager query 1
SELECT DISTINCT 
    e.id AS "Project manager's employee id", 
    e.firstName, e.lastName 
  FROM Employee e 
    JOIN Project p ON e.id = p.projectManagerId 
    JOIN Client c ON  p.clientId = c.id  
  WHERE c.name = 'Fozar';

-- Project manager query 2
SELECT DISTINCT 
    e.firstName, e.lastName, 
    (CASE WHEN e.id = p.projectManagerId 
          THEN 'manager' ELSE '-' END) AS "Status",
    p.name AS "Project name"
  FROM Employee e 
    LEFT JOIN Project p ON e.id = p.projectManagerId
  ORDER BY p.name;
