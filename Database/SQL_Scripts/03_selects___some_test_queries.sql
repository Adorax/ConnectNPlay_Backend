/* Sample queries */

-- PROJECT QUERIES

-- All certain employees' project managed projects

SELECT 
    e.firstName, 
    e.lastName,
    p.name AS "Project",
    c.name AS "Client"  
  FROM Employee e 
    JOIN Project p  ON (e.id = p.projectManagerId)
    JOIN Client c   ON (p.clientId = c.id)
  WHERE e.lastName LIKE 'S%';
  

-- All projects where there are RoleNeeds specified
-- and the project manager's name starts with 'S'
-- (Try removing S from below)

SELECT 
    CONCAT(e.firstName, ' ', e.lastName) AS "Project manager",
    p.name AS "Project",
    c.name AS "Client"  
  FROM Employee e 
    JOIN Project p  ON (e.id = p.projectManagerId)
    JOIN Client c   ON (p.clientId = c.id)
  WHERE e.lastName LIKE 'S%'
      AND
        p.id IN (SELECT DISTINCT 
                     projectId 
                   FROM RoleNeed);