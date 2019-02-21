--Trigger to check if employee either has already been invited or has applied in a project as project worker

DELIMITER $$
CREATE TRIGGER checkEmployeeProject
BEFORE INSERT ON ProjectWorker 
FOR EACH ROW

BEGIN
    IF NEW.employeeId IN (
        SELECT employeeId FROM ProjectWorker
        JOIN RoleNeed ON ProjectWorker.roleNeedId = RoleNeed.id
        JOIN Project ON RoleNeed.projectId = Project.id
            WHERE RoleNeed.projectId = (SELECT projectId FROM RoleNeed WHERE id = NEW.roleNeedId)
    ) 
    THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Employee already exists on this project';
    END IF;
END $$;