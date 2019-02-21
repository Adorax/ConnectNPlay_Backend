/* Inserts for app dev phase test data  */

    
INSERT INTO JobTitle 
  (name) 
    VALUES
  ('Manager'),
  ('UI Manager'),
  ('Consultant'),
  ('Web Developer'),
  ('HR'),
  ('Accounting'),
  ('Logistics'),
  ('CEO'),
  ('Operations Manager'),
  ('Project Manager');


INSERT INTO Location 
  (name)
    VALUES
  ('Helsinki, Finland'),
  ('Stockholm, Sweden'),
  ('Oslo, Norway'),
  ('Fredriksberg, Denmark'),
  ('Warsaw, Poland'),
  ('No proj, Noland'),
  ('No long project, Noland');


INSERT INTO SkillCategory 
  (name) 
    VALUES
  ('Design'),
  ('Sales'),
  ('Marketing'),
  ('Web Development'),
  ('Training and Workshop'),
  ('Accounting'),
  ('Logistics'),
  ('HR'),
  ('Operations'),
  ('Project Management'),
  ('No skill category (1)'),
  ('Category without skills (2)');

INSERT INTO Skill 
  (name, skillCategoryId) 
    VALUES
  ('Photoshop', 401),
  ('Illustrator', 401),
  ('Email templating', 403),
  ('Journey planning', 403),
  ('Presentation', 403),
  ('Negotiation', 403),
  ('Resource planning', 403),
  ('Front-end development', 404),
  ('Back-end development', 404),
  ('Internal Training', 405),
  ('External Training', 405),
  ('Teamwork', 405),
  ('Team bonding', 405),
  ('Networking', 405),
  ('Controller', 406),
  ('Financial Analyzing', 406),
  ('Transportation', 407),
  ('Facility Management', 407),
  ('Operating', 407),
  ('Sprint planning', 410),
  ('Project Manager', 410);

-- There is no skills for category 402, 408 and 409

INSERT INTO SkillLevel 
  (id, name) 
    VALUES
  (1, 'Junior'),
  (2, 'Fluent'),
  (3, 'Senior'),
  (4, 'Master');

INSERT INTO Employee 
  (lastName, firstName, email, isBooked, passwordHash, jobTitleId, locationId) 
    VALUES 
  ('Smith', 'Joe', 'Joe@gmail.com', true, 'dijfnjdsnf', 101, 201),
  ('Guy', 'Max', 'Max@gmail.com', false, 'sagdsh', 102, 202),
  ('Pierce', 'Dave', 'Dave@gmail.com', true, 'fdgsdfgd', 103, 203),
  ('Damon', 'Steve', 'Steve@gmail.com', false, 'dfgdsgsfdg', 103, 204),
  ('Segal', 'Mick', 'Mick@gmail.com', false, 'hehehhh', 103, 204),
  ('Jobs', 'Petra', 'Peter@gmail.com', false, 'fdsgfdgsd', 103, 204),
  ('Gates', 'Susan', 'Petri@gmail.com', true, 'dfsgfdsg', 104, 204),
  ('Sputnik', 'Anna', 'Altti@gmail.com', false, 'dsfgdsgfd', 105, 204),
  ('Brown', 'Jenna', 'James@gmail.com', true, 'dfgsdgds', 106, 204),
  ('Lopez', 'Suvi', 'Suvi@gmail.com', false, 'ehrheff', 107, 204);


INSERT INTO SkillMarking 
  (employeeId, skillId, skillLevelId)
    VALUES
  (1001, 502, 4),
  (1008, 501, 2),
  (1001, 507, 4),
  (1004, 501, 4),
  (1007, 510, 1),
  (1001, 508, 4),
  (1004, 509, 4),
  (1001, 515, 1),
  (1010, 519, 4),
  (1008, 502, 1),
  (1008, 503, 1),
  (1009, 520, 4),
  (1009, 518, 1),
  (1005, 502, 4),
  (1006, 504, 1),
  (1009, 511, 2),
  (1010, 512, 4),
  (1001, 513, 2),
  (1004, 503, 1),
  (1009, 519, 4),
  (1004, 516, 2),
  (1007, 511, 4),
  (1006, 505, 2),
  (1007, 508, 4),
  (1008, 511, 1),
  (1009, 501, 4),
  (1010, 520, 2),
  (1006, 511, 4),
  (1006, 521, 4),
  (1006, 515, 1);


INSERT INTO ProjectStatus 
  (id, name)
    VALUES
  (11, 'upcoming'),
  (12, 'on-going'),
  (13, 'completed');

  
