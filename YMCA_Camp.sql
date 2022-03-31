CREATE DATABASE YMCA_Camps;
USE YMCA_Camps;

CREATE TABLE Camp_Details (
  `Camp_ID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Mobile` int NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Num_of_Campers` int NOT NULL,
  `Country` varchar(100) NOT NULL,
  `State` varchar(100) NOT NULL,
  `City` varchar(100) NOT NULL,
  `Street` varchar(100) NOT NULL,
  PRIMARY KEY (`Camp_ID`),
  UNIQUE KEY `Camp_ID` (`Camp_ID`),
  UNIQUE KEY `Mobile` (`Mobile`),
  CHECK ((`Num_of_Campers` > 0))
);

CREATE TABLE `Cabin_Details` (
  `Camp_ID` int NOT NULL,
  `Cabin_Number` int NOT NULL,
  `Occupancy` varchar(40) NOT NULL,
  PRIMARY KEY (`Camp_ID`,`Cabin_Number`),
  FOREIGN KEY (`Camp_ID`) REFERENCES `Camp_Details` (`Camp_ID`)
); 

CREATE TABLE `Camper_Details` (
  `Camper_ID` int NOT NULL,
  `First_Name` varchar(100) NOT NULL,
  `Last_Name` varchar(100) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Mobile` int NOT NULL,
  `Emergency_Contact_Name` varchar(100) NOT NULL,
  `Emergency_Contact_Mobile` int NOT NULL,
  `Session_` INT NOT NULL,
  `Country` varchar(100) NOT NULL,
  `State` varchar(100) NOT NULL,
  `City` varchar(100) NOT NULL,
  `Street` varchar(100) NOT NULL,
  PRIMARY KEY (`Camper_ID`),
  UNIQUE KEY `Mobile` (`Mobile`)
); 
CREATE TABLE `Activity_Details` (
  `Activity_Type` varchar(100) NOT NULL,
  `Camp_ID` int NOT NULL,
  `Session_` int NOT NULL,
  `Number_Of_Campers` int NOT NULL,
  `Indoor_Outdoor` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Activity_Type`,`Camp_ID`),
  CHECK ((`Number_Of_Campers` > 0))
);

CREATE TABLE `Camper_Camp` (
  `Camper_ID` int NOT NULL,
  `Camp_ID` int NOT NULL,
  PRIMARY KEY (`Camper_ID`,`Camp_ID`),
  UNIQUE KEY `Camper_ID` (`Camper_ID`),
  UNIQUE KEY `Camp_ID` (`Camp_ID`),
  FOREIGN KEY (`Camper_ID`) REFERENCES `Camper_Details` (`Camper_ID`)
);

CREATE TABLE `Staff_Details` (
  `Staff_ID` int NOT NULL,
  `Camp_ID` int DEFAULT NULL,
  `First_Name` varchar(100) NOT NULL,
  `Last_Name` varchar(100) NOT NULL,
  `Mobile` int NOT NULL,
  `Emergency_Contact_Name` varchar(100) NOT NULL,
  `Emergency_Contact_Mobile` int NOT NULL,
  `Session_` int NOT NULL,
  `Role_` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Country` varchar(100) NOT NULL,
  `State` varchar(100) NOT NULL,
  `City` varchar(100) NOT NULL,
  `Street` varchar(100) NOT NULL,
  `Cabin_Number` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Staff_ID`)
);

CREATE TABLE `Complaints` (
  `Complaint_ID` int NOT NULL,
  `Camper_ID` int NOT NULL,
  `Date_Of_Complaint` date DEFAULT NULL,
  `Category` varchar(100) NOT NULL,
  `Current_Status` varchar(100) NOT NULL,
  `Details` varchar(100) DEFAULT NULL,
  `Date_Of_Completion` date DEFAULT NULL,
  PRIMARY KEY (`Complaint_ID`),
  UNIQUE KEY `Complaint_ID` (`Complaint_ID`),
  FOREIGN KEY (`Camper_ID`) REFERENCES `Camper_Details` (`Camper_ID`)
);

CREATE TABLE `Feedback` (
  `Complaint_ID` int DEFAULT NULL,
  `Rating` int DEFAULT NULL,
  `Further_Comments` varchar(200) DEFAULT NULL,
  KEY `Complaint_ID` (`Complaint_ID`),
  FOREIGN KEY (`Complaint_ID`) REFERENCES `Complaints` (`Complaint_ID`),
  CHECK ((`Rating` in (1,2,3,4,5)))
);

-- Insert into Camp_Details 

INSERT INTO Camp_Details VALUES (1,'Camp Mohawk',23444555,'mohawk@gmail.com',3000,'United States','Conneticut','Litchfield','Rato Avenue');
INSERT INTO Camp_Details VALUES (2,'Camp Kiki',23333225,'kiki@gmail.com',12000,'United States','New York','Manhatten','Allen Street');
INSERT INTO Camp_Details VALUES (3,'Camp Wakim',23283645,'wakim@gmail.com',7000,'United States','New York','Sataten Island','Crystal Avenue');
INSERT INTO Camp_Details VALUES (4,'Camp Falcon',23999876,'falcon@gmail.com',1000,'United States','Philadelphia','Harrisburg','Connie Street');
INSERT INTO Camp_Details VALUES (5,'Camp Hammok',24544258,'hammok@gmail.com',50000,'United States','California','San Jose','Market Street');
INSERT INTO Camp_Details VALUES (6,'Camp Tumble Weed',33524258,'tweed@gmail.com',13000,'United States','California','Los Angeles','Hanley Avenue');

-- Insert into Cabin_Details

INSERT INTO Cabin_Details VALUES (1,1,'Occupied');
INSERT INTO Cabin_Details VALUES (1,2,'Occupied');
INSERT INTO Cabin_Details VALUES (1,3,'Vacant');
INSERT INTO Cabin_Details VALUES (1,4,'Occupied');
INSERT INTO Cabin_Details VALUES (1,5,'Vacant');
INSERT INTO Cabin_Details VALUES (2,6,'Vacant');
INSERT INTO Cabin_Details VALUES (2,7,'Occupied');
INSERT INTO Cabin_Details VALUES (2,8,'Occupied');
INSERT INTO Cabin_Details VALUES (2,9,'Vacant');
INSERT INTO Cabin_Details VALUES (2,10,'Occupied');
INSERT INTO Cabin_Details VALUES (3,11,'Vacant');
INSERT INTO Cabin_Details VALUES (3,12,'Vacant');
INSERT INTO Cabin_Details VALUES (3,13,'Occupied');
INSERT INTO Cabin_Details VALUES (3,14,'Occupied');
INSERT INTO Cabin_Details VALUES (3,15,'Occupied');
INSERT INTO Cabin_Details VALUES (4,16,'Occupied');
INSERT INTO Cabin_Details VALUES (4,17,'Occupied');
INSERT INTO Cabin_Details VALUES (4,18,'Occupied');
INSERT INTO Cabin_Details VALUES (4,19,'Occupied');
INSERT INTO Cabin_Details VALUES (4,20,'Occupied');
INSERT INTO Cabin_Details VALUES (5,21,'Occupied');
INSERT INTO Cabin_Details VALUES (5,22,'Occupied');
INSERT INTO Cabin_Details VALUES (5,23,'Occupied');
INSERT INTO Cabin_Details VALUES (5,24,'Occupied');
INSERT INTO Cabin_Details VALUES (5,25,'Vacant');
INSERT INTO Cabin_Details VALUES (6,26,'Vacant');
INSERT INTO Cabin_Details VALUES (6,27,'Occupied');
INSERT INTO Cabin_Details VALUES (6,28,'Occupied');
INSERT INTO Cabin_Details VALUES (6,29,'Occupied');
INSERT INTO Cabin_Details VALUES (6,30,'Vacant');

-- Insert into Camper_Details

INSERT INTO Camper_Details VALUES (1452721,'James','Dion','2003-02-07',87625341,'Lucy Dion',88765123,1,'United States','Arkansas','Hot Springs','Usser Street');
INSERT INTO Camper_Details VALUES (1672283,'Kate','Collins','2004-01-02',89222444,'Anna Collins',87654192,2,'United States','Pennsylvania','Fairmount','New Street');
INSERT INTO Camper_Details VALUES (1763444,'Hannah','George','2005-10-22',89627113,'Joana George',99333562,2,'United States','California','San Jose','Harrison Street');
INSERT INTO Camper_Details VALUES (1837265,'Emily','White','2003-04-20',72883377,'Harry White',87938222,1,'United States','Arizona','Phoenix','Capel Street');
INSERT INTO Camper_Details VALUES (1885678,'David','Ovard','2004-05-09',89888123,'Charles Ovard',83929345,1,'United States','Conneticut','Stamford','Creed Street');
INSERT INTO Camper_Details VALUES (1989921,'Brian','Kenney','2004-11-15',88763192,'Alice Kenney',89773128,2,'United States','Texas','Austin','Envy Street');

-- Insert into Activity_Details

INSERT INTO Activity_Details VALUES ('Archery',4,1,500,'Outdoor');
INSERT INTO Activity_Details VALUES ('Ariel Silks',2,1,10200,'Outdoor');
INSERT INTO Activity_Details VALUES ('Fishing',3,2,4600,'Outdoor');
INSERT INTO Activity_Details VALUES ('Golf',5,2,35000,'Outdoor');
INSERT INTO Activity_Details VALUES ('Kayaking',5,1,44000,'Outdoor');
INSERT INTO Activity_Details VALUES ('Music',6,2,11000,'Outdoor');
INSERT INTO Activity_Details VALUES ('Painting',4,2,780,'Indoor');
INSERT INTO Activity_Details VALUES ('Robotics',1,2,3000,'Indoor');
INSERT INTO Activity_Details VALUES ('Surfing',2,2,11200,'Outdoor');
INSERT INTO Activity_Details VALUES ('Swimming',1,1,2600,'Outdoor');
INSERT INTO Activity_Details VALUES ('Swimming',3,1,2500,'Indoor');
INSERT INTO Activity_Details VALUES ('Tennis',6,1,10500,'Outdoor');


-- Insert into Camper_Camp

INSERT INTO Camper_Camp VALUES (1452721,1);
INSERT INTO Camper_Camp VALUES (1672283,2);
INSERT INTO Camper_Camp VALUES (1763444,3);
INSERT INTO Camper_Camp VALUES (1837265,4);
INSERT INTO Camper_Camp VALUES (1885678,5);
INSERT INTO Camper_Camp VALUES (1989921,6);

-- Insert into Staff_Details

INSERT INTO Staff_Details VALUES (1,1,'Hannah','Taylor',90123333,'Amy Taylor',9223223,1,'Camp Counselor','hannaht@gmail.com','Ireland','Leinster','Dublin','Woodview Park','1');
INSERT INTO Staff_Details VALUES (2,1,'Katya','May',9212627,'Sarah May',8272822,1,'Camp Counselor','maykat@gmail.com','Germany','Bavaria','Munich','Creek Street','2');
INSERT INTO Staff_Details VALUES (3,1,'Bianca','Costin',7458383,'Ana Costin',7982341,2,'Unit Leader','biacos@gmail.com','Romania','Timis','Timisoara','Decembrie Street','3');
INSERT INTO Staff_Details VALUES (4,1,'Cleo','Elder',3823729,'Macy Elder',7262718,1,'Secretary','cleo@gmail.com','Spain','Asturias','Aviles','Catena Street','4');
INSERT INTO Staff_Details VALUES (5,1,'Henry','Coin',3618372,'Arnold Coin',3837261,2,'Warden','coinhenry@gmail.com','United States','Texas','Hueston','Main Street','5');
INSERT INTO Staff_Details VALUES (6,2,'Ruby','Rose',8091231,'Cate Rose',9271672,2,'Camp Counselor','rubyrose@gmail.com','United States','California','San Jose','Creat Street','6');
INSERT INTO Staff_Details VALUES (7,2,'Cirilla','Bordua',28273621,'Allan Bordua',3826151,1,'Camp Counselor','cirillab@gmail.com','France','Centre','Chinon','Sevas Street','7');
INSERT INTO Staff_Details VALUES (8,2,'Emma','Smith',9361672,'Sam Smith',7936725,1,'Unit Leader','emmasmith@gmail.com','Ireland','Leinster','Meath','Dunshaughlin Street','8');
INSERT INTO Staff_Details VALUES (9,2,'Claire','Walsh',2671838,'Sarah Walsh',3828393,2,'Secretary','walshclaire@gmail.com','Ireland','Ulster','Donegal','Quay Street','9');
INSERT INTO Staff_Details VALUES (10,2,'Sean','Elf',83721911,'Kate Elf',3926712,1,'Warden','seanelf@gmail.com','Germany','Bavaria','Munich','Enda Street','10');
INSERT INTO Staff_Details VALUES (11,3,'Logan','Carroll',837263483,'Hannah Carroll',3883382,2,'Camp Counselor','logancarroll@gmail.com','Ireland','Ulster','Down','Sage Park','11');
INSERT INTO Staff_Details VALUES (12,3,'Liam','Bradford',93671832,'Emily Bradford',7452937,1,'Camp Counselor','liambrad@gmail.com','Ireland','Ulster','Donegal','Elementary Park','12');
INSERT INTO Staff_Details VALUES (13,3,'Emilia','Blue',92812777,'Loraine Blue',2736523,2,'Unit Leader','blueem@gmail.com','United States','Illinois','Chicago','Clark Street','13');
INSERT INTO Staff_Details VALUES (14,3,'Larry','Sagart',1282812,'Mary Sagart',9782615,1,'Secretary','larrysagart@gmail.com','Romania','Cluj','Cluj-Napoca','Mirror Street','14');
INSERT INTO Staff_Details VALUES (15,3,'Carie','Sage',92983912,'Liam Sage',2825642,1,'Warden','cariesage@gmail.com','Amsterdam','North Holland','Edam','Click Street','15');
INSERT INTO Staff_Details VALUES (16,4,'Jona','Nasaj',12736812,'Anja Nasaj',2722331,1,'Camp Counselor','jonanasaj@gmail.com','Albania','Tropojë','Bajram Curri','Clya Street','16');
INSERT INTO Staff_Details VALUES (17,4,'Lia','Kat',18237777,'Andrea Kat',7722551,2,'Camp Counselor','katlia@gmail.com','Ireland','Leinster','Dublin','Capel Street','17');
INSERT INTO Staff_Details VALUES (18,4,'Rory','Gilmore',12166223,'Lorelie Gilmore',3677213,1,'Unit Leader','roryg@gmail.com','United States','Conneticut','Litchfield','Barry Street','18');
INSERT INTO Staff_Details VALUES (19,4,'Luke','Danes',3356126,'Lory Danes',1778253,2,'Secretary','danesluke@gmail.com','United States','Texas','Austin','Tex Street','19');
INSERT INTO Staff_Details VALUES (20,4,'Hillary','Blake',11177773,'Henry Blake',1777777,2,'Warden','hillaryblake@gmail.com','Spain','Almeria','Almeria','Barber Street','20');
INSERT INTO Staff_Details VALUES (21,5,'Jonas','Mitchel',12277651,'Anna Mitchel',1227666,1,'Camp Counselor','jonasm@gmail.com','Ireland','Leinster','Meath','George Street','21');
INSERT INTO Staff_Details VALUES (22,5,'Caitlin','Kennedy',17733552,'Michael Kennedy',7724532,2,'Camp Counselor','kennedyc@gmail.com','Ireland','Leinster','Dublin','Smithfild Street','22');
INSERT INTO Staff_Details VALUES (23,5,'Henry','Capel',12266534,'Lucy Capel',6637463,1,'Unit Leader','henrycapel@gmail.com','United States','Massachusetts','Boston','Litch Street','23');
INSERT INTO Staff_Details VALUES (24,5,'Kirk','Downs',12256712,'Lucy Downs',2332142,1,'Secretary','kirkdowns@gmail.com','United States','Colorado','Denver','Liam Street','24');
INSERT INTO Staff_Details VALUES (25,5,'John','Gillan',25615522,'Adrien Gillan',2274837,2,'Warden','johngillan@gmail.com','United States','Texas','Austin','Lamar Boulevard','25');
INSERT INTO Staff_Details VALUES (26,6,'Heidi','Miller',1276354,'Claire Miller',1254736,2,'Camp Counselor','heidimill@gmail.com','United States','California','Los Angeles','Rich Boulevard','26');
INSERT INTO Staff_Details VALUES (27,6,'Abby','Lee',6735625,'Sonya Lee',6736252,1,'Camp Counselor','abbylee@gmail.com','Japan','Shikoku','Takamatsu','Kagawa Street','27');
INSERT INTO Staff_Details VALUES (28,6,'Kathy','Onix',8367652,'Amy Onix',8735627,2,'Unit Leader','kathyonix@gmail.com','Ireland','Leinster','Dublin','Mary Street','28');
INSERT INTO Staff_Details VALUES (29,6,'Paris','Geller',8712355,'Emilia Geller',9826554,2,'Secretary','parisgeller@gmail.com','United States','Conneticut','Danbury','Legit Street','29');
INSERT INTO Staff_Details VALUES (30,6,'Sandy','Lane',8735672,'Kelechi Lane',8935653,1,'Warden','sandylane@gmail.com','Ireland','Ulster','Lisburn','Bow Street','30');

-- Insert into Complaints

INSERT INTO Complaints VALUES (120,1452721,'2021-07-05','Activity','Completed','Instructor never got a chance to look at my painting which was dissapoitnting','2021-07-19');
INSERT INTO Complaints VALUES (121,1763444,'2021-07-07','Shower','Completed','Shower head blocked','2021-07-21');
INSERT INTO Complaints VALUES (122,1837265,'2021-07-08','Cabin','Completed','Cabin door not closing properly','2021-07-23');
INSERT INTO Complaints VALUES (123,1672283,'2021-07-15','WIFI','Not-Completed','Wifi not working properly','2021-09-11');
INSERT INTO Complaints VALUES (124,1885678,'2021-07-25','Cabin','Not-Completed','Lights inside cabin are blinking at times',NULL);

-- Insert into Feedback 

INSERT INTO Feedback VALUES (122,5,'Door closes perfectly now');
INSERT INTO Feedback VALUES (121,4,'Shower head is less blocked but not entirly unblocked');
INSERT INTO Feedback VALUES (120,5,'Intructor was able to look at my piece');
INSERT INTO Feedback VALUES (123,2,'WIFI extremely slow and took a really long time to get it fixed');
INSERT INTO Feedback VALUES (124,5,'Lights were replaced fast');


-- Trigger for Complaints Table 

CREATE TRIGGER Decide_Status
BEFORE INSERT
ON Complaints
FOR EACH ROW
SET New.Current_Status = "Not-Completed";

-- Trigger for Complaints Table 

CREATE TRIGGER Decide_Date
BEFORE INSERT
ON Complaints
FOR EACH ROW
SET New.Date_Of_Complaint = SYSDATE();

-- Trigger for Cabin_Details Table 

CREATE TRIGGER Cabin_Occupancy
AFTER INSERT
ON Staff_Details
FOR EACH ROW
UPDATE Cabin_Details r
SET r.Occupancy = 'Occupied'
WHERE r.Cabin_Number = NEW.Cabin_Number;

-- Trigger for Cabin_Details Table 

CREATE TRIGGER Cabin_Vacancy
AFTER DELETE
ON Staff_Details
FOR EACH ROW
UPDATE Cabin_Details r
SET r.Occupancy = 'Vacant'
WHERE r.Cabin_Number = OLD.Cabin_Number;


-- View for all the Unit Leaders and their cabins

CREATE VIEW unitleaders_cabins
AS
SELECT
First_Name AS 'Name',
Mobile,
Cabin_Number AS 'Cabin Number'
FROM
Staff_Details
WHERE
Staff_Details.Role_ = 'Unit Leader';

SELECT * FROM unitleaders_cabins;
-- View for 

CREATE VIEW vacant_cabins
AS
SELECT 
Camp_ID, 
Cabin_Number 
FROM Cabin_Details 
WHERE Occupancy = 'Vacant';


-- Unit Leaders and Wardens gets access to certain files

DROP ROLE IF EXISTS 'Unit Leader';
CREATE ROLE 'Unit Leader';
GRANT CREATE, DELETE ON Camper_Details TO 'Unit Leader';
GRANT UPDATE, SELECT ON Camper_Details TO 'Unit Leader' WITH GRANT OPTION;
GRANT DELETE, CREATE, UPDATE ON Cabin_Details TO 'Unit Leader' WITH GRANT OPTION;


DROP ROLE IF EXISTS Warden;
CREATE ROLE Warden;
GRANT CREATE, DELETE ON Camper_Details TO Warden;
GRANT UPDATE, SELECT ON Camper_Details TO Warden WITH GRANT OPTION;
GRANT DELETE, CREATE, UPDATE ON Cabin_Details TO Warden WITH GRANT OPTION;
