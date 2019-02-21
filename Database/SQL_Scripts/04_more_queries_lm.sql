/* LM 6.9.2018
More test queries for testing */


-- A query to find all the consultants from Denmark, ordered by firstname
SELECT e.firstName, e.lastName, jt.name AS "Job title", l.name AS "Office" 
  FROM 
    Employee e
      JOIN 
    JobTitle jt ON e.jobTitleId = jt.id
      JOIN 
    Location l ON e.locationId = l.id
  WHERE jt.name="Consultant"
          AND 
        l.name LIKE '%Denmark%'
  ORDER BY e.firstName;
            
    
-- A query to find out what projects are missing developers
SELECT p.name AS "Project", p.description, 
       rt.name AS "Role", 
       l.name AS "Location" 
  FROM Project p   
    JOIN RoleNeed rn ON p.id = rn.projectId 
    JOIN RoleType rt ON rn.roleTypeId = rt.id
    JOIN Location l ON p.locationId = l.id
  WHERE rt.name="Developer";
        