INSERT INTO Client 
  (name) 
    VALUES
  ('Fozar'),
  ('Machines'),
  ('The Workers Union'),
  ('Tähdenlento'),
  ('Ylä-Mälmon Polkupyörät'),
  ('Hans-Peter Oy'),
  ('DHT'),
  ('W.w.w'),
  ('Accidents'),
  ('ABC Co');
  

INSERT INTO Project 
  (name, clientId, description, projectStatusId, isLookingForMembers, projectManagerId, locationId)
    VALUES
  ('Retail', 2001, 'Designing retail project', 11, true, 1001,201),
  ('ABC', 2002, 'Designing web portal for ABC', 13, false, 1003,203),
  ('Hotel management', 2003, 'Creating applications', 11, true, 1004,203),
  ('House design', 2004, 'Designing Houses', 11, true, 1001,201),
  ('Shop website', 2005, 'Java backend and Angular fornt-end', 13, true, 1001,204),
  ('School project', 2006, 'Working on it', 12, true, 1005,201),
  ('Liberary project', 2007, 'Designing and building database for it', 12, false, 1001,204),
  ('Exam checker', 2008, 'Designing checker project', 11, true, 1003,204),
  ('Private database', 2008, 'Designing private database', 11, true, 1001,203),
  ('Building abc', 2008, 'Creating frontEnd', 13, true, 1004,201),
  
  ('Entertainment', 2008, 'Web for entertainment', 11, false, 1003,204),
  ('HR website', 2008, 'Hr web project', 11, true, 1001,201),
  ('Updating web tech', 2007, 'Updating a tech company website project', 12, false, 1001,201),
  ('Javascript project', 2007, 'A stuio javascript based project', 11, true, 1005,205),
  ('Italian', 2007, 'Building a website for italian project', 13, true, 1003,201),
  ('Games', 2007, 'A gaming project for Iceland', 11, true, 1004,201),
  ('French office', 2004, 'Designing officials management website project', 11, true, 1001,201),
  ('Laywers', 2004, 'Designing lawyers management project', 11, true, 1001,201),
  ('Departmental', 2004, 'Building a departmental website project', 12, true, 1005,203),
  ('Insurance', 2004, 'Creating an insurance internal project', 13, true, 1005,205); 
    
  -- No client id:s 2008 or 2018. Project manager id 1002 is not assigned. 202 not used in locationid.

  
INSERT INTO RoleType 
  (name)
    VALUES
  ('UI designer'),
  ('Tech Specialist'),
  ('Developer'),
  ('Front-End Developer'),
  ('Color Temperature and Saturation Depth Adjuster'),
   
  ('Back-End Developer'),
  ('Consultant'),
  ('Graphics Designer'),
  ('Photographer'),
  ('Software Architect');

  
INSERT INTO RoleNeed 
  (projectId, roleTypeId)
    VALUES
  ('10001', '301'),
  ('10001', '302'),
  ('10001', '303'),
  ('10001', '304'),
  ('10001', '305'),
  
  ('10002', '301'),
  ('10002', '302'),
  ('10002', '303'),
  ('10002', '304'),
  ('10002', '305'),

  ('10002', '306'),
  ('10003', '301'),
  ('10003', '302'),
  ('10003', '303'),
  ('10003', '304'),
  
  ('10003', '308'),
  ('10003', '307'),
  ('10003', '306'),
  ('10004', '301'),
  ('10004', '302'),

  ('10004', '303'),
  ('10004', '304'),
  ('10004', '305'),
  ('10004', '306'),
  
  ('10004', '307'),
  ('10004', '308'),
  ('10005', '301'),
  ('10005', '302'),
  ('10005', '303'),
  ('10005', '304'),

  ('10005', '305'),
  ('10005', '306'),
  ('10005', '307'),
  ('10005', '308'),
  ('10004', '303'),
  
  ('10004', '303'),
  ('10005', '307'),
  ('10005', '307'),
  ('10006', '301'),
  ('10006', '301');
  
INSERT INTO ProjectLearner
  (employeeId, projectId, isInvitation, isAccepted)
    VALUES
  (1001, 10001, FALSE, NULL),
  (1001, 10002, TRUE, FALSE);
  
INSERT INTO ProjectWorker
  (employeeId, roleNeedId, isInvitation, isAccepted)
    VALUES
  (1001, 3001, TRUE, TRUE),
  (1001, 3002, FALSE, FALSE),
  (1003, 3003, TRUE, TRUE),
  (1003, 3004, TRUE, FALSE),
  (1004, 3003, TRUE, TRUE),
  (1005, 3005, FALSE, NULL);





-- No skill marking for employee 1002 or 1003, no skill marking with skill level 3, no skill marking with skill 503
/* END */
