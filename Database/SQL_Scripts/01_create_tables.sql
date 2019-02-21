/* CREATE TABLES */
-- ------------------------- 80-character-line marker  ------------------------

/* TODO: 
 - Foreign key policies for each table. Commissioner of course
 knows better what they want. Options e.g.
 DCA = ON DELETE CASCADE = On the Deletion of mother row, cascade delete to child rows too.
 DNA = ON DELETE NO ACTION = ON DELETE RESTRICT = Forbid deletion of mother row, if children exist
 DSN = ON DELETE SET NULL = On the Deletion of mother row, set child rows' foreign keys to NULL
 
 - Naturally the 256 and 255 lengths question, but no hurry

 - DNA UNA for jobTitleId on Employee Table
 - DNA UNA for locationId on Employee Table
 - DNA UNA for locationId on Project Table
 - DCA UNA for projectManagerId on Project Table
 - DCA UNA for employeeId on ProjectLearner Table
 - DCA UNA for employeeId on ProjectWorker Table
*/

CREATE TABLE JobTitle (
  id              INTEGER             NOT NULL AUTO_INCREMENT,
  name            VARCHAR(255)        NOT NULL,

  CONSTRAINT PK_JobTitle PRIMARY KEY (id),
  
  CONSTRAINT AK_JobTitle_name UNIQUE(name)
);
ALTER TABLE JobTitle AUTO_INCREMENT=101;


CREATE TABLE Location (
  id              INTEGER             NOT NULL AUTO_INCREMENT,
  name            VARCHAR(255)        NOT NULL,

  CONSTRAINT PK_Location PRIMARY KEY (id),
  
  CONSTRAINT AK_Location_name UNIQUE (name)
);
ALTER TABLE Location AUTO_INCREMENT=201;


CREATE TABLE SkillCategory (
  id              INTEGER             NOT NULL AUTO_INCREMENT,
  name            VARCHAR(255)        NOT NULL,
    
  CONSTRAINT PK_SkillCategory PRIMARY KEY (id),
  
  CONSTRAINT AK_SkillCategory_name UNIQUE (name)
);
ALTER TABLE SkillCategory AUTO_INCREMENT=401;


