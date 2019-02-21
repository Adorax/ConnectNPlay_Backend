-- Query explanation missing
SELECT 
    e.firstName, 
    e.lastName,	    
    s.name AS "Skill name",
    sm.skillLevelId as "Level"    
  FROM Employee e 
    JOIN Project p        ON (e.id = p.projectManagerId)
    JOIN SkillMarking sm  ON (e.id = sm.employeeId)
    JOIN Skill s          ON (sm.skillId = s.id)
  WHERE p.name LIKE 'Retail';

-- Query explanation missing
SELECT 
    p.name, 
    c.name AS "Client" 
  FROM Project p
    JOIN Client c ON (p.clientId = c.id)
  WHERE  p.isLookingForMembers = TRUE;    
    
-- Query explanation missing    
SELECT 
    p.name, 
    c.name AS "Client",    
    GROUP_CONCAT(rt.name) AS "Role Need List"
  FROM Project p
    JOIN Client c     ON (p.clientId = c.id)
    JOIN RoleNeed rn  ON (p.id = rn.projectId)
    JOIN RoleType rt  ON (rn.roleTypeId = rt.id)
  WHERE p.isLookingForMembers = TRUE
  GROUP BY p.name;      
    
-- Query explanation missing    
SELECT 
    e.firstName, 
    e.lastName,	
    p.name
  FROM Employee e   
    JOIN Project p         ON (e.id = p.projectManagerId)
    JOIN ProjectLearner pl ON (p.id = pl.projectId)
  WHERE pl.isAccepted = FALSE;
