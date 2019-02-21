-- Employees with skills with level 4

SELECT
    CONCAT(e.firstName, ' ', e.lastName) AS "Employee",
    s.name AS "Skill name",
    sl.name AS "Skill Level"
  FROM SkillMarking sm
    JOIN Employee e ON (sm.employeeId = e.id)
    JOIN Skill s ON (sm.skillId = s.id)
    JOIN SkillLevel sl ON (sm.skillLevelId = sl.id)
  WHERE skillLevelId = 4;

-- Client's projects, their descriptions, statuses
-- and location is Oslo

SELECT 
    c.name AS "Client",
    p.name AS "Project Name",
    p.description AS "Project Description",
    ps.name AS "Project Status",
    l.name AS "Location"
  FROM Project p
    JOIN Client c ON (c.id = p.clientId)
    JOIN ProjectStatus ps ON (p.projectStatusId = ps.id)
    JOIN Location l ON (p.locationId = l.id)
  WHERE l.name LIKE 'Oslo%';


-- Employees, their job titles and locations

SELECT
    CONCAT (e.firstName, ' ', e.lastName) AS "Employee",
    jt.name AS "Job Title",
    l.name AS "Location"
  FROM Employee e 
	JOIN JobTitle jt ON (e.jobTitleId = jt.id)
    JOIN Location l ON (e.locationId = l.id);



-- Projects that are upcoming or on-going
-- and have roles that are not fulfilled yet

SELECT
    p.name AS "Project",
    p.description AS "Project Description",
    ps.name AS "Project Status",
    rt.name AS "Role needed"
  FROM RoleNeed rn 
    JOIN RoleType rt ON (rt.id = rn.roleTypeId)
    JOIN Project p ON (rn.projectId = p.id)
    JOIN ProjectStatus ps ON (p.projectStatusId = ps.id)
    LEFT OUTER JOIN ProjectWorker pw ON (rn.id = pw.roleNeedId)
  WHERE pw.employeeId IS NULL AND ps.name NOT IN ('completed')
  ORDER BY p.name; 



-- ALL Projects with id's, with clients and with locations
-- and have roleNeeded for the project

SELECT DISTINCT p.id ,p.name,
         c.name,
       l.name, rn.id, rt.name
    FROM Project p
    JOIN Client c ON (c.id = p.clientId)
	JOIN Location l ON (p.locationId = l.id)
        LEFT JOIN RoleNeed rn ON (p.id = rn.projectId)
        LEFT JOIN RoleType rt ON (rn.roleTypeId = rt.id)
    WHERE     rt.name LIKE '%el%'
        OR  p.name LIKE '%el%'
       OR  l.name LIKE '%el%'
       OR  c.name LIKE '%el%'
    ORDER BY p.id;



-- Employees, their skills, job titles and locations


SELECT DISTINCT Employee.id, Location.name, firstName, lastName, JobTitle.name,
 GROUP_CONCAT(Skill.name) AS 'Skills list'
FROM Employee 
	JOIN SkillMarking On Employee.id = SkillMarking.employeeId
	JOIN Location ON Employee.locationId = Location.Id
    JOIN JobTitle ON Employee.jobTitleId = JobTitle.Id
	JOIN Skill On Skill.id = SkillMarking.skillId
    WHERE     Location.name LIKE '%na%'
        OR  firstName LIKE '%na%'
       OR  lastName LIKE '%na%'
       OR  JobTitle.name LIKE '%na%'
  GROUP BY Employee.id;