CREATE TABLE Skill (
  id              INTEGER             NOT NULL AUTO_INCREMENT, 
  name            VARCHAR(255)        NOT NULL, 
  skillCategoryId INTEGER             NOT NULL,
  
  CONSTRAINT PK_Skill PRIMARY KEY (id),
  
  CONSTRAINT AK_Skill_name UNIQUE (name),
  
  CONSTRAINT FK_Skill_SkillCategory FOREIGN KEY (skillCategoryId)
    REFERENCES SkillCategory(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);    
ALTER TABLE Skill AUTO_INCREMENT=501;


CREATE TABLE SkillLevel (
  id              INTEGER             NOT NULL,
  name            VARCHAR(255)        NOT NULL,
  
  CONSTRAINT PK_SkillLevel PRIMARY KEY (id),
  
  CONSTRAINT AK_Skill_name UNIQUE (name)
); 
/* Skill level id:s will be only 1,2,3 and 4. No UI or REST API for adding */


CREATE TABLE Employee (
  id              INTEGER             NOT NULL AUTO_INCREMENT,
  lastName        VARCHAR(256)        NOT NULL,
  firstName       VARCHAR(256)        NOT NULL,
  email           VARCHAR(255)        NOT NULL,
  isBooked        BOOLEAN             NOT NULL,
  passwordHash    VARCHAR(256)        NOT NULL,
  jobTitleId      INTEGER             NOT NULL,
  locationId      INTEGER             NOT NULL,
  
  CONSTRAINT PK_Employee PRIMARY KEY (id),
  
  CONSTRAINT AK_Employee_email UNIQUE (email),
  
  CONSTRAINT FK_Employee_JobTitle FOREIGN KEY (jobTitleId)
    REFERENCES JobTitle(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  
  CONSTRAINT FK_Employee_Location FOREIGN KEY (locationId)
    REFERENCES Location(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
ALTER TABLE Employee AUTO_INCREMENT=1001;


CREATE TABLE SkillMarking (
  employeeId      INTEGER             NOT NULL,
  skillId         INTEGER             NOT NULL,
  skillLevelId    INTEGER             NOT NULL,
  
  CONSTRAINT PK_SkillMarking PRIMARY KEY (employeeId, skillId, skillLevelId),
  
  CONSTRAINT FK_SkillMarking_Employee FOREIGN KEY (employeeId) 
    REFERENCES Employee(id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  
  CONSTRAINT FK_SkillMarking_Skill FOREIGN KEY (skillId) 
    REFERENCES Skill(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  
  CONSTRAINT FK_SkillMarking_SkillLevel FOREIGN KEY (skillLevelId) 
    REFERENCES SkillLevel(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


CREATE TABLE ProjectStatus (
  id              INTEGER             NOT NULL,
  name            VARCHAR(255)        NOT NULL,
  
  CONSTRAINT PK_ProjectStatus PRIMARY KEY (id),
  
  CONSTRAINT AK_ProjectStatus_name UNIQUE (name)
);
/* Project statuses will be something like 11,12,13,14, .. and No UI or REST
API for adding */


CREATE TABLE Client (
  id              INTEGER             NOT NULL AUTO_INCREMENT,
  name            VARCHAR(255)        NOT NULL,
  
  CONSTRAINT PK_Client PRIMARY KEY (id),
  
  CONSTRAINT AK_Client_name UNIQUE (name)
);
ALTER TABLE Client AUTO_INCREMENT=2001;


CREATE TABLE Project (
  id                  INTEGER         NOT NULL AUTO_INCREMENT,
  name                VARCHAR(255)    NOT NULL,
  clientId            INTEGER         NOT NULL,
  description         VARCHAR(20000)  NOT NULL,
  projectStatusId     INTEGER         NOT NULL,
  isLookingForMembers BOOLEAN         NOT NULL,
  projectManagerId    INTEGER,
  locationId          INTEGER         NOT NULL,
  
  CONSTRAINT PK_Project PRIMARY KEY (id),
  
  CONSTRAINT FK_Project_Client FOREIGN KEY (clientId) 
    REFERENCES Client(id),
  
  CONSTRAINT FK_Project_ProjectStatus FOREIGN KEY (projectStatusId) 
    REFERENCES ProjectStatus(id),
  
  CONSTRAINT FK_Project_Employee_as_projectManager FOREIGN KEY 
    (projectManagerId) REFERENCES Employee(id)
    ON DELETE SET NULL
    ON UPDATE NO ACTION,

  CONSTRAINT FK_Project_Location FOREIGN KEY 
    (locationId) REFERENCES Location(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
ALTER TABLE Project AUTO_INCREMENT=10001;
-- Customer wanted this to be removed 2018-09-05:
-- CONSTRAINT AK_Project_name_and_clientId UNIQUE(clientId, name)


CREATE TABLE RoleType (
  id              INTEGER             NOT NULL AUTO_INCREMENT,
  name            VARCHAR(255)        NOT NULL,
    
  CONSTRAINT PK_RoleType PRIMARY KEY (id),
  
  CONSTRAINT AK_RoleType_name UNIQUE (name)
);
ALTER TABLE RoleType AUTO_INCREMENT=301;


CREATE TABLE RoleNeed (
  id              INTEGER             NOT NULL AUTO_INCREMENT,
  projectId       INTEGER             NOT NULL,
  roleTypeId      INTEGER             NOT NULL,
  
  CONSTRAINT PK_RoleNeed PRIMARY KEY (id),

  CONSTRAINT FK_RoleNeed_Project FOREIGN KEY (projectId) 
    REFERENCES Project(id),
  
  CONSTRAINT FK_RoleNeed_RoleType FOREIGN KEY (roleTypeId) 
    REFERENCES RoleType(id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
ALTER TABLE RoleNeed AUTO_INCREMENT=3001;
-- This removed so far by request of customer:
--  description     VARCHAR(20000)      NOT NULL,


CREATE TABLE ProjectLearner (
  employeeId      INTEGER             NOT NULL,
  projectId       INTEGER             NOT NULL,
  isInvitation    BOOLEAN             NOT NULL,
  isAccepted      BOOLEAN             ,
  
  CONSTRAINT PK_ProjectLearner PRIMARY KEY(employeeId, projectId),

  CONSTRAINT FK_ProjectLearner_Employee FOREIGN KEY (employeeId) 
    REFERENCES Employee (id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  
  CONSTRAINT FK_ProjectLearner_Project FOREIGN KEY (projectId) 
    REFERENCES Project (id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION 
);


CREATE TABLE ProjectWorker (
  employeeId      INTEGER             NOT NULL,
  roleNeedId      INTEGER             NOT NULL,
  isInvitation    BOOLEAN             NOT NULL,
  isAccepted      BOOLEAN,

  CONSTRAINT PK_ProjectWorker PRIMARY KEY (employeeId, roleNeedId),

  CONSTRAINT FK_ProjectWorker_RoleNeed FOREIGN KEY (roleNeedId) 
    REFERENCES RoleNeed(id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,

  CONSTRAINT FK_ProjectWorker_Employee FOREIGN KEY (employeeId) 
    REFERENCES Employee(id)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
);


/* END */