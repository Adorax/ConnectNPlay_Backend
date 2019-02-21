
-- All employees with a skills list
SELECT Employee.id, firstName, lastName, GROUP_CONCAT(Skill.name) AS 'Skills list'
FROM Employee 
JOIN SkillMarking On Employee.id = SkillMarking.employeeId
JOIN Skill On Skill.id = SkillMarking.skillId
GROUP BY Employee.id;

-- Count learners for each project
SELECT Project.id, name, clientID, COUNT(ProjectLearner.EmployeeId) AS 'Amount of learners'
FROM Project
JOIN ProjectLearner ON Project.id = ProjectLearner.ProjectId
JOIN Employee ON Employee.id = ProjectLearner.EmployeeId
GROUP BY Project.id, name, clientID

--Count accepted workers for each project
SELECT Project.id, name, clientID, COUNT(ProjectWorker.EmployeeId) AS 'Amount of workers'
FROM Project
JOIN RoleNeed ON Project.id = RoleNeed.ProjectId
JOIN ProjectWorker ON ProjectWorker.RoleNeedId = RoleNeed.Id
JOIN Employee ON Employee.id = ProjectWorker.EmployeeId
WHERE isAccepted=1
GROUP BY Project.id, name, clientID

